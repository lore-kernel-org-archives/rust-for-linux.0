Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013002.outbound.protection.outlook.com [40.93.201.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48242E2DD2;
	Sat,  4 Apr 2026 02:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775268737; cv=fail; b=c2RC8nmZ6wS4PyMqjpLiuq+mYrumTG/jJ8aJY36JNCgm2XFSc5CaXYHhho8voRCbEwz/CCZQFJbX/dEQtLT474w2HtU1tnYdL3TpB9J1dbMrt0WBPdpUA1//qN9ws0ee9Y2U/xqgLQea9gGk6U2tlH+c6pGvX9DB/6WCeg7/hTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775268737; c=relaxed/simple;
	bh=Um1x+uzg1tln4Q1YYYs+yp5IwYpV9XGWWw2f7HM76rk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DBw/sIGgDs2i/a+a0jfPjy/+lHyC67I49Qu+WCt9gQ3jq/vbwE0QUb/V51H5ct/2Iy7TOCT3TtiecIXiMEl/5BhY8RbqzZ27zg12FW47ltAuK4bG5kPVSJK/NR8KGGiESpw2f7wGCFAfByNXVrfgvJpVi30rK0zWi55jLiWx14Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=F9Tlm6WL; arc=fail smtp.client-ip=40.93.201.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="F9Tlm6WL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d9pR4qzr3LEFj4NpGtP8PWADo/FiscI8fphHAYwv0H/crb57PGMkauVwAl2JFdk0xMlg/w2w7L9qw3g/l/Kd/tdb3mOzUWvqh50+plvCKiWuNEMZVTb5h09taI6rx/ryO+SV6r52BgcgbehRgDuysh7xu4Gxf63c3KrJ6LBm2Mzuui4/oga3NHc1h101WHedNzc2w7g+/3OR0zIh4YOjzYMTd2obymHh2Fi7LGHMu3Aq1P3I46AyJwTPuSOHfvxk5PRE2pnHTw/u6XHbYODRjN+cqJxG2dJH60GErFh4mveohIJXXZtBLqLD14LJ/OM8gU3zBOyhiPKVWkWrFL+9Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZtZBRWgORV6eyfH1JpUgwtGXksRKMb6WbL2Zr4PwDE=;
 b=Bn5i4N4sutEleu+getl/RWwlrZHnFRAFlVq+GbGUjuUY/BSf42CVZ1chYEyPOOVhc51uR/e5wCVqQjWs4UFYOwBV43K4+BPG9t2vW6CCjGD4RpHr6KJDwZfQejIptitskTQonERdcoIL3KqLjs9Yt7gEFoNtwJdklhhpqd/6uzuFLUOYNndml2gOYQ7zRRP16n6/4tyTQMYXTEHQ56Er7GoDMVnZ0L6DqXldAzpQk3UH2/KP0rcXJwU4AwmDOJlSYgr9jHECZuo2RJTjEhNVktQZlhUY9yKS0qJgLLQhcclUc13cqYS1TIxm6HM40s4OEUvlyd5llDRJYJ8clLFnLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZtZBRWgORV6eyfH1JpUgwtGXksRKMb6WbL2Zr4PwDE=;
 b=F9Tlm6WLKSO/2sFCks5yJfEx7/q/zrAl6sK+wYgO8dTCXSImVxP/wNduES18aOgmbhPVyrTf2enVyvN1PvuMCZf6M5JB3sSiY1+yACbZydopdAeZ4QjcgwCX5NEOzRYElLXv0+QjPzv8gffkma19QcX1ae71SmgshSh4knfrU9/5+uS1sAvnE4EehBfw5eHd0hpcgFjozhadyoIAHX2K3o/okkmW2cVgjeSL7/7xLbBJQJLyemelDKbbvDfgeuWfNxPrRtbLPpPxPFExvDwuPutn6lq1YU6iIFgJcn3RYVVgrVUD64EHJF4Q0xtLKvshPLLAXF7wd+qqe8z3v4+6rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CY5PR12MB6177.namprd12.prod.outlook.com (2603:10b6:930:26::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.16; Sat, 4 Apr 2026 02:12:11 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 4 Apr 2026
 02:12:11 +0000
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
Subject: [PATCH v5 3/3] gpu: nova-core: add task for device address type wrappers
Date: Fri,  3 Apr 2026 19:12:04 -0700
Message-ID: <20260404021204.339779-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260404021204.339779-1-jhubbard@nvidia.com>
References: <20260404021204.339779-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0088.namprd05.prod.outlook.com
 (2603:10b6:a03:332::33) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CY5PR12MB6177:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d729e25-cd63-4be3-18ec-08de91ef9483
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	WF2Gf/FKp1PU99Hm3grUASfndBUDnCCHXLSizyVLIfcEB4ZzlOL91xdbzfsVvWqIoq24EhyAgH0Noz7ncbIiJy4esAHmGn/Sts8GnJSDLZRCwwCN25hmVdXB89XIjbR0L/mJCXlHUduH67QqrlUsJZ3+4E3x9kosl/oTUaPKx9zjTqgMY3EWiHCyF+2k1hBAEDCHbHFkpwte6THCA7nZt09iJ+v0zfMog+N9x7cleBxFv+cL+1/HFwIEwp9u+7GJVru8DVYVIngrCltg52XLUXgiV1N1+R1ApecznnpfhuFjr2mRH3qTAn5VdMjLqtm45KySkNEU+o3ZVMsLmYQZgCMhz2pbH/cqXvogzLIiSe542KIiykVEgfi3jfZVgUoahs74o9JxJp9yIYgk8sIGktWg58jkLTrwZ7wlw3LOMkuqy4pfLHCubBiAaAtm6TwQdUo96ecxqrW05VEghkpAVOOJR7s1e2U3oKlQExiJyniOdG34lZOMBvd/5wDL7dQI/KGc/JdVf9YU01mER7DZR8PZoW6n/HLfPdj8gfpTJFVHMsM8EaiRfB1Re1bSJhdN7oL3FXv1MLY8e5a1g+ADX+Xp6DkEeto10u+DDU61Eii1iyHJIVPywnVm6Vp1DP+oNYqM83Z6QA4m/HuwMJ/9OMaESnPP8kgK+CnGk1H1Y4O5fWcwETvKCe5t9S9TW+CfNvttZio1DyxvO0SgIeOmUvM4RUGNDa2mgribQH0PBJs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MT981Hmhz7caS/TgF08KeepkLTzE+bNarqTFnmhXblwasnOx9h7BIFbxw3ed?=
 =?us-ascii?Q?Twi2MhJtSkChF9jb07qOpUezoMD7f4VRDSgfoi5GB9/64lIeDH8ACjBe/7/e?=
 =?us-ascii?Q?sVi3hxCpdNDJ/e1gvGANs5MFcvjgPxAaIyJXldZ3jVDmUO5RfXBbrIJNy+LV?=
 =?us-ascii?Q?cciMvHWxrb9MYjU11yOpr3+3D1s3I8IziZWBgVhQzOTTzyh5VDbvSgXPwCPD?=
 =?us-ascii?Q?xqAyz3PQX/ng0DJSakfjZMLylb0auAfODZ9nfTFKpBYNQl2u9iok3XN0+m/l?=
 =?us-ascii?Q?lAreZvDf/Ga19qNWoKYcQjhuXmL6jQ+jtbrqYJoc/nlw7lZVGqT22FUj35fC?=
 =?us-ascii?Q?t7hMFDTn37wNeOBj5Qit15e+fw4CH9/ge5tnvDm7aPab6lUIjxu+1mlEKL2F?=
 =?us-ascii?Q?8jo/OaZw0iGytUOzlu+hTl4R4Lcb301oD7FGwMKi9TcpG7AVk6Wsbrbz8irY?=
 =?us-ascii?Q?tH8XPNlRezHxFc4E/dxPOT+BCksmrQYmUQvVtBdmI1vcd2vYNNy0WRLNtuau?=
 =?us-ascii?Q?Evc2u7YCpIVEvRPk5354m6K6PZtEQOQzz275DECTlcSrGqO6PfezCnsT8cIg?=
 =?us-ascii?Q?kLAisIMqupEClh5lR5Ob2LU5El2PqMOScks3aem5QIpbP25HcVf9xB/xOz+7?=
 =?us-ascii?Q?bo0P07QWPv555zHmQKY86IG7l47H8O/dIcleIvZVXjEtQ31gvOslLojKuvd9?=
 =?us-ascii?Q?97Nred9fk7VE8h8vqJZcMzTAaDy0OX942hZK2i+xGBeBjH24qMjvqQpSxRrX?=
 =?us-ascii?Q?uRwGHm5eGWORwVH+zHL6/+5iZzNNMSl7rWUn8z+p+OQaWLI16Ja1aEixPw6a?=
 =?us-ascii?Q?rDOV6uaETBLiyHPUw0Q0ZrYtdsfCWm/+u5cAj0sO7RtTrqzg1DnvG4B9o96J?=
 =?us-ascii?Q?DaGi5dLDunWWCJT2js//llLukrN/G/vBzgomcMzoeuCzgr2vELPAyWo9vmy/?=
 =?us-ascii?Q?EYgYOc181pWwp5d3Zfe+Chy8sCcQ88/i42kY0TovXH6iONWg/F1ia+eMRrxq?=
 =?us-ascii?Q?CEId3eWQ+QYhMibvSmCrrBDP30tvPeH/8U1jfICd3Bbqibj7BEy+U8DUNhb2?=
 =?us-ascii?Q?w9Ms/RjBke+0xjrJwIexIkshCfHKFUxAcBqG7xpfDnWd2smO5917zYIpVQtv?=
 =?us-ascii?Q?W4ahx31zct1++6WN/15IcEBzlRX5w2aXwcbyHkgwJvcrIt8RYokobv9RNC2Q?=
 =?us-ascii?Q?u++ubGW5noHq6vcq2JFnKND+5cf1EwicpM+1T4avDpkIZc/2I9k8lMW0wVdk?=
 =?us-ascii?Q?qDIXvSDa3c21fRFcrhs1dKlm0ZRLJyN6qva9YC9MGjWLrfJ8XKaYz9EJ8WeD?=
 =?us-ascii?Q?7mwteixxPKdPhr22x/UInYmaMJJ/tSrVHetY6XyrlHPwCOhyjU+vY8n5VKHq?=
 =?us-ascii?Q?HJcHCU/QPK263Rh40bEnTZqsO9kxJ5EeCEO7E9HPKNg0VybPoKwUi3PBs98l?=
 =?us-ascii?Q?sK7HmIGhCxj0CRPNqrXcbdsPkbnAG92c8jZPl2YS5nFpxGXyB/RwCJsIZSHA?=
 =?us-ascii?Q?P4JC/VczaGHCl/Dr/ZpLpA0eMXaKFfWcdtJ/yn0yy5Xb4gKPLfUqc7J0OfhQ?=
 =?us-ascii?Q?lXn/HsDn0zB/7vDJVxOijf5bAoA0TMvSTyGk3u+TeY8Kn9GK/CdzvqYRwONA?=
 =?us-ascii?Q?ghs8SDO3Vx7FZEWKcwImhiJBH67YgbTXiaqoWB1bwpTJLJYe1kPzhM5YwiEN?=
 =?us-ascii?Q?gfVkbfrR/RbeIa6WsYz/1whcPg2dWeq1mlG+MkmpkoUDN3If/4ACt+iz2Woj?=
 =?us-ascii?Q?bGIES5+00A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d729e25-cd63-4be3-18ec-08de91ef9483
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2026 02:12:10.9610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mP8x61J4BaLUHs/JA5pjcyTc0CQvfrotiw7y8hmnRG397tkuVTTpF4jJZEP3REmHtFF3kkub1kvgEzZcjnFlqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6177

Add a todo.rst entry for creating newtype wrappers around integer types
for device addresses and sizes, with a marker trait that generic DRM
APIs can use as a bound.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 Documentation/gpu/nova/core/todo.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index d5130b2b08fb..c06f274ed1b4 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -88,6 +88,19 @@ SR-IOV [1] is work in progress.
 | Complexity: Beginner
 | Link: https://lore.kernel.org/all/20251119-rust-pci-sriov-v1-0-883a94599a97@redhat.com/ [1]
 
+Device address type wrappers
+----------------------------
+
+The ``SizeConstants`` trait provides ``SZ_*`` constants as associated constants
+on ``u32``, ``u64``, and ``usize``. Device-centric APIs such as GPU VM
+management and buddy allocators could benefit from newtype wrappers around these
+integer types to represent device addresses and sizes. A separate marker trait
+could then serve as a generic bound for those wrappers.
+
+| Complexity: Intermediate
+| Link: https://lore.kernel.org/all/DHJJJNP5T5FZ.2HWBMOEEKH9ZR@kernel.org/
+| Contact: Danilo Krummrich
+
 GPU (general)
 =============
 
-- 
2.53.0

