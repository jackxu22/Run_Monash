# Run Monash (RM) 跑步嘉年华管理系统

## 项目概述

Run Monash (RM) 是一个跑步嘉年华管理系统，用于管理在不同季节（夏季、秋季、冬季、春季）在各个Monash校区举办的跑步活动。

### 系统特点
- **活动命名规则**: RM <季节名> Series <校区名> <年份>
- **例如**: RM Autumn Series Clayton 2024
- **活动特点**: 
  - 对公众和Monash师生开放
  - 每个日期只举办一场嘉年华
  - 持续一天
  - 提供多种跑步项目：
    - 马拉松 42.2公里
    - 半程马拉松 21.1公里
    - 10公里跑
    - 5公里跑
    - 3公里社区跑/走

### 核心功能
- **参赛者管理**: 注册、联系信息、大学身份状态
- **活动管理**: 嘉年华创建、项目设置、时间安排
- **团队管理**: 团队创建、成员管理、队长指定
- **成绩记录**: 开始时间、完成时间、耗时计算
- **慈善支持**: 参赛者可选择支持的慈善机构

## 技术架构

### 数据库设计
- **关系型数据库**: Oracle RDBMS
- **非关系型数据库**: MongoDB
- **数据完整性**: 使用主键、外键、约束确保数据一致性
- **事务管理**: 确保数据操作的原子性

### 核心数据表
- **CARNIVAL**: 嘉年华基本信息
- **EVENTTYPE**: 跑步项目类型
- **CARNEVENT**: 嘉年华-项目关联
- **COMPETITOR**: 参赛者信息
- **ENTRY**: 报名记录
- **TEAM**: 团队信息
- **CHARITY**: 慈善机构信息

## 项目结构

### 数据库实现模块

#### 模块1: 数据库schema设计 (`T1-rm-schema.sql`)
- 创建核心数据表
- 定义主键和外键约束
- 设置数据完整性规则
- 添加列注释说明

**主要表结构**:
```sql
COMPETITOR: 参赛者信息
- comp_no (主键)
- comp_fname, comp_lname (姓名)
- comp_gender ('M'/'F'/'U')
- comp_dob (出生日期)
- comp_email (唯一邮箱)
- comp_unistatus ('Y'/'N' 是否大学师生)
- comp_phone (唯一电话)

ENTRY: 报名记录
- entry_no (项目内唯一)
- entry_starttime (开始时间)
- entry_finishtime (完成时间)
- entry_elapsedtime (耗时)

TEAM: 团队信息
- team_id (主键)
- team_name (团队名称)
```

#### 模块2: 测试数据生成 (`T2-rm-insert.sql`)
- 生成真实的测试数据
- 确保数据关系完整性
- 涵盖各种业务场景

**数据要求**:
- 15个参赛者记录（包含Monash师生和外部人员）
- 30个报名记录（涵盖多个嘉年华的不同项目）
- 5个团队记录（不同规模的团队）
- 完整的参照完整性

#### 模块3: 数据操作功能 (`T3-rm-dml.sql`)
- 序列管理（自动生成主键）
- 参赛者注册流程
- 团队创建和管理
- 报名变更处理
- 退赛和团队解散处理

**核心功能**:
```sql
-- 序列创建
CREATE SEQUENCE competitor_seq START WITH 100 INCREMENT BY 5;
CREATE SEQUENCE team_seq START WITH 100 INCREMENT BY 5;

-- 参赛者注册
-- 团队创建
-- 报名变更
-- 数据清理
```

#### 模块4: 数据库结构演进 (`T4-rm-alter.sql`)
- 动态添加新字段
- 扩展现有功能
- 数据迁移和更新

**主要改进**:
- 参赛者完成项目数量统计
- 多慈善机构支持系统
- 资金分配百分比管理

#### 模块5: 数据分析查询 (`T5-rm-select.sql`)
- 复杂的业务查询
- 统计分析报告
- 数据聚合和排序

**核心查询**:
1. **最受欢迎团队名称分析**
   - 跨嘉年华团队名称使用频率
   - 团队领导者和成员统计

2. **项目记录保持者报告**
   - 各项目最佳成绩记录
   - 记录保持者年龄计算

3. **嘉年华参与度分析**
   - 每场嘉年华报名统计
   - 各项目参与百分比计算

### NoSQL实现模块

#### 模块6: MongoDB集成 (`T6-rm-json.sql` & `T6-rm-mongo.mongodb.js`)

**关系型到文档型数据转换**:
```javascript
// JSON文档结构
{
  "_id": 1,
  "carn_name": "RM Spring Series Clayton 2024",
  "carn_date": "22-Sep-2024",
  "team_name": "Champions",
  "team_leader": {
    "name": "Rob De Costella",
    "phone": "0422888999",
    "email": "rob@gmail.com"
  },
  "team_no_of_members": 4,
  "team_members": [...]
}
```

**MongoDB操作**:
- 集合创建和数据导入
- 基于条件的文档查询
- 文档更新和数组操作
- 新成员添加到团队

## 开发环境设置

### 前置条件
- Oracle Database (支持SQL)
- MongoDB
- Git (版本控制)

### 项目初始化
```bash
# 1. 克隆项目
git clone <repository-url>
cd run-monash-db

# 2. 设置数据库
sqlplus username/password@database
@rm-schema-insert.sql

# 3. 依次执行模块
@T1-rm-schema.sql
@T2-rm-insert.sql
@T3-rm-dml.sql
@T4-rm-alter.sql
@T5-rm-select.sql
@T6-rm-json.sql
```

### MongoDB设置
```bash
# 启动MongoDB
mongod

# 执行MongoDB脚本
mongo < T6-rm-mongo.mongodb.js
```

## 数据模型特点

### 业务规则
- 每个参赛者有唯一的参赛编号
- 邮箱和电话号码全局唯一
- 每场嘉年华中参赛者只能报名一个项目
- 团队名称在同一嘉年华内唯一
- 支持跨嘉年华重用团队名称

### 数据完整性
- 参照完整性约束
- 域完整性检查
- 业务规则约束
- 事务一致性保证

## 系统特色功能

### 时间管理
- 精确的时间记录（hh24:mi:ss格式）
- 自动耗时计算
- 开始/完成时间验证

### 团队协作
- 灵活的团队组建
- 跨项目团队成员
- 动态成员管理

### 慈善支持
- 多慈善机构支持
- 资金分配比例管理
- 慈善机构预审批机制

### 数据分析
- 实时统计报告
- 历史数据分析
- 性能记录追踪

---

本项目展示了如何使用关系型和非关系型数据库来构建一个完整的活动管理系统，涵盖了从数据建模到复杂查询的全方位数据库应用。
