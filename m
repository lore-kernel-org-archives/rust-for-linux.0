Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012001.outbound.protection.outlook.com [40.93.195.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B942E6CC2;
	Tue, 10 Feb 2026 02:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691597; cv=fail; b=rB+SowLCSN30CrTizd43IccxCTIQyTCDg1T0pnDlpKiFFkMq1EZVmKVqFFQN1zMwwWBZnTiKELNXORMX0zKjUDr6NpgU8VxnCEvvFifdWOZC2NQDZWgkfgokFGSZFN4RjfzOyy8wlEop8qurJBhQzBSZUg243SfkmN9akiI0f4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691597; c=relaxed/simple;
	bh=Fuac9ImidtHiIVTpLXOHS5sGPkBg7mDrj7zNiKkpDXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z2yS1RELHfgcbjRnR9cLIrwzjhr3VxuJR6Cz4mAvz4gd61TgKMGWknvuztNtYluwtnr/z/glgRwgRROWebxf9SXxHkUYyxnwplmUwjrgwGeCof9nRL96Xli5hJINnv13H6lj+pWv1lEuP++XuP+JBzFF/GqrnFbGIbD6Jug8Sd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=S5glOc1N; arc=fail smtp.client-ip=40.93.195.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="S5glOc1N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ehwpU8FfsNOwhJeiNuZu+yOPxUH48v8zcN1zBFKhXL2ZAlAfyGJrRNHlWvVhJgCBt+G89n6JU3W9+tQ0VNLO9ga4tAwXqQYADKULA0GVB9fJiZe8qKGLk/Is3giCZ+VOSw/sVeKGZ5zKmY0kO8xhmDNeYGCQJekl5bslXYGazfyJd+qKgnulGIEumL6y8J7xuXfaHkBRrNq0xTET/wgilGV/GN/KfwUt0EgfHi+NicFadqwJK8bymN1/+WB4b7ogp5035CztbwLbHaI6yW2lMPbVWVrgCzsYm6+u60gYB7XhPvzwqGmKKD0hedNljG0/tNFA0Eh4h0dph7aFqUm7YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1pNg985cdLQKzyB7VBwpc5aN3hYtRcw4jm6CB0whxio=;
 b=G4FSB3B1cGPexyz/RO3XipuNxYEYxCpk3NvrYnVNzvZje+QQdDLe+ipIyKuVZ4eEeAhcnPQePxDbt//rIbiwQ35IO4z4w4N+KPAlSWKAIRN7Ca3dw2s+1FEeg0Ex4vjGy/y9OuWEUcnGkmlyokEbgCPNvwxq6F7FatX0b3Z0QUCxfWKXAJ54Uno0Sj2/m9PJRu3KNW18TOqo1POvTPxv2WC7eT93Ff4LlKH9xmLbj+MPqTmdcKpSDVJv49K25wFGAGdzCDQip9ZBqFgNAxRTmL3CAJ7ACT4Hy4nsHZ+xvTUcITp0ZgV4XqmtCEgkj6kS4iOLOJfjErI846dCJT694A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1pNg985cdLQKzyB7VBwpc5aN3hYtRcw4jm6CB0whxio=;
 b=S5glOc1Ne1BWvwZ+eU0iwET/HnsE4Umkiauw2YR1n1y1PZgM81hnyDAAuaC34yas5dc8pioqbYS9xKLWFV2zuG38x1U5F6lF1A/LBG60frerqicdef0+tbbMi1XdT6Sg1t7NCKqo4+o1cq0v++BkY3iSVPOxlBaf+QHTyrqGeIdErhj8gjaiF149n6IVWF0+pE4vppPAt4r4Pf1dA8kvQ/yUUkamYVLNoDxNPjshi+rSCz94MtbIWwKD8BSZhPdj0BFlF7HkfFDRe89W4VL2EkdoSX2hE2+jZcmH7C/OKG/VzO0GhHkjqhzCIQDwodUlgsLDg+PjAOpoFKE5zYIDVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4204.namprd12.prod.outlook.com (2603:10b6:5:212::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.19; Tue, 10 Feb 2026 02:46:18 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:46:18 +0000
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
Subject: [PATCH v4 10/33] gpu: nova-core: move firmware image parsing code to firmware.rs
Date: Mon,  9 Feb 2026 18:45:37 -0800
Message-ID: <20260210024601.593248-11-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::11) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4204:EE_
X-MS-Office365-Filtering-Correlation-Id: 02e9275a-3dee-4200-1c81-08de684e8f5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PM59rpSDpMZ8l5vRHqYF96EUTeGdsyB9fYTCH44K5bmlfaHSThQS04Pgflu3?=
 =?us-ascii?Q?ZQCwpQ/demWhdYSDXS8R2ejTCSd8i0VLGTOUtiHvq5w79FogYFlBmxBLwvUI?=
 =?us-ascii?Q?IlHMcRQ20S7BcTYMHj6jTDm+7Hf0lRWtp7TJcTtt2dB1VogWj4vGXKAcjlat?=
 =?us-ascii?Q?4/Lol9jkI8oVoMEIlAcho6sUjXaNG3VCc8gr1lNFf3CaUHpPogsgYIfc2Vnv?=
 =?us-ascii?Q?WcbUXeM3t/pkXQ4kO0fz8tkGfjbOwYRqZeGPrGdJGPNxLlhmUeCmwMhNYHu+?=
 =?us-ascii?Q?smoadpOpheULK2g3VPxRIieDibT3ekMglwFzT/F4i7nDgnzrfWpZS3vqPlEa?=
 =?us-ascii?Q?O189gHTZM5JoeskKpqRsSKrz023AQmWbLsUAHZnxTOsHHBrz0x00FN7RrPId?=
 =?us-ascii?Q?5faEd7NQe6I75tZ1Vw+2MH/phGcGgVPW1usQSteTLL6vmcdzCbia3f+TYdgm?=
 =?us-ascii?Q?Aldsp5JMKzHGDRmPgEPu/0doyNsAxI82C8Gry/ZsoWu6K6thRAkaZqNa6t08?=
 =?us-ascii?Q?6a2Sw01G1DVObBZao6FrkIxiRRtNCbub6R2MwiM6VlDeZypFD8a+0Yvru6a8?=
 =?us-ascii?Q?Tgn79E0TXacQY0g0F0BYaexY6qn7FTbGTVfZ2t8/kuRWf9nhqDBaVcEHJBq+?=
 =?us-ascii?Q?txVUFfxzrglcpx7B/nk8Qph0LXYvvFqgq40oPkNgtzpKkLrRW7fFt+eQTE2n?=
 =?us-ascii?Q?IxjnYaAabZx8++b/nM8dM0DQvwv+/ay3wZvOtQCjZ3j6YDilX0jnYl/8R0EW?=
 =?us-ascii?Q?zbmZv6RlHOgh/IwBaSbRPoUdi+V4R+t99WTMpv0G+DOEBhwBYua/LsTdNQ3a?=
 =?us-ascii?Q?aU2PEWT/eUrCnKRhFLKT+C8RGOEHc1W2DjFEwky4w2P58uSlQbHWddYBkcCN?=
 =?us-ascii?Q?8Rt+sjCQnAhE/0IyLOxGCpyaSbwxGJcV/6DJivvqIvEx3TYM2vS3QXe3TMB5?=
 =?us-ascii?Q?dICAnnsiX/C2A236D/BhJAvvpBO6k5l5AzLggGA1TOP84dG1EvskRLxj/yZH?=
 =?us-ascii?Q?Ym1YgAyq+Ze88Oy8/G66QUFjz5oIZGW/UmnqoCd5k126RVB7ldMrtMR+3cJr?=
 =?us-ascii?Q?uYnXpmY70y6Si7GWy7cYeHwGjt/Lu0ACi0MT7xdVDeGkQoy8NEL06hGCYzAb?=
 =?us-ascii?Q?DfazXxxPnU22Y9pvX5PGBYcSwutvBavO/CVMF1Yhc6GEgCjQWPKj/LUF5Ri4?=
 =?us-ascii?Q?6HIzrlgoJ3blVM+JJYw3io7DxNHeBBkspqNRamXUn5GfrZ/1lP4VfbKkF+gj?=
 =?us-ascii?Q?K15jh5qVM8f2zmGeWF5Lij+iwvsbXmz6SB6OG7tNVepj7XIgAzbcjXm+v5b/?=
 =?us-ascii?Q?YIeKRk9Ax6ZezXv0rEQfpLgxSRg1j81n/qPnvPl5c2TZwkPHw12kMvnHNEWO?=
 =?us-ascii?Q?EfNK28VSSYQ/RR8EHlKa3QocqvRRMIsoPDCSxHXD8VmdeQheLHCpt++E0MU4?=
 =?us-ascii?Q?kqPdKIJv3K1lu/JbwMqMXHSN1uQXtfwqaz1Gi5MmkNL4P9Gy2rW1TIAn/yMf?=
 =?us-ascii?Q?I49WrysyFaCrld5vnY8Pj9NHKNFUVG+lg6DlBuO+wyRYxaRt0sCb0/ot5UC+?=
 =?us-ascii?Q?vk7fITVwLL/g6WnQdgc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QBMOCASy54g5m0Vdev4Zr8A2t3Zt+hDmuDUMPD9+WRrPH7dIWI5rlkzGjfeV?=
 =?us-ascii?Q?ze3AgC0n61ZTi0EEP6XDr6lGOZ+oXJKTDe0YE+EYi3/dFJc8LIPBsFske/rp?=
 =?us-ascii?Q?MuMV6gZFSynlOqbK1JLUNC+RW4SnCKaRMKkH4jzZc+K9E7ms95pWKKt5n9Gm?=
 =?us-ascii?Q?I+UUpM2Wleiy33uE3cCpz6R7K3f2HGtxge/fa0mB5ZYk+waQJ8rmVxlhn4Qs?=
 =?us-ascii?Q?iFqbL2QoMceGnLNEWsyaBshL8zoshsue3QsR/EBhJRtSA0aG3rUCjxUEjCm8?=
 =?us-ascii?Q?bO1KM4qrJ6BtA5j0WWRNXW2B2giA8Yg7oM98kYu4orsQAbuH1UImcxgs+Q3K?=
 =?us-ascii?Q?lzsfIpNHSn2eAVsugEkOfxsDyzupGogos/Y0foUsj8XjRPn9k2KWvw+COCM0?=
 =?us-ascii?Q?SgyPU2eEABJ6cDALVvfm3+nrj03nfbU1cFXisAxzK9LTOuCpE8yQwildoB/2?=
 =?us-ascii?Q?nM7cY7N/4Zmg+kbXtZHzLfXf1fMprw/gxu94qPsFkNGjl/QKJ0FqrL12FjJI?=
 =?us-ascii?Q?SIryaWRrk71hYbl66eEfdrJH+L5Po1WOh1e2ItmI6wXpkmCBbxCRxi3mcQqH?=
 =?us-ascii?Q?vJwbb62jue/7+UOP3gml8XFP1/TyHzPQVsGBK0UnwNVSbaReHuCIAYz1lFiU?=
 =?us-ascii?Q?RFMquN+r+BauUdf13I+wv01ywk3CBGEe+eZixat1vKE7NIXVKCEW8K/yIRO/?=
 =?us-ascii?Q?EK1Yt+Q6mDfotHDoDzg3ETyr/qZoj3hzwAunUXVw5utCY23YgGtIaSxZ3/Wa?=
 =?us-ascii?Q?6Ik9X28HI8atMa1PkCoXmz1I7rXkoKztr3+lEoZToMim/3kYr9u38zNYeoOm?=
 =?us-ascii?Q?d01D69CK0MZKL6ShtoljmJCD3tirWPe18n1ysoZQtOhMhGxuMnj0zZucjaY5?=
 =?us-ascii?Q?VpKtodM8soXd0VJF4VfsYYqP56bG+ZtnYJUgwXDRRJZaWSpszz3MoCsYVxHi?=
 =?us-ascii?Q?APEtU6kIoPgZJj/3n85Bh8oHoHyVt2UUbCyVNl5s4X1AGKQv58nHnCnw02+i?=
 =?us-ascii?Q?HxChrtY/7x7Wlk7AJB783z3FZKVRip2fJhko37Tt6DrcYnaxXODRNzxaEh4d?=
 =?us-ascii?Q?7xd09lalyrS9gxajI44y/p/4S8x5eU/CtkibYlJKRoFm3x9f+oxxb1POgYF4?=
 =?us-ascii?Q?hDVw4ZTDyZmGA1BI0HQnS4UiGIkzaVWLprphwqTI3KFEu2ZbpdrWw5IfZ4cN?=
 =?us-ascii?Q?vHeVv4/YM4VsVuY28h7gEd3HP69XedBOdHMewqbkFuEa6mro/eqOzNlV8pnM?=
 =?us-ascii?Q?9Wp102bHDdeWR2W2N+n7NgNEUhk1/Hi8Ar0Ufti1K9ayqupmd0Rx2gTnDUJN?=
 =?us-ascii?Q?AIXgHMgOMBOQrnhV9RshHWZdhGLrJN0sYcXockCEsFiEN5qXoDUVPOkHuG4Z?=
 =?us-ascii?Q?zYNqOgKxEYuyKD+2JXD/wcxgYt2ggYUkGH7POdjZNa3/SkDAwBVrBQ9pi7DE?=
 =?us-ascii?Q?+wuOERGbxEic8PP6GNkfDUR+tVYvxe6HH8Q1oVZtuScErZ9FRu5LoCZZBpkj?=
 =?us-ascii?Q?sKtMRBrZ8CXRJrCJTOKqgML5WsR1OE7nd2QkXgYdTzlLfnGJPi6tmxjRY7pc?=
 =?us-ascii?Q?qKyO3FKLtZcALpYg8YpHdUrwVQn1ih/ti0CJMo5Zx0cR2RHF3HAYN1vC+och?=
 =?us-ascii?Q?tsiDMfahT5PoUUtHh7P+d1wuzNP+Fxw8Ph2dEfv12RrDA8rz51/QeOrFGeNN?=
 =?us-ascii?Q?yyYAqVvXoc9hngCKPB3UwhU3dsNJWO43ca5r9Wg+mA6Op6Q4J5XGZDWSqjjN?=
 =?us-ascii?Q?sbwwdZe8yw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e9275a-3dee-4200-1c81-08de684e8f5f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:46:15.7610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gh2JtrN3n9l8aDR1UBF6/c5TSfdOWgWhistlqCwbE/e7050K/PtKIDGofH9eyfD6i4oONgKlvEBYxfyycoPKnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4204

Up until now, only the GSP required parsing of its firmware headers.
However, upcoming support for Hopper/Blackwell+ adds another firmware
image (FMC), along with another format (ELF32).

Therefore, the current ELF64 section parsing support needs to be moved
up a level, so that both of the above can use it.

There are no functional changes. This is pure code movement.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs     | 88 +++++++++++++++++++++++++
 drivers/gpu/nova-core/firmware/gsp.rs | 93 ++-------------------------
 2 files changed, 94 insertions(+), 87 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 68779540aa28..a0201ac8ccb4 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -437,3 +437,91 @@ pub(crate) const fn create(
         this.0
     }
 }
+
+/// Ad-hoc and temporary module to extract sections from ELF images.
+///
+/// Some firmware images are currently packaged as ELF files, where sections names are used as keys
+/// to specific and related bits of data. Future firmware versions are scheduled to move away from
+/// that scheme before nova-core becomes stable, which means this module will eventually be
+/// removed.
+mod elf {
+    use core::mem::size_of;
+
+    use kernel::{
+        bindings,
+        str::CStr,
+        transmute::FromBytes, //
+    };
+
+    /// Newtype to provide a [`FromBytes`] implementation.
+    #[repr(transparent)]
+    struct Elf64Hdr(bindings::elf64_hdr);
+    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+    unsafe impl FromBytes for Elf64Hdr {}
+
+    #[repr(transparent)]
+    struct Elf64SHdr(bindings::elf64_shdr);
+    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+    unsafe impl FromBytes for Elf64SHdr {}
+
+    /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
+    pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a [u8]> {
+        let hdr = &elf
+            .get(0..size_of::<bindings::elf64_hdr>())
+            .and_then(Elf64Hdr::from_bytes)?
+            .0;
+
+        // Get all the section headers.
+        let mut shdr = {
+            let shdr_num = usize::from(hdr.e_shnum);
+            let shdr_start = usize::try_from(hdr.e_shoff).ok()?;
+            let shdr_end = shdr_num
+                .checked_mul(size_of::<Elf64SHdr>())
+                .and_then(|v| v.checked_add(shdr_start))?;
+
+            elf.get(shdr_start..shdr_end)
+                .map(|slice| slice.chunks_exact(size_of::<Elf64SHdr>()))?
+        };
+
+        // Get the strings table.
+        let strhdr = shdr
+            .clone()
+            .nth(usize::from(hdr.e_shstrndx))
+            .and_then(Elf64SHdr::from_bytes)?;
+
+        // Find the section which name matches `name` and return it.
+        shdr.find(|&sh| {
+            let Some(hdr) = Elf64SHdr::from_bytes(sh) else {
+                return false;
+            };
+
+            let Some(name_idx) = strhdr
+                .0
+                .sh_offset
+                .checked_add(u64::from(hdr.0.sh_name))
+                .and_then(|idx| usize::try_from(idx).ok())
+            else {
+                return false;
+            };
+
+            // Get the start of the name.
+            elf.get(name_idx..)
+                .and_then(|nstr| CStr::from_bytes_until_nul(nstr).ok())
+                // Convert into str.
+                .and_then(|c_str| c_str.to_str().ok())
+                // Check that the name matches.
+                .map(|str| str == name)
+                .unwrap_or(false)
+        })
+        // Return the slice containing the section.
+        .and_then(|sh| {
+            let hdr = Elf64SHdr::from_bytes(sh)?;
+            let start = usize::try_from(hdr.0.sh_offset).ok()?;
+            let end = usize::try_from(hdr.0.sh_size)
+                .ok()
+                .and_then(|sh_size| start.checked_add(sh_size))?;
+
+            elf.get(start..end)
+        })
+    }
+}
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 10761716ed93..173b16cdfb16 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use core::mem::size_of_val;
+
 use kernel::{
     device,
     dma::{
@@ -16,7 +18,10 @@
 
 use crate::{
     dma::DmaObject,
-    firmware::riscv::RiscvFirmware,
+    firmware::{
+        elf,
+        riscv::RiscvFirmware, //
+    },
     gpu::{
         Architecture,
         Chipset, //
@@ -25,92 +30,6 @@
     num::FromSafeCast,
 };
 
-/// Ad-hoc and temporary module to extract sections from ELF images.
-///
-/// Some firmware images are currently packaged as ELF files, where sections names are used as keys
-/// to specific and related bits of data. Future firmware versions are scheduled to move away from
-/// that scheme before nova-core becomes stable, which means this module will eventually be
-/// removed.
-mod elf {
-    use kernel::{
-        bindings,
-        prelude::*,
-        transmute::FromBytes, //
-    };
-
-    /// Newtype to provide a [`FromBytes`] implementation.
-    #[repr(transparent)]
-    struct Elf64Hdr(bindings::elf64_hdr);
-    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-    unsafe impl FromBytes for Elf64Hdr {}
-
-    #[repr(transparent)]
-    struct Elf64SHdr(bindings::elf64_shdr);
-    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-    unsafe impl FromBytes for Elf64SHdr {}
-
-    /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
-    pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a [u8]> {
-        let hdr = &elf
-            .get(0..size_of::<bindings::elf64_hdr>())
-            .and_then(Elf64Hdr::from_bytes)?
-            .0;
-
-        // Get all the section headers.
-        let mut shdr = {
-            let shdr_num = usize::from(hdr.e_shnum);
-            let shdr_start = usize::try_from(hdr.e_shoff).ok()?;
-            let shdr_end = shdr_num
-                .checked_mul(size_of::<Elf64SHdr>())
-                .and_then(|v| v.checked_add(shdr_start))?;
-
-            elf.get(shdr_start..shdr_end)
-                .map(|slice| slice.chunks_exact(size_of::<Elf64SHdr>()))?
-        };
-
-        // Get the strings table.
-        let strhdr = shdr
-            .clone()
-            .nth(usize::from(hdr.e_shstrndx))
-            .and_then(Elf64SHdr::from_bytes)?;
-
-        // Find the section which name matches `name` and return it.
-        shdr.find(|&sh| {
-            let Some(hdr) = Elf64SHdr::from_bytes(sh) else {
-                return false;
-            };
-
-            let Some(name_idx) = strhdr
-                .0
-                .sh_offset
-                .checked_add(u64::from(hdr.0.sh_name))
-                .and_then(|idx| usize::try_from(idx).ok())
-            else {
-                return false;
-            };
-
-            // Get the start of the name.
-            elf.get(name_idx..)
-                .and_then(|nstr| CStr::from_bytes_until_nul(nstr).ok())
-                // Convert into str.
-                .and_then(|c_str| c_str.to_str().ok())
-                // Check that the name matches.
-                .map(|str| str == name)
-                .unwrap_or(false)
-        })
-        // Return the slice containing the section.
-        .and_then(|sh| {
-            let hdr = Elf64SHdr::from_bytes(sh)?;
-            let start = usize::try_from(hdr.0.sh_offset).ok()?;
-            let end = usize::try_from(hdr.0.sh_size)
-                .ok()
-                .and_then(|sh_size| start.checked_add(sh_size))?;
-
-            elf.get(start..end)
-        })
-    }
-}
-
 /// GSP firmware with 3-level radix page tables for the GSP bootloader.
 ///
 /// The bootloader expects firmware to be mapped starting at address 0 in GSP's virtual address
-- 
2.53.0

