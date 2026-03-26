Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011032.outbound.protection.outlook.com [40.93.194.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B058339C63D;
	Thu, 26 Mar 2026 01:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489189; cv=fail; b=JT2dKG6/0k2gqPzJGkKV1JSwWKj7qYCoBLI0i1UyziNdFpoWtGcsnwCgZ+ayWVgQPRYq0jWqmI1V7lWqTZEsSqrlYo35Wm4cYdISg895/W2DWhCyNCwbaVMgyC14nK1w8ITG83PxKqre8VZ8g9D/y3Xe+/xwrGTj2bVFc2AFqUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489189; c=relaxed/simple;
	bh=QXup2X6QVYx2iF7/VAkQxaokRqmC7/APTyVHmR/aguc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TEUM1s5Jqo1xewcXqYrUYUZtZJHJ9VndIzrlMG0VOqtESqBFTYRblst9yEUnZjvd8zjP6ik9LEgbcTBdaHhnXUqtDpYRipkq8AtDKGzAQjVp2XmvFxy0iV0eI/lvVCdzXzvegh3uQKXfHmODJIAG+MUpL+EzSmCoSJnW0qSp+as=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=o2/98Oo+; arc=fail smtp.client-ip=40.93.194.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="o2/98Oo+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZFruDu7dHguWGkX/8H7p8JgnBL+Xs9hfjXO9SyVU0izMxNJ54yvy3FLoQbcxVJ/ox8V6Gm+Ap4jEsQb70s4vVBIROGVARFMgseSxnRobQ496ko3lFKdBgJrPAt5QU+W9OGMT7wrwC+UL2Zw4wtOakuieoR5N0moN9da0m+/4sRg/n6Eg27o7lWTH00GYIkDWHRZo47h0ybjo/uf8QLZq+Wg9m4lObV4qavOs7myYzx3ejrl6lLgr5EsbeFT9Pk0HsijP5O5cpRl+kLaffJTs1AnqUJpEe0EIh7Rnz+r/lsGK4AUlTAoY0X0jWgEP4VMl0Ox+b3NLOvta1J4ytyfFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pFEUmPE/MejBbNWQUvN3DQXLohTt4nlbTiIiXM/ZIxQ=;
 b=OqDhD5W2m/3aARbAJH+3URrTWRv9ZKWFEpTSI+AaqaTWGjTnm+fFrnOr7pUhjUoCgWisT0YIPjkdOFJchjoZp8FtMuAvkrerfXKdwyN+e4yBP3HcPeq6bSDYyOxkVbNpIZAfKOTHkTF/yQicDLvaRwLmza/a5FLRxud9q49IpuOeYh4izuMwhbBUX+LZk6PIV8xNOoNafuL/LLfVCq2N/3mrxQZyi6U3SNDM1zCOjSuKhDYBqzKa4mVf/88h6fROGuxMZOyCXlO/TnK8/07M4XrXYvDxh8zDGzPr4dNgAcOsHThtCujMwwxZaIQLM3jCsh9bOHt0IChLpuE5KFjk8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pFEUmPE/MejBbNWQUvN3DQXLohTt4nlbTiIiXM/ZIxQ=;
 b=o2/98Oo+3IQ65TCbc1CGH77DFdOLk3K2UxjTvIGxcG9ybnkXhhDFL4AgZoPhKXt1rbjboVafr6jqvqFfakvwe492mc9rmc6wOu/JtK/DCbHf4ST04gMw1k2Nbo+nJ4Jb3QAOeBufUE3apDPDvTNAenwvtBSHQtUZY3lwmIbD4OctFywJOWVKEstHnW5yF1YDypqNSlFwdStYyY21cD8SICfFtO58iw01owRS5sEdKph717p+yT6UxSVZRI+7T4sg4U8A2J3AkkzzXjdsRxOT1Jy/gb6t1UHMWLkxbdGNdtftUZyrasMtC/Zkc4JyZuUzQBk1s+gV0iVVY+KoJVsQdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BN7PPFCE25C719B.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Thu, 26 Mar
 2026 01:39:37 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:39:36 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v9 22/31] gpu: nova-core: Hopper/Blackwell: add FspCotVersion type
Date: Wed, 25 Mar 2026 18:38:53 -0700
Message-ID: <20260326013902.588242-23-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326013902.588242-1-jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::31) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BN7PPFCE25C719B:EE_
X-MS-Office365-Filtering-Correlation-Id: 77b1fcc1-a86b-410e-218a-08de8ad88a18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/HcF4CLnJM4hDj+kDubgSl0UerWl5ucQ7dh2xOu10OBTl43mpcuvHPCJU6+/PuOdehE3PV++wPkTN/FPbwOAJ8GAO7V+cMk3zCCTrgRKIcatMYsL0LqtPpa1GldHBmAxcsn97ulG6F2Qq3vEeon4ds+8uWJgS15mjqvvBK78Mdj0XHcXYc88ApW6EIWK+9ZBoOyj751SjEYNN7eumm+ZE3rUvmmb3z0GgdElW8wmK1HZpQAbdvUeVfuUvzOT1IBNs+aqh5nRgvYyrpci/4kmPn+VfQ4VQmhXno9fxYpH7pvVNo9TT5/9a0JRDjNQkTnW5HMttejm9tSUOJKfBL8Pvsott0dPF4h4Y+7cuiKKFx/2tmgmP8s+qaGy5NbW5t9gQoaqFFKmeehUTspuS5cl4lG1eXurAOIxIsu0rL5aQ4q7p437WaDS3aOPHfszLK1r8QAUko7u8KYawZI+0UnhSSMXcWpbweIzQCKBAUzMRA+IORPKn5CDLkOz5ml2oMyhXfEtGVOyafFXtSfscLDQ1CG35p3VPhXJyyzYKGh48ej89dVjNdkTkHuExZaa4isDuzvZt4bwokQC3tMBFS1HuOs7KGzym5PRKSvgG/ye7LD67bsCcXIlkyyQfVueca4R/4ditooHSBegPe+z6EmToU4m6LgrXQ4D3pqXD9MJ7tL39eRwS70hpm7nL0zlM9zqJhgV384zYTCos1ym18bWaaupqE0o41P27kj+Am9Pgyg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HZf4cXleFelkkKtE3Nc+AN0PdmeRZsNKg3EUYCfS9Hqa9nydqK5I8AsdoVmW?=
 =?us-ascii?Q?YxDv8GQ1ixD8GAnwc898RJdUHIWjOEiHM7gs28UJFnGXFrShwRU+u6bUQ/66?=
 =?us-ascii?Q?Y+GGIahCN256Rc88JD6HdmAzEqKPfTOu+/KRA70i/GczIQu56BWmnK6oUx60?=
 =?us-ascii?Q?QLoXr3SDVKXBxWccZKIQAJLLP/vOtqHJKYEssHCvBeN9CRY/IerL74ptCdvy?=
 =?us-ascii?Q?uLzH+z3iRiZnjftomtSfcKKw9VCKjVu/pHgWz6RaTrX2Jg6O28GJlnyhQcSy?=
 =?us-ascii?Q?gsq/e8zcJx+qeZZkuxyH85V7HdqadtN8VcIpUjDTMsZmUdY8nOjohUXLIDj3?=
 =?us-ascii?Q?GBb6FfUZVQjr/wAj1h8DdsAvwYSgcU2pP/IjW5qso1g6wBPcU7BZYBsZqMjK?=
 =?us-ascii?Q?+bULW1eO/EgUqcuhdKEhW0Ov3YbNX8uP0Ic8zkkNR4WGGjX5SKxWPgmL42lo?=
 =?us-ascii?Q?cTrmNSnq1UJirNL+TN+OuhQ09DLs1CBPUdeLIwuyDhDQRBU7xLGa38oZfuPf?=
 =?us-ascii?Q?Ir0sNJnTPchWRCRlWvqNyb31+5NhSgQyz6uOkIgrXF0+HpZGurEPZPw67bon?=
 =?us-ascii?Q?wkk09A7GJ8wmoOKa3BdlPGGpKy7i2nOdupMOSEFzMQA8OFIxvkXGgQvoqrzn?=
 =?us-ascii?Q?2G3+yqQYhISbclCsbbpe5J4HXOAILjaXJhExP9TZADKkI1NC5MMt5+7/yHwR?=
 =?us-ascii?Q?pBQ67g9Fv1Dl4RqizeK/co6RaZQMgkoeXTwGgfk0HAo6TuYDJNbCTw/1a87c?=
 =?us-ascii?Q?uPTgKv0u8R41B4fAcNZ/trKCQK2mk0+ye0ljSjGuQhED/5eLpiROeu539YCA?=
 =?us-ascii?Q?WBnQW1jTcRAWDs2BinzLbhjCXKdKfC6nsuKG4lCEtmD0PDURnNNUoqaZJc0Y?=
 =?us-ascii?Q?mfQrHK2F+r0HisKsR4MpLe5aGRmCiZwcT+2diZO+QTeChFm7DAsRH27Mnq71?=
 =?us-ascii?Q?cEraoG8KtCXqXfZMR50haEyrFpIbgU4Fn3/jMYvdfM9zdcQV4h2+jDFjY2Nr?=
 =?us-ascii?Q?o+pOjoYqlVCibfcvoQymphU6ZpFlZyzqHGJTTNGnEfpQIv84awZu1Q5isDPK?=
 =?us-ascii?Q?0OMXERerFjip2cC/RKiVGmzUbEPmg9LFBGCMLUoe3Q71JYepzKMR2GhGtJQM?=
 =?us-ascii?Q?AqcBjWyXZflIKOWtZ5Pa4nCgn6l4RTUCSGUJ9qOg1fWHW0qsMN8eOH8YPOZO?=
 =?us-ascii?Q?G72oijzvVnTm+CUuFgWRl6qpu6D11PRGxYdbf3IRbnPzsolsagv7QNznjb+j?=
 =?us-ascii?Q?iPA82Pwivxty6l4FNAa/eoBfCLiiZ/XHjahM0ovhXPbgRPBlt801hvGZgm+a?=
 =?us-ascii?Q?O74afDx0UxAvu2VRPCGvFJDJtJPHgK+1WaiS6f3L+96yU2Wx1Cf+/R7Tp2Q3?=
 =?us-ascii?Q?NxmGe8+I96pP9oZJw5mGHgpJZmdU+6PTM/e0bEYBjvBlEymWPYTipzr8zVKG?=
 =?us-ascii?Q?4OJ1cetbrun2Ho0ZzWaDERlhzbUjDuRfpRYlXotmjmlxBlrqLbB8iV3pLMng?=
 =?us-ascii?Q?9h6VfdJUUmXEsCwnRD6wHFcDCuyGHDbnksUI1C7zHtuMTzd/2NErsB6ZizML?=
 =?us-ascii?Q?OvVdEm88lxl7xHz1IcsQnG9pYva531wUY3Yw3IyGGwo3fnI7Yq6AVZ6OJhV+?=
 =?us-ascii?Q?EXnT1degne5K86PTUEd+1rvWjUTCwUEG4yPfFS9wjdw+tQWNpccN+krB2fRa?=
 =?us-ascii?Q?gnOVocYIzWcG3uZdCK4EREFjx3LJa/AWn+VfjqNJJxq3q7yGgpJgLg49q8OB?=
 =?us-ascii?Q?bSZZ5GoHNQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77b1fcc1-a86b-410e-218a-08de8ad88a18
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:39:36.9034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ziUBl3AnkxJ4y1DC/auBQBOkDJznv6PAJyD5tO2t9WvJkR7SMJp1/IRbqGcpfq41J03SETZkdLRt4/ND7yFQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFCE25C719B

Add FspCotVersion to represent the FSP Chain of Trust protocol version,
and Chipset::fsp_cot_version() which returns the version for each
architecture. Hopper uses version 1, Blackwell uses version 2.
Non-FSP architectures return None.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs | 19 +++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs | 16 ++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 931d806c3db8..db07fc227aa1 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -25,6 +25,25 @@
     NvdmType, //
 };
 
+/// FSP Chain of Trust protocol version.
+///
+/// Hopper (GH100) uses version 1, Blackwell uses version 2.
+#[derive(Debug, Clone, Copy)]
+pub(crate) struct FspCotVersion(u16);
+
+impl FspCotVersion {
+    /// Create a new FSP COT version.
+    pub(crate) const fn new(version: u16) -> Self {
+        Self(version)
+    }
+
+    /// Return the raw protocol version number for the wire format.
+    #[expect(dead_code)]
+    pub(crate) const fn raw(self) -> u16 {
+        self.0
+    }
+}
+
 /// FSP message timeout in milliseconds.
 const FSP_MSG_TIMEOUT_MS: i64 = 2000;
 
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 8332ad67c0af..ab378c0297c7 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -21,6 +21,7 @@
         Falcon, //
     },
     fb::SysmemFlush,
+    fsp::FspCotVersion,
     gsp::Gsp,
     regs,
 };
@@ -132,6 +133,21 @@ pub(crate) const fn arch(self) -> Architecture {
     pub(crate) const fn needs_fwsec_bootloader(self) -> bool {
         matches!(self.arch(), Architecture::Turing) || matches!(self, Self::GA100)
     }
+
+    /// Returns the FSP Chain of Trust (COT) protocol version for this chipset.
+    ///
+    /// Hopper (GH100) uses version 1, Blackwell uses version 2.
+    /// Returns `None` for architectures that do not use FSP.
+    #[expect(dead_code)]
+    pub(crate) const fn fsp_cot_version(&self) -> Option<FspCotVersion> {
+        match self.arch() {
+            Architecture::Hopper => Some(FspCotVersion::new(1)),
+            Architecture::BlackwellGB10x | Architecture::BlackwellGB20x => {
+                Some(FspCotVersion::new(2))
+            }
+            _ => None,
+        }
+    }
 }
 
 // TODO
-- 
2.53.0

