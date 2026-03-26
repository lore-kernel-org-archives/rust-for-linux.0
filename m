Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010066.outbound.protection.outlook.com [40.93.198.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2710C30FC27;
	Thu, 26 Mar 2026 01:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489164; cv=fail; b=eRTKT9JXZYKNBuMu6lQ1pRiHxNMYU3YiN0LkBHbSeoYeRB8tedVaU5mVH7mz/RfYxLlaEDoDgO/gNSEB3agtsx1W1r+RlgohEeztdICxiHbS7OnBXCd90wFUla9RjVzBI3IaKok6yZi06Iq8/hddhaQUq6FnLFIyDeZ9hFaFwhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489164; c=relaxed/simple;
	bh=kk4IBG38EsPcgkebSwmFYsa5wEDQP8uZTBU4Xaa2Zl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EReuVDmDmXmiIgNYptMYOOKkHu2VX+cj0dCZC1GPuHa/VSbgWRKeLNUVBf/T3CALwOp5Ax8pc2lQyB2wytjA64MjPM9PkPD8qbjCix/zjGd3KW+i5SI0MnTOJxRrBumj7PS+iSeNDKyVPDPqtdocOuOrIFkK32xN9HpfmhIUyV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nlonw7F6; arc=fail smtp.client-ip=40.93.198.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nlonw7F6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rJ3usEknXJuE/ysI4tmZlpP5TixjOYgDVpuYs9IYm9upawXCRH0od/WvOsXSSYj6i28je+fpwk0Mhc6J30ZQjByNP9Zeh0QRWuxVtQJhy8UMDVg4s3E01Rttzpr5U+TMR5kejI0ISIwla37PnkZiLMtDu8EOeRsSrOeIxvz2eoGjcO4SHaT3M/v6q0T/FIl61vV5Hb4ULkwMvX2DYW01mU9qzjyke+KFx/8qi4vP/NDVkqx4ipddHi5n1sAyeAlmy8FT+mkDXOdZMdqZzfBheBl3Rk2sc/beXJDOzWooW4BXCVjEGVFPZ0GH1e3JJNGxHKK7IAAn737eC2/oaaiVqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MFjlY1ypz3rOAAcCINeoC9TZn/kxzw0NFDQFvMbX9jo=;
 b=gAWwn1wilpKcehn+yDBssGw+tqUA9e6s9VcLrB0Vsq942jLSYAjUGhcgaSeIIMXJWwK3X+NAlSGVGjU0yyOOE6SNSkyV87hclCevuFFgHlK9uQLiwyjLsl+hu5fhRb89jRLoYB/WNj/lr/ewvbOMPuat2nunVB0yYHtUYhw0x7+CuPFNNRkUAG4CIgBYgsJAWhXtI0pPhLMs5r9rcfo4LhBqY1h73xjTZ8cjqZ6Zds7RkaARbwFw2S9EwDlK4rTIzul4sW9Jn+gCbhMvioSRL/zP7lrH2yB9dPhAeM0s/VTfBYP5gujsSbcSX0FPxNC4NhsB/pERsOsEYcC3hZqUnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MFjlY1ypz3rOAAcCINeoC9TZn/kxzw0NFDQFvMbX9jo=;
 b=nlonw7F6WIhkp41JVL2W7nZ8QEgm+Oy2WNDqwdQSqXgCTZvbx4nMK+LU5cdJFn+csyLB4gfpSTS9pT4rrymnuMVnF05dYZJ/EAfC/zQ603tRnD+agzmrNCmYNWN132KT5vKI3Dc8vBfF3zTF0skCtL6nGcs7cAfdLr1XMgU8H8D3uUGb6x1Wje/sxZtZdmCJ7dnLoFH9yLDrISZPzw2+h3hxcNhPr4Wk4OWLcTlfIHKbI+6nb3ti4XnKxUpmWFS0iEF4C1Sbdn2X7ehv2yDdvBKKeA7hP1rMpw0lsdqvrcGkyCR+JShNGgpRSCNbZEq5V/Ou0lUDxZHtTVco3RpYvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ5PPFF6E64BC2C.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9aa) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.13; Thu, 26 Mar
 2026 01:39:07 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:39:07 +0000
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
Subject: [PATCH v9 02/31] gpu: nova-core: factor .fwsignature* selection into a new find_gsp_sigs_section()
Date: Wed, 25 Mar 2026 18:38:33 -0700
Message-ID: <20260326013902.588242-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326013902.588242-1-jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:254::20) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ5PPFF6E64BC2C:EE_
X-MS-Office365-Filtering-Correlation-Id: 774e9d07-3839-498c-2bc8-08de8ad878b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	N7j62ucRCDLoe2OqaUKv1anmZlWKzD/SnqoyCStFowXF1IhyuMBcSpMRlhbjdZ+jRceyt1QfJvWkl8WJU5RP36vATPjzeQ8/edZ4QGrTo4UCoSywqM8G81oowLSkfcpCZMeLrkfgQw1uJuw76uY5PhG/qoLU9qfgf0+RgiTk3qaAqdrS0U4HrUhBFkcQv/zsL0JzdM5XzS6bWWNd9bhT69qGj/W3B9TP4XDnOcBwaUihltciDlr207Z6//XfCdW8jsb/AEMCjzEM4jTvx8aF96rAS+7hhWesx8JIxBaV3e3DiUb2opO6N9NPQLmGRtBaNK7urkz/WBfyN/k25vMmahrs92ZPYda81cwTqbHi6um5EovgoeTsjzTihHCplnYcQ6L0RmG7Y1jdZAFPRe1D0jc9AJ0enXtU96xer4pbdnwBwLyWu5IaOZmnVg+q6GYTTTzxM0jidI6kDGHFwzLdxm7C+tqbqkv1ke0q9Bf6i5SnQTqNJdrNkNWjZNjG7mJHqy20ffsIQF4NseMpWHMtp9rL5YG0+DNG0E8YmYcN9TnEClTpgbtC/L7F5Dj3a0G2AasBMeglVV3fkTM+RwtyfnfBb+G2if8I1zfrFbobiQZ3UGrzK6C4z853nGZEEtA0aJxTkJv3S84yC7WhN2Kuog1TBUUUTwT3LPvmPRrxM+M+R1cpu6NFPOUXeq7wS77xQTtLTxMMq6QNO3jwnPnnBjF4sh45biMPmHcnr+4le64=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Nyx6z8T89l3bwLDweh92g3hhKEoydDecETgSZVa/x6VOoxaMf2yA7MVhfOSk?=
 =?us-ascii?Q?7hyFVUKiI79OhraZKarT6g5838d/WMBV/O5IEL0o6TMyeMnnRoXgdMEpyfd9?=
 =?us-ascii?Q?lbvqoPsTfh7H+63IB++SMO0yUlzKEKFzBtUa+B3dQJ3+5GGsWMySUiWGN9HO?=
 =?us-ascii?Q?g8MUPYK4fjqT/aAWFshP4Kf3kXiUQJjaOigF91oOjL/Qi3eoB/PT9oFHvW1h?=
 =?us-ascii?Q?nMxzs/0ARFFCkHAQMbVzo2UoBxpZrwFyhks/Mc/QNf3fWps9DZ0kCDQuNv09?=
 =?us-ascii?Q?yN38q2Ds9SkgvJ4hDotoIep1nH8Pd2Pl3/cHVYDBj9EWm52FGhhfQqsy/PVN?=
 =?us-ascii?Q?zCUFof/RVPl4vhlbfz1gA+fhzcDZoS5LARDwkwqhaW+XUIbkq+Wnd9vsYH8E?=
 =?us-ascii?Q?dbcDF2/iQbWY+ySBfmDiCxrRDWM35iVSCOS+ikbfokEdfeBqnVJ5Ie3OvndB?=
 =?us-ascii?Q?+zdxQ+azcF/WhbC0jtUpX+dDnvDmzymaWTOCmmzoNP7j27TexjWFbh9XaAY1?=
 =?us-ascii?Q?zF5qVwdE9nuCLvrmnjUF8DywEK4HutqgUQZTvONpgC4gftN+9W/cMjvhboVT?=
 =?us-ascii?Q?OOwOKl7/wh0D01pgjZyvT45ttAfxdTwqUbknw2AUc50VrsD7SqmPbCBYwmMr?=
 =?us-ascii?Q?hLLQrVsWNl9QiWCNKOLAR5OpoJXf9mtefWHCXa67fPgs7iB0x79iEjYBykct?=
 =?us-ascii?Q?adK9X8KD/Kgck4XaPR02uiulrt3DqXQ+R5tBaI+Dj+AQah+thEevtFQZuXxl?=
 =?us-ascii?Q?brXU124siaZt0j4/N9KHQ+Mw0mS/mqlYludb6m7Zggfur8q7MmtfiFMG6cd/?=
 =?us-ascii?Q?6tYAmnNovw4K2QoIrPaCVFrfpSlGrEs+/rSyEVYzA7fDT2Slmb2A8F9QP+T+?=
 =?us-ascii?Q?tmrgJ9vEuNqitukoz4K2hajE5rGrPcrKXF+tDYSSyi2ba2oU1toCQaS3/RMe?=
 =?us-ascii?Q?Ab1++9CPX3OWCqaXBazjanN8IvYq828rDPld74PNH4+fmrO5OxtLnaS4aGE3?=
 =?us-ascii?Q?aHDCJ0yRAgF4jFD9cf4hgO2VWz5DS5RaW+Ezh+gBKPpoSO97h7VFkswpJNlb?=
 =?us-ascii?Q?AFRaNIJ3lFB3ZBtyKHFK7cpo1i2Thaa72TJ0SPK1I3f+4YYqM1QixPpa02Q5?=
 =?us-ascii?Q?UPbBRZ7PlA9Hi8U2KaX2D/yyaRQn28b4SNiuyYeozPIuiUqRSDqcOPMez1lV?=
 =?us-ascii?Q?7mYmEFYOKvc3EfMS9pWYkCAexc/2NGlTE6io54RGeY72BPkLN1Qc6V9M3zAq?=
 =?us-ascii?Q?r+pMr37sZyZTieRqdDGm5PloD4rdR9oCHiy1vaS5hLlnL8X4xEA09MRG3rIX?=
 =?us-ascii?Q?Z5DWTtPgNpH8YgcVpVyRcuNsr3mLnyX55N20ALzaK9jb6LMXRhFQqhNzbXbN?=
 =?us-ascii?Q?QXESmojL2mizInkvJ/b7r1GyPNJgVFJ/c9xR9Ni2u+Ei6kvDDADkPFweZ2vw?=
 =?us-ascii?Q?aswRkZG0yhRIjf9rWnaohd3COiCLhtwy8pM5FQ28gaPlHSX1PfIjO6Ac/9Hg?=
 =?us-ascii?Q?g3W0nbiHWYg/ilIXwe5yrefY8wbpEVMAGiUhiYQkf2RpiDSbB6QtOt6AWdBj?=
 =?us-ascii?Q?TtsKABI01LF2PwsbsgIurKU3iI3z4kXEtgaF1efRPBy80eWmQ+5EkKD8ThJD?=
 =?us-ascii?Q?yRhJZTNf7VQnvedi5EqdgT1kc1fbT1Ltt+rT/fQ/Qd/Jx1invOTw+ZXxxk6F?=
 =?us-ascii?Q?vTsV1dtL4Q675XMJL4N4LO9ghCjDggHWLXvCmtacZy4z9nFtK/rrksLmicZf?=
 =?us-ascii?Q?5ndeH6ZsRQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 774e9d07-3839-498c-2bc8-08de8ad878b2
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:39:07.7621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j5H651eX69a5KHWTvGOiy7ZYu51266Hi3UuzGKunxOpTa1PabPlsLyt5zXhIA50SKzXOSiVNVOeBC2oJF4ssXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF6E64BC2C

Keep Gsp::new() from getting too cluttered, by factoring out the
selection of .fwsignature* items. This will continue to grow as we add
GPUs.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/gsp.rs | 31 +++++++++++++++------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 2bbea1db0238..60ea730d1bd5 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -146,6 +146,22 @@ pub(crate) struct GspFirmware {
 }
 
 impl GspFirmware {
+    fn find_gsp_sigs_section(chipset: Chipset) -> Option<&'static str> {
+        match chipset.arch() {
+            Architecture::Turing if matches!(chipset, Chipset::TU116 | Chipset::TU117) => {
+                Some(".fwsignature_tu11x")
+            }
+            Architecture::Turing => Some(".fwsignature_tu10x"),
+            // GA100 uses the same firmware as Turing
+            Architecture::Ampere if chipset == Chipset::GA100 => Some(".fwsignature_tu10x"),
+            Architecture::Ampere => Some(".fwsignature_ga10x"),
+            Architecture::Ada => Some(".fwsignature_ad10x"),
+            Architecture::Hopper => Some(".fwsignature_gh10x"),
+            Architecture::BlackwellGB10x => Some(".fwsignature_gb10x"),
+            Architecture::BlackwellGB20x => Some(".fwsignature_gb20x"),
+        }
+    }
+
     /// Loads the GSP firmware binaries, map them into `dev`'s address-space, and creates the page
     /// tables expected by the GSP bootloader to load it.
     pub(crate) fn new<'a>(
@@ -211,20 +227,7 @@ pub(crate) fn new<'a>(
                 },
                 size,
                 signatures: {
-                    let sigs_section = match chipset.arch() {
-                        Architecture::Turing
-                            if matches!(chipset, Chipset::TU116 | Chipset::TU117) => {
-                            ".fwsignature_tu11x"
-                        }
-                        Architecture::Turing => ".fwsignature_tu10x",
-                        // GA100 uses the same firmware as Turing
-                        Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_tu10x",
-                        Architecture::Ampere => ".fwsignature_ga10x",
-                        Architecture::Ada => ".fwsignature_ad10x",
-                        Architecture::Hopper => ".fwsignature_gh10x",
-                        Architecture::BlackwellGB10x => ".fwsignature_gb10x",
-                        Architecture::BlackwellGB20x => ".fwsignature_gb20x",
-                    };
+                    let sigs_section = Self::find_gsp_sigs_section(chipset).ok_or(ENOTSUPP)?;
 
                     elf::elf64_section(firmware.data(), sigs_section)
                         .ok_or(EINVAL)
-- 
2.53.0

