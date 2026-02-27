Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010012.outbound.protection.outlook.com [52.101.201.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97245355F2E;
	Fri, 27 Feb 2026 12:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772195598; cv=fail; b=a8DIQExkB7hbH3LDub2nvH+r1l2UmDQCp+66AiU/8SfLUgtKmOD2avvbUw4BYITAgIOOlS658DVTcJwlwXV+wMFqk1daQlD0gr41dznPZNBDNYekxI0dBa3KkaC+Ev2p51nxkyPZ2HbpYCiwvpQh8FdZHt3Sh3VHYrEXiQ6I4XU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772195598; c=relaxed/simple;
	bh=yLVqh3/tUIgZ6154vYVenzlJEypXnafhBLYWkjrBwYo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Lebc2anS80N67CPEi+ByDLoGuzD5xfIFp2/7JReeg3Yh4K4pEHlY8bCcgXX+Ta4xdF94b4MfbuR9r7t4Vp/zQbQZCKfrTixqBpD2Zp0K9NjAafLOVCBnD7hwH5a/Y/fA9kx9FCaILnDenxj41qLRA/6yZ4rGSk0qWOcRXzOxHiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KX6t5gcl; arc=fail smtp.client-ip=52.101.201.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KX6t5gcl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LoaD6MTLq6cxH+o1tW+akUVpAA9x3fUnHL+9CNlGAdFU4xpLrStUJEYjAo1KOkwT7GlgqLh9RcxzlaKSxQwzUgSXA8m2uah8K0Eq6bhRqQBL/NPfdxhb6j7uVmEhwmiMO6YTTnTTReOfD15F4TGQwYd7yrqPi46X2pHX/Inli+AMXF9eGrQ9/MKGAzIBUaqORjdo/6/UIudBGDzb++YBV0YOmMQKbAkCoNUZPTyHdOMq/dWE542/DTPiXXobO4miSugS3ZW7l7tTRPcHchgOlSljgDCD4UA/VhNeJYmszm4WrbrFUtKHf55V7xMSbrt5Ynd9TdyhXgMlIQRiUAJH0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkQUAiI8BO1fZwi7EThFcxQOmc5ekKkvjpN3rSueTuk=;
 b=AWd6RiQsWdJOiXgrcqALJhSRvBQAAwkkuDsHMuLb5sS9lRCu0MWr3NzDPFKZzUGZGeMG9Y2pVCsPA0GAB20w6Pj1eA5UeQE9c2HpeekskUkIVb16zo0+AStW45rm+PATIVypAqHwM4VBypSBwU78dWkRji3jIE86Wwf0QiJPjm2zs549VAGh2w1mqlMlWd7rEDORuP3Gltd1sj04Bven3dLiHx1tEbYixcYdgWIJesJ2eLVbB2U/X4Z0bCRRh9we0owWEM7aY8dFKlEph/1kaAuKI5ggA8xeNyUnBZZvrw7PdImtp5+pZSnI/V5TOYmZOfua/x72Hml7fpCQOx6uBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkQUAiI8BO1fZwi7EThFcxQOmc5ekKkvjpN3rSueTuk=;
 b=KX6t5gcl1RdLCOvegph26GWHhxv/ZYLJMQK6Hk52uWSHtyW5nj4ST9lhQM4GDIrv3/s16X0gmk5uozsq1jFU1GLgwHhzLgz3X/kHCSCcqyscdmUP6CH28enNPBowm16lju8tRsXjYIlyiEepAtYBK2dgK72zBK5MSIFj2VZhyekGf6Tsz4jrP4quby8Q0ql3Be2zHQUPOLvVF4roVA4tNMoeEzuBJnI3RKLbt+migBg74oBayZx5LccD9Yui2O7/InmPbkssx5CimryhyAjEWmpWvBh2QU85PebqZQN/TXEMLwI7Og2/Ftj6RjUMt2Pmtvypf2SsnSK/I1kUwiBtkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by MN2PR12MB4287.namprd12.prod.outlook.com (2603:10b6:208:1dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 12:33:11 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Fri, 27 Feb 2026
 12:33:11 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Fri, 27 Feb 2026 21:32:12 +0900
Subject: [PATCH 7/9] gpu: nova-core: gsp: add RM control command
 infrastructure
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-rmcontrol-v1-7-86648e4869f9@nvidia.com>
References: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
In-Reply-To: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0159.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::15) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|MN2PR12MB4287:EE_
X-MS-Office365-Filtering-Correlation-Id: 22a5d3ca-8836-4544-0101-08de75fc5e95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	BnPSG6SFOk23G54qceeu9xkyoSQei0M3Ic0ipMon8iB/VDEYCf/XnTcMHJqnepcl+w225J8Yiw/WNm8RJGtDfFkeMYv/V5vGZKSUln3yR01zMMekBsF9W1Y52YkIrUhn4aXGQ6RWtcC+00W4/nBQAKpaQ51/96jdX3RLh3dnB3LFow0i4Mjk2bP78VXPyJwNhjdYSu00VXyFiTCaOYOcMR/GZChnWHtQYc+QyF9i3PuKDQ23ulB3HSKaJglmgJXJP3Vx/OFw/lxCPqYQ5bVYdeWiUgQAPNxaJ0y9KchaaaJW4E7n7cT4DxuiOWA6ZmKehZOaAZ1G6SUclebemqCkpdG8lmc3E7t9NOTe3tGPk+8RCF4/g2ltwCx7zucG+ALLRj1e2LtVDrXo6OfWHxvrj2SCAaJNxvcDe1rcimoSJwGPg79Qe9Jd1KhXVmLtnnkRZP2LHq9Cstz3sVbNbOskTLJofwIbq71rkHwOsIUZvj0uIm4x4PuyUDwx8xQ7D1FG/YiXk7wVamisRoLTd0bai7a503YrNbhkWjIiuQWBgllAg1NhYweyS1WtLw1hzS0EzPBs1odE8PJThCZJLjTn2jUH3KIuv7dX8G3e3xeaVg3AJfKpmeggYRvSKc/MCxoD0Lz17qGN9uFJO08ksS1tXYf1XAEMIk3gHjjBQJ7fkf07M9pJvCBj9/LkLWjFK/wg7nj+vC3hzz5pwsXgFDZcB08u/Kh5br/2z0bkdMNpBu4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjFyb3ZyZzFuU2xtVnc3eFJacmxEVVJJWjlNUHFLcldQdFNNNXFsSW16aVlC?=
 =?utf-8?B?MEtaTXplTW54QnJnUlU2Q0RZOTYvYWRhS3oyYnR5T0Vrb3kzY292a2I5aE9q?=
 =?utf-8?B?T01GcDhjeW5tRFcxYUVhejZoQTZDbGgxQWQ5cytJZ0t0OGU4SW12TWV6YXQ3?=
 =?utf-8?B?YitvaXFCTjM0Z2tmUm9nQlNic3MwNzlzK0xqVmU0TjVKSmk2eDRiZG1qRTRS?=
 =?utf-8?B?Mk5VNm1OTHk3bmxVYjBrMmVkQ2xiZ1Robmw3T1NldXJiZ1lTL2J1Zko0Y1pl?=
 =?utf-8?B?REk3UlRDRUN6TGZGWTFLbHYyZVpxV3FRRkRIaERWM1NCcWMyNkhuOTZZdXFw?=
 =?utf-8?B?VG0yQ1JoMGFJazlqTkxndUE0enhmOWViczFlSEk2WWJ3R3pqQXVZNzBpcXdK?=
 =?utf-8?B?T0g0RGo0eVRTKzY3cEpydFk4dk5hODl1bTlUdEFJdEdxSXd0YWwwb3NyQzh0?=
 =?utf-8?B?d0tvcWpsYnpsZ092L2pYWE9MbkRMbURMcW5ncTZGRXZUb2FKRXkwU2xhME9l?=
 =?utf-8?B?VGxvR2Z5N3NwektaL040M1hOaTVwU29KRWZQWE94U3ZrVUxIV2F1QWJaUjRE?=
 =?utf-8?B?UWFDcUl4Q01KSzBJenEvTXJOTVhNUjU4eEFDSmVBZjNMenoyVmQ3YUptekkz?=
 =?utf-8?B?dUo2TXJ3WUYycWlZZ2VhcmRlZzlXRVl3YklNZng1dzVTbHRVMm9zTm14cGlQ?=
 =?utf-8?B?azNBNFc0Mk9Pdkd0eUdPR3d6bWdDU011VkxDcTJhcFZ1UWtIWUZDWlJtZTFG?=
 =?utf-8?B?TERMY2J3OWlhWi9rYWwwVGtEbVhsRWtQRkh5cWN1eWZqTkVRZDRnQ1N5Z0NN?=
 =?utf-8?B?Z2ludmtmeDZOV0ZMbFJDYTh2Q0RjekMwbjV3T3h3U0VldHd1OEU4ZGduVS9C?=
 =?utf-8?B?K3ZRTmdtOEdtZ2tnTGs4S1VuMFBHR0ZLT2xTOU1GOFgyVGU0ckVEeG1ycWds?=
 =?utf-8?B?WG1Kb1lvSTZVeU9FQ1dlV2dTOG4rK0hqM1NNcVZPWWY1ZEk1SHFFQmFwOFRx?=
 =?utf-8?B?SFBpajBSa0ZFYmhIdm0rT1BKdWZOL2dYZzhUTDQvREdCVFVLVDVPN21EMVBq?=
 =?utf-8?B?UTJjU2VjaDhNSGptbGp6Mm5iWHZhLzBHc1dkZjI5ck1ZSjFMM3dTcE9tanlp?=
 =?utf-8?B?QXp5TW9MaDJmRG5Ed0hDa0xJVlpGZ3FHMzcvdjhNYlJsQW8wL1I3aWFpYmNQ?=
 =?utf-8?B?eit6TDJiUjFTU0Zqa0xEbkRINFBoTHNOVjV5S0pHYjZ6VFRua1NjZ3FGZ2Q2?=
 =?utf-8?B?MkRnZWQ2T2xzY05jZm1YQW5qMzA5d21ZYzhPUkJxVS9ISk4vVzBLSWxSeGZH?=
 =?utf-8?B?b0l4U1VoODZxMyszWkN1MW5ZVWw2RHIzdDdOd2dJMXprV05ISXJkWlpFWEhS?=
 =?utf-8?B?NDRGQmlzNkt5Z2lFa255UndZcmVyaHYwL1Q5UDNtRForbHhjTFM5elZiQ2t4?=
 =?utf-8?B?QlUxYlpTWCtQK0NpTi9BN2ZPNXIwTVdEVFJUcFFSSkFjbTRFNDRyTHRyY2cz?=
 =?utf-8?B?cTRqWkFEeGtMTk1VVFd6V0R5MUNVdVhZdE5uazh6SFVFS09OZlhOUmFLb0ZQ?=
 =?utf-8?B?WCtLYkllTWkwN3NOYzgzSC9mQ1VDVkI3bmp3T1RaTUc4SkV5dm03ME5FMHBl?=
 =?utf-8?B?M21TN1JwMjh1dnZmdXpDdW9JOXQzelVRL05pdS9yTVN1YWoweXNYY0JZajN3?=
 =?utf-8?B?WGo5ZG8vNWV6NkgvWUkwZ1RZRVNZeGQrLzdLUWI1RnQ1TlNsZmVxVWpaNjBh?=
 =?utf-8?B?R21MeG5DbExVa2RZZkJXTjRQcWxnbnEzK3dPcEdnNE80QkZDcG0yOGNQWDBX?=
 =?utf-8?B?WXRUTTdNRkJldlV4aFhGME9zWjFhcys1RGg5M1p5UWRVSk5tTXNTOUo1bUhM?=
 =?utf-8?B?ZUZLNkI4b3poOEo1YkVLa1lrZm1YRG8vTFdhQ3MrVXByYTdTLzhRS0dIdnhQ?=
 =?utf-8?B?RmN1bmx5RzkxNXpXU2l0dDZwZzlXdzFuTFpueStTRDAvUmd2QkhLVEdlUTJV?=
 =?utf-8?B?enhyblZNa2RPZmtncGxFU293MFpVN0tzaTdrMmZZWHFpNmxlY3VWdXJxbTk0?=
 =?utf-8?B?ME81N081SDNGUkFqZ0JvQkNZNWZCYWNjUzZjcU1NQjBSNFc0SGQ0ZDZEQm1X?=
 =?utf-8?B?bHRHS3FteXZTaVluczkxeldvRG9HbGg2NlREcEYrN3lXWVFsQytadkNaSHEr?=
 =?utf-8?B?cDNBU3Rpa29ydkZNS1JCdVM1RHlaR0M1cWZlTVR3L29LSjFiMWNaWThxMFA4?=
 =?utf-8?B?enYwdGFFOUVuamd0ZWlVa0h0QUkzVEhYZDZJMkgvUmxkZFVadGxwWFRMWkMv?=
 =?utf-8?B?TFZhRzBTSUI0dEN1NXVqZ1BHdUEvWTl6OGcvRlJWZkJJb2hGcGxySmthc3pL?=
 =?utf-8?Q?1+DdJK0Kxg4Cdu4ESKCgt1Vqah2I44kcGn0kJZrN0w/+v?=
X-MS-Exchange-AntiSpam-MessageData-1: zJReFz0ipqnlEA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22a5d3ca-8836-4544-0101-08de75fc5e95
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 12:33:11.3100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xnyB9bJR8rlCd1VBqr8T3AC1s/evcw5duBQzJf88CASkdJiFp7VqmpXG87n5YcFQuyjej3D3D48M2wu32qHOsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4287

Add `RmControl` which implements CommandToGsp for sending RM control
RPCs.

Add `RmControlReply` which implements MessageFromGsp for getting the
reply back.

Add `send_rm_control` which sends an RM control RPC via the command
queue using the above structures.

This gives a generic way to send each RM control RPC. Each new RM
control RPC can be added by extending RmControlMsgFunction and adding
its bindings wrappers and writing a helper function to send it via
`send_rm_control`.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs             |   1 +
 drivers/gpu/nova-core/gsp/rm.rs          |   3 +
 drivers/gpu/nova-core/gsp/rm/commands.rs | 111 +++++++++++++++++++++++++++++++
 3 files changed, 115 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index a6f3918c20b1..1a1c4e9808ac 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -17,6 +17,7 @@
 pub(crate) mod cmdq;
 pub(crate) mod commands;
 mod fw;
+pub(crate) mod rm;
 mod sequencer;
 
 pub(crate) use fw::{
diff --git a/drivers/gpu/nova-core/gsp/rm.rs b/drivers/gpu/nova-core/gsp/rm.rs
new file mode 100644
index 000000000000..10e879a3e842
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/rm.rs
@@ -0,0 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0
+
+pub(crate) mod commands;
diff --git a/drivers/gpu/nova-core/gsp/rm/commands.rs b/drivers/gpu/nova-core/gsp/rm/commands.rs
new file mode 100644
index 000000000000..16bcf88644db
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/rm/commands.rs
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use core::{
+    array,
+    convert::Infallible, //
+};
+
+use kernel::prelude::*;
+
+use crate::{
+    driver::Bar0,
+    gsp::{
+        cmdq::{
+            Cmdq,
+            CommandToGsp,
+            MessageFromGsp, //
+        },
+        fw::{
+            rm::*,
+            MsgFunction,
+            NvStatus, //
+        },
+    },
+    sbuffer::SBufferIter,
+};
+
+/// Command for sending an RM control message to the GSP.
+struct RmControl<'a> {
+    h_client: u32,
+    h_object: u32,
+    cmd: RmControlMsgFunction,
+    params: &'a [u8],
+}
+
+impl<'a> RmControl<'a> {
+    /// Creates a new RM control command.
+    fn new(h_client: u32, h_object: u32, cmd: RmControlMsgFunction, params: &'a [u8]) -> Self {
+        Self {
+            h_client,
+            h_object,
+            cmd,
+            params,
+        }
+    }
+}
+
+impl CommandToGsp for RmControl<'_> {
+    const FUNCTION: MsgFunction = MsgFunction::GspRmControl;
+    type Command = GspRmControl;
+    type Reply = RmControlReply;
+    type InitError = Infallible;
+
+    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
+        GspRmControl::new(
+            self.h_client,
+            self.h_object,
+            self.cmd,
+            self.params.len() as u32,
+        )
+    }
+
+    fn variable_payload_len(&self) -> usize {
+        self.params.len()
+    }
+
+    fn init_variable_payload(
+        &self,
+        dst: &mut SBufferIter<array::IntoIter<&mut [u8], 2>>,
+    ) -> Result {
+        dst.write_all(self.params)
+    }
+}
+
+/// Response from an RM control message.
+pub(crate) struct RmControlReply {
+    status: NvStatus,
+    params: KVVec<u8>,
+}
+
+impl MessageFromGsp for RmControlReply {
+    const FUNCTION: MsgFunction = MsgFunction::GspRmControl;
+    type Message = GspRmControl;
+    type InitError = Error;
+
+    fn read(
+        msg: &Self::Message,
+        sbuffer: &mut SBufferIter<array::IntoIter<&[u8], 2>>,
+    ) -> Result<Self, Self::InitError> {
+        Ok(RmControlReply {
+            status: msg.status(),
+            params: sbuffer.flush_into_kvvec(GFP_KERNEL)?,
+        })
+    }
+}
+
+/// Sends an RM control command, checks the reply status, and returns the raw parameter bytes.
+#[expect(dead_code)]
+fn send_rm_control(
+    cmdq: &Cmdq,
+    bar: &Bar0,
+    h_client: u32,
+    h_object: u32,
+    cmd: RmControlMsgFunction,
+    params: &[u8],
+) -> Result<KVVec<u8>> {
+    let reply = cmdq.send_sync_command(bar, RmControl::new(h_client, h_object, cmd, params))?;
+
+    Result::from(reply.status)?;
+
+    Ok(reply.params)
+}

-- 
2.53.0

