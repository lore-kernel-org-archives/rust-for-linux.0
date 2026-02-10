Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010064.outbound.protection.outlook.com [52.101.201.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE92E2EDD58;
	Tue, 10 Feb 2026 02:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691625; cv=fail; b=GDgQH2jdNLU6OcxmLiuQ/Q71uc71bk9KlzdsdTPRE7EtXc3mZtd/lLFLOlogoKPxowDXdK8Zev1m2h9FnV5IVU+0/QcEz1xmfU7BqFuj2r4ihsadI5nqTQ13WDJHZKACLzbXJbWIZtA82yfFTaHnWhiLYvWag5WoNBKS9eQKsDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691625; c=relaxed/simple;
	bh=rf+b28FqRMeG+NCTfMMhREYFQSHiYXvUGeJwrLdWj9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tXs9yunc42f6cDhM6R5Ja2Ko547YocCMR3djZTpdi4P6+ptDh/gjiSFduB690if4DQF5FxMDNtwAjaJGnj6w23moCW7sNX600KxFfQzl7o7tVV9+Swl4WQ4KoKn0HcusAdCWHEBPNU68QqYAvljhDQo49YX3/q+iMTUkbkZSEB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EnAonXgl; arc=fail smtp.client-ip=52.101.201.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EnAonXgl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOKVWZDuGpQwKhTpMWOVhJYv3HQ9hPLrWz/qTtqo5LTb1K2PAfMxSIuaK1VnmZ2z5R/BVwpKEfkk9EfvPwnHkTPA0MgayLcjnVB9Pr16ltCxTQZLjMspuSLFkdbRXJWwdD5Bi4k9nFiPudAnsW9lnq+/xHZzuZi0M073QVz/CAFfTTZ4l17wUKF9WC80aPoI66YAiEC2/auGtMQ2PBxqjOi/kjvDB3sTAFPjmS/iXC9QPnOnZQ6t98CINPPzj3Pe0Ijr9z215pmlH5QpJ0UwQKJWsL+pfQ0g8sPZoOWThHA1DDoRzs84uz7LLTb27pLOSKjulz+Sw46UYNhtOnrovQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4IloxjJh5i0FuUg67u2agneadaThbWYDMT/dQnlwuSY=;
 b=YyNrC/LqDSaWupsBPcEfZqHGCpIrUm5lJ1njNB3uYTMcsFe8lZJGRvRKexvbvN9FuQ1w1Ol3P45OJXBcaQvq/e9nm5R24mMuR61O5+sVV4oNcaxOijbN6CUPA4s1Gz3z/hrKW1lfHMOWCn4rkrRWy0dVvGHEcvKioxT3vlxuaxRS9KgKDzT47mUf5BUMoTbwi68xplr19sAJlgVwDO74IMgeMo9XWNFP5U8+siSRtHlCu+UoN9/8Q55rc3X0SiGzXTLK2XKfqNX4rwhBUZPKWIpPmu/CeuyK0JFyZ3EvtL/oxZoviNsO1pX9TvclAFS7ISqDGwPS5cb6m4BB/zMPZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4IloxjJh5i0FuUg67u2agneadaThbWYDMT/dQnlwuSY=;
 b=EnAonXglREwrvrZJBGgb2O1KsG+zUgiw9CuCKLWGE7vEUvfHcRaFdCVIYnxUO/q5xeZlKHIJ0sVBesInrUoM5tpJ+26UOvwQ65dGNhOPNFNrGy1aNs9WPzlZb7I9xBOGLuAR14FjB+1HZzn+9/71oNQBDdiU3yaXgoFhRlk5+Aw3b6zW4qFwKivx4La6RetGlyjAoUCqKJuvPAVETSGn2Ha63BR1S6p6w2Km3b7w6BJlzhTJvf0QNunkeEbYEHjL96g7CNK///K9DikkiZNe2DR98FaROwtBM6h3sTzN/YWVaRhmTilOayldUyUbC5BXQaiUZczoVrOVLWKmU3F/+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL4PR12MB9506.namprd12.prod.outlook.com (2603:10b6:208:590::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 02:46:59 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:46:58 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
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
	nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v4 26/33] gpu: nova-core: Blackwell: use correct sysmem flush registers
Date: Mon,  9 Feb 2026 18:45:53 -0800
Message-ID: <20260210024601.593248-27-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0058.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::33) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL4PR12MB9506:EE_
X-MS-Office365-Filtering-Correlation-Id: dbb67e52-9316-49c6-a038-08de684ea90c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+7wqZ2KfNdtBJNBtY4AP2cgz+4oPQKSiauG64rb5MvdixCvNvsI40Czkx5ab?=
 =?us-ascii?Q?Ol7kbwr1nmtE1JOyrKX8YtLRIX1WUNSpgf9IcHwFPP1sCL87b4KX8U7gsAG2?=
 =?us-ascii?Q?4TcRFUKsQj81iYInBTnqeAijW3g3Nr2keopiE7VRHoX8gH+K0aQhUYK8Qkgt?=
 =?us-ascii?Q?GnfOYKlAg66flE85NDFjzpibJrzFJytsHJ4mRiDtrF3vZelxzlSfUnb3qaff?=
 =?us-ascii?Q?aTav7L88Hot7UrkNIr0pM36I7e51Ipcci07R15JdLbC7HVXxusIq/FGDksJq?=
 =?us-ascii?Q?Wt3l+yVrLeZIfXZlgvNsRO55FB4umZLAfeCg/LxAWZ8ZMa4R242lc6GJkMFb?=
 =?us-ascii?Q?OqdHAcg1cmTiifww0gqVwwfWuHR5q2usMkjwJQMGkIOOdB5HcDdug1cV5LHH?=
 =?us-ascii?Q?hGzS+k9dSqLe2+cYrB89sjAvk22PUATYnhrCaM5DCGHluuHnYw7GNQwKYik8?=
 =?us-ascii?Q?YHIqgaw0LRFSVAQ3EyF6i09htHJaQViWs+RQ4yEiNctkeXgSn4d2gB547sSb?=
 =?us-ascii?Q?n3TSH3HQRUmucRrtti+XVNB3zwQIwi1jfVjw2a5PrKzuR4flHoaPvBu5c8iS?=
 =?us-ascii?Q?vJWl1V4cU/ox+RU892Oc9oxm3bzwDK3U7TCMC5pIKIAGbYJvd2tPovUAhkPH?=
 =?us-ascii?Q?vzUp5li+oxeA8qbEJTumv2ID0zhzqYDbJMzsksboi0n9aNJPOT7Oz6xrh1C0?=
 =?us-ascii?Q?/plr1oUbTty8uIev7xTaNY2UbVuKesZOV2wehPKz0foO5q6W2JrJhN9EfG4R?=
 =?us-ascii?Q?gxTnwi2CDF2VPh40yv7IxmKITgx8hgJf5/Rz2/YkI/R3sXkpiLtsoye8WMGu?=
 =?us-ascii?Q?JJvqxFttGLckwMhnNoUz+e0tpQFKfZpk9edr3cf/q8Kvgqi5wJ11rwLquMMR?=
 =?us-ascii?Q?BVbQfAvnqLYFAyqRpv8yy94xjeEnOOm1mD/m4Wawy4UzwNUxw4JAXfSx73CW?=
 =?us-ascii?Q?C/NOzpBnAISnFYzkIDZbKPO76wjii7N6Q3Z3FYj4Zbix9Kz+9XADV2WiQPD7?=
 =?us-ascii?Q?DzfbIqcxGyH4SrEOWcuaVD+xaSljMQkSAIKHwDMUY5qXicOPBz1Rw6DYVlVR?=
 =?us-ascii?Q?WCmjYuUtaGw1PGyI1XjeAa/a3/zt93KXifYC9CH2NeMOSvG29ReD+FLwkKSW?=
 =?us-ascii?Q?/I0t7e2feyiI6rUvDmzO4C0n6rGXlOotrxvVm92sqRr/YbYHPss0HsEWiUf6?=
 =?us-ascii?Q?8ipj57g6OVdHWE4YnHkBhohcsa1LCI05h1/MZx/aHGJ3Wym7zTXQxAZgL8Ln?=
 =?us-ascii?Q?ih3bG/5bBtLOij8sdaj3n4CNfHgdR5CPYNTXMxQFUWj7uHJ+Wj0VC28dcTzA?=
 =?us-ascii?Q?FCQ+ND4i5vbI3PrGXU97APj3r8REH0ZWLCbZj8G5B6U3LKfucN4krqUgmdgZ?=
 =?us-ascii?Q?DR2ZQ52lP+RBRQ4cM4MeICL0fwC2WnC7FCN3MIfOUNHX5bUkHRmEbnqyNV3e?=
 =?us-ascii?Q?ETWU7j54aZAe4wAamaN+fWwZV2FFSRUUnnNlvkQZ8M2MxEqPItcP+l7DDdli?=
 =?us-ascii?Q?7lE4JyxWUk3Hzo9IUCs851YUSlub/2EqDkFp1CsrVo4W8P7JVW0D4QgVXYD8?=
 =?us-ascii?Q?mLF//2WzQT4z7dsMBjg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8lQa7gsOZo8jgaU4SART4wju52mMvnCsKsLUgXRnibEL8Iaizo3p5bpdq/cU?=
 =?us-ascii?Q?w7HztbpT3Ak+e1XHza9+qDe1Yq6CtIHopfihvsx4RrucanSuiBfHgUAdQ9ni?=
 =?us-ascii?Q?M/VwMtZ/AAOCjm2UtZt9lWvddP/ZsMY/umvqz25+voYuUoK3NegN+xgx5CXa?=
 =?us-ascii?Q?IxOqH+ihnJMd2pAdkaeB5Idusqlzkyj4Dkl3oLnDLo+nYJIKThUYt/1yhNGV?=
 =?us-ascii?Q?AKoFjbO7rF2aEyVcxLrbo81AjuwoKWHpO51bVIiPsUFTFerBRsHQMKXfs0oQ?=
 =?us-ascii?Q?+R1zyLJgluawHNNGkN2Tw3YEuc9Brty45JXFMnNahcrYaBJY/Wy8XEobWmXt?=
 =?us-ascii?Q?irLY3/PktSW5dFgIDIB3/4I/NTnpneeAb+jUTTICpBD3YZ+cs+x9CgQrAowc?=
 =?us-ascii?Q?9ubummqRmcsnbk+wAnYeJFsxcaxg+quQQeH0AQuzOl2j89/sP3I3YwI7T8eW?=
 =?us-ascii?Q?mhUjImYQkoCtQZTks28WxK4yS84azLqpn5Bp0LVyKh2Cyu/B3wvcUhEaM+wc?=
 =?us-ascii?Q?aOlkqn1+3f81q2hDNyO3TPAjY/H9wwqt+pImKc1LTX9s8e4Kze6dQDIDYJqz?=
 =?us-ascii?Q?NeUXyZ2AV+ffqN9Auu8Z4Gf8QzUI8Da/CAentor1/2hZxrsKsGxrteX97FJ8?=
 =?us-ascii?Q?KAwEGB1uKEb5/rEcE1oI3NisuU2ZuO8KunRfn8oCGHasXoAXNJJPT1fy+xXE?=
 =?us-ascii?Q?S8LkpuBMkaJ3RsSxkPbyjZTtOWbDfSlpO0Ox6OkutGD7rTx4hiQ5r7miRgY6?=
 =?us-ascii?Q?RLHyhgDKLxo2tMuII+1DZnh5i21oLo68vt6NB3Kg8z/rSidG+mFtj6fjlHc4?=
 =?us-ascii?Q?RBO4Boo3BAAZIWCilhidLho3/B80yze07YZX20UJq+8dIt9K5GPMrXhk2l1J?=
 =?us-ascii?Q?Y3tDew6SrUaUGk7TdnKnxKBqPza1gFFMgPq90CLLoGJxNProR83/M7dJg8jz?=
 =?us-ascii?Q?LXR2ukNXfhrUdR71mZQIIHuRnyc+y1dDeOFmYAlenav6xVW48skM4zcIVUIM?=
 =?us-ascii?Q?HgJgTjmuTXSt0BGHXFmctud+gM1Hdin/gtPX2MZG2F2Axp3l2fe8CEvjk9BW?=
 =?us-ascii?Q?3bEbbIjTylcSrRUJCRxyzvSF7rgZ4s5pNP2HBFO3ptlt6IWma+0YVVcSeDKp?=
 =?us-ascii?Q?ll5HgF98Gj6h4wZfv8HQTzrAjQw5GvfM+VhatG0Pyhb9KpugR0o+vxgSvgOH?=
 =?us-ascii?Q?zjjchoe/Ltnr3D2e8fFkW4f5JGAB/PhqNdqM0/ONpptl4OWrN3JD27cJfLh4?=
 =?us-ascii?Q?vxZE4b236L6xrPQap35ddYgHlfSIG03iHuyH80sh6H823g78+gX5XMBf1Fd/?=
 =?us-ascii?Q?W23WTRn6rWUqzIaeVRh+X69OuSYadX80vehmXDe/360zK3qzCwhouxYoramQ?=
 =?us-ascii?Q?oF5qw3dsisDXqfffR0LI/U9PaNOTZadbM5/djTqPWry7GMr1MueH6VV/MGVh?=
 =?us-ascii?Q?/2wkRxfDl/9N9VvllD3rehVFaRTecJEraQ7MkQp0rVEwa8SXpDRWYQLnQE3i?=
 =?us-ascii?Q?zyW+ispFdp3Q73fOsnx38p9F7T83w5BErAfXfYGkYWACKSgKIeG3HfYkNQLd?=
 =?us-ascii?Q?j4tOqG0Qrvu9/gy0Gyn8yUjV3AHGsiFmUrJAFHnTPMb3pecCIkEvUrgVr8CG?=
 =?us-ascii?Q?5su6j5i5KAWVVGWI8DVHWgXbAEfyGyDYoto6QTkT5gihCnp679/Y5O4w6XiK?=
 =?us-ascii?Q?elSvuPlsFJb3PZ21zJkQcb4v4SavieM6M0mHMJCWY7oHW6GmcVfrUtfTn3o4?=
 =?us-ascii?Q?jqW+/JOkHA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbb67e52-9316-49c6-a038-08de684ea90c
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:46:58.7973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FMG/1x/s4XwmUTtj3FxfYiPy91KvuhSdIKt/T2sdUNlStVatdLG4CbNWZPmRzxTs3RAeA5yUEOq08PoXWjlk5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9506

Blackwell GPUs moved the sysmem flush page registers away from the
legacy NV_PFB_NISO_FLUSH_SYSMEM_ADDR used by Ampere/Ada.

GB10x uses HSHUB0 registers, with both a primary and EG (egress) pair
that must be programmed to the same address. GB20x uses FBHUB0
registers.

Add separate GB100 and GB202 fb HALs, and split the Blackwell HAL
dispatch so that each uses its respective registers.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb/hal.rs       |  6 ++-
 drivers/gpu/nova-core/fb/hal/gb100.rs | 42 ++++++++++++++++--
 drivers/gpu/nova-core/fb/hal/gb202.rs | 62 +++++++++++++++++++++++++++
 drivers/gpu/nova-core/regs.rs         | 36 ++++++++++++++++
 4 files changed, 142 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/nova-core/fb/hal/gb202.rs

diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index ebd12247f771..01f19a00685c 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -13,6 +13,7 @@
 mod ga100;
 mod ga102;
 mod gb100;
+mod gb202;
 mod gh100;
 mod tu102;
 
@@ -46,6 +47,9 @@ pub(crate) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
         Architecture::Ampere if chipset == Chipset::GA100 => ga100::GA100_HAL,
         Architecture::Ampere | Architecture::Ada => ga102::GA102_HAL,
         Architecture::Hopper => gh100::GH100_HAL,
-        Architecture::Blackwell => gb100::GB100_HAL,
+        Architecture::Blackwell => match chipset {
+            Chipset::GB100 | Chipset::GB102 => gb100::GB100_HAL,
+            _ => gb202::GB202_HAL,
+        },
     }
 }
diff --git a/drivers/gpu/nova-core/fb/hal/gb100.rs b/drivers/gpu/nova-core/fb/hal/gb100.rs
index eaab3f934f6e..6039f66b12cc 100644
--- a/drivers/gpu/nova-core/fb/hal/gb100.rs
+++ b/drivers/gpu/nova-core/fb/hal/gb100.rs
@@ -1,21 +1,57 @@
 // SPDX-License-Identifier: GPL-2.0
 
+//! Blackwell GB10x framebuffer HAL.
+//!
+//! GB10x GPUs use HSHUB0 registers for the sysmem flush page. Both the primary and EG (egress)
+//! register pairs must be programmed to the same address, as required by hardware.
+
 use kernel::prelude::*;
 
 use crate::{
     driver::Bar0,
-    fb::hal::FbHal, //
+    fb::hal::FbHal,
+    regs, //
 };
 
 struct Gb100;
 
+fn read_sysmem_flush_page_gb100(bar: &Bar0) -> u64 {
+    let lo = u64::from(regs::NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO::read(bar).adr());
+    let hi = u64::from(regs::NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI::read(bar).adr());
+
+    lo | (hi << 32)
+}
+
+fn write_sysmem_flush_page_gb100(bar: &Bar0, addr: u64) {
+    let addr_lo = addr as u32;
+    let addr_hi = (addr >> 32) as u32;
+
+    // Write HI first: the hardware may trigger the flush on the LO write.
+
+    // Primary HSHUB pair.
+    regs::NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI::default()
+        .set_adr(addr_hi)
+        .write(bar);
+    regs::NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO::default()
+        .set_adr(addr_lo)
+        .write(bar);
+
+    // EG (egress) pair -- must match the primary pair.
+    regs::NV_PFB_HSHUB0_EG_PCIE_FLUSH_SYSMEM_ADDR_HI::default()
+        .set_adr(addr_hi)
+        .write(bar);
+    regs::NV_PFB_HSHUB0_EG_PCIE_FLUSH_SYSMEM_ADDR_LO::default()
+        .set_adr(addr_lo)
+        .write(bar);
+}
+
 impl FbHal for Gb100 {
     fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
-        super::ga100::read_sysmem_flush_page_ga100(bar)
+        read_sysmem_flush_page_gb100(bar)
     }
 
     fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
-        super::ga100::write_sysmem_flush_page_ga100(bar, addr);
+        write_sysmem_flush_page_gb100(bar, addr);
 
         Ok(())
     }
diff --git a/drivers/gpu/nova-core/fb/hal/gb202.rs b/drivers/gpu/nova-core/fb/hal/gb202.rs
new file mode 100644
index 000000000000..7fa9a49d2cca
--- /dev/null
+++ b/drivers/gpu/nova-core/fb/hal/gb202.rs
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Blackwell GB20x framebuffer HAL.
+//!
+//! GB20x GPUs moved the sysmem flush registers from `NV_PFB_NISO_FLUSH_SYSMEM_ADDR` to
+//! `NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_{LO,HI}`.
+
+use kernel::prelude::*;
+
+use crate::{
+    driver::Bar0,
+    fb::hal::FbHal,
+    regs, //
+};
+
+struct Gb202;
+
+fn read_sysmem_flush_page_gb202(bar: &Bar0) -> u64 {
+    let lo = u64::from(regs::NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO::read(bar).adr());
+    let hi = u64::from(regs::NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI::read(bar).adr());
+
+    lo | (hi << 32)
+}
+
+fn write_sysmem_flush_page_gb202(bar: &Bar0, addr: u64) {
+    // Write HI first. The hardware will trigger the flush on the LO write.
+    regs::NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI::default()
+        // CAST: upper 32 bits, then masked to 20 bits by the register field.
+        .set_adr((addr >> 32) as u32)
+        .write(bar);
+    regs::NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO::default()
+        // CAST: lower 32 bits. Hardware ignores bits 7:0.
+        .set_adr(addr as u32)
+        .write(bar);
+}
+
+impl FbHal for Gb202 {
+    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
+        read_sysmem_flush_page_gb202(bar)
+    }
+
+    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
+        write_sysmem_flush_page_gb202(bar, addr);
+
+        Ok(())
+    }
+
+    fn supports_display(&self, bar: &Bar0) -> bool {
+        super::ga100::display_enabled_ga100(bar)
+    }
+
+    fn vidmem_size(&self, bar: &Bar0) -> u64 {
+        super::ga102::vidmem_size_ga102(bar)
+    }
+
+    fn non_wpr_heap_size(&self) -> Option<u32> {
+        Some(0x220000)
+    }
+}
+
+const GB202: Gb202 = Gb202;
+pub(super) const GB202_HAL: &dyn FbHal = &GB202;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 0d3ad4755a81..dfc30247bca6 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -116,6 +116,42 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
     23:0    adr_63_40 as u32;
 });
 
+// Blackwell GB10x sysmem flush registers (HSHUB0).
+//
+// GB10x GPUs use two pairs of HSHUB registers for sysmembar: a primary pair and an EG
+// (egress) pair. Both must be programmed to the same address. Hardware ignores bits 7:0
+// of each LO register. HSHUB0 base is 0x00891000.
+
+register!(NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO @ 0x00891e50 {
+    31:0    adr as u32;
+});
+
+register!(NV_PFB_HSHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI @ 0x00891e54 {
+    19:0    adr as u32;
+});
+
+register!(NV_PFB_HSHUB0_EG_PCIE_FLUSH_SYSMEM_ADDR_LO @ 0x008916c0 {
+    31:0    adr as u32;
+});
+
+register!(NV_PFB_HSHUB0_EG_PCIE_FLUSH_SYSMEM_ADDR_HI @ 0x008916c4 {
+    19:0    adr as u32;
+});
+
+// Blackwell GB20x sysmem flush registers (FBHUB0).
+//
+// Unlike the older NV_PFB_NISO_FLUSH_SYSMEM_ADDR registers which encode the address with an
+// 8-bit right-shift, these registers take the raw address split into lower/upper 32-bit halves.
+// The hardware ignores bits 7:0 of the LO register.
+
+register!(NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO @ 0x008a1d58 {
+    31:0    adr as u32;
+});
+
+register!(NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI @ 0x008a1d5c {
+    19:0    adr as u32;
+});
+
 register!(NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE @ 0x00100ce0 {
     3:0     lower_scale as u8;
     9:4     lower_mag as u8;
-- 
2.53.0

