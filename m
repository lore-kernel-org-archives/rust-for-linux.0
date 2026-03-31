Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012017.outbound.protection.outlook.com [40.107.209.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64B02F9C37;
	Tue, 31 Mar 2026 22:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774997016; cv=fail; b=Zg2uW5/zzaPJp0+z+/Wm+IEjm41rrAEh0CvyRvJ60jlNvqV+Q8PKVfSxABeNG8ZSCPKfkvPcDUsFhSlA72LiiEpBIMdSY2gm0vb4appImZ5r+kLqJ59esFGzkpj8YkOCyJXjlhocsYJmUFGHWd/efS3nVBDM0Y7GUUkMEjrAw5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774997016; c=relaxed/simple;
	bh=zMQynR2Iq6lBnL3vNtQ+3JwB8NANdr8jnxIFbbcHK7o=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ih4AZWhraM7VzEAQwdV+KXvLWrlag8COLoyATkHu8jp/HcJJS6Z4bLZgjzS5BG8zpJ//wEMjbNYghS9NRjFWvwjey5xQv46GacqhfcqigNhVJZfxGlwtyqnp/Q/bo6ViYOGAXGPUKVQZGsqI8+WPk+GXJgFovAQwAqYf5/u1Ss8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=idw4UBJs; arc=fail smtp.client-ip=40.107.209.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="idw4UBJs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f0BvGCZXCHsbq46REVyCwHwF6i6MUDV5Om0pFymfSJzaj2zjzT3qpLiL6tMwmKKbO589PdtCcu+bFtbHzVzehseWGfCwTI240qImcy3P4mK/744WT0n/0T9h19Yvhjz7he/lbeDVwGls/bEy9MhqiF+EK1b/qYqtaRASz2+8ILYyIdDBN8wUKV7d9zTKhISoeqoUvLaEBa0hHdFtsS5/H+UpTHFxv3vgVNLMm+ngBkBFRXgUq/Qi/M1Fu+cZH7SLsHYNL9KCWuEJ6CYH3/gUs2o/6u6AIsxa2LLczwx9Kk9rlZa6qSE1AktC9oEH+u5ex/1nsgkxQO8s7gUGs0tNjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Z8BcYf1fr/61vocs6eCb0Rk2GSCoTLjx+9seygjT2Q=;
 b=kGtdCBvlIMKlC810xlv7RdkvYbqG06+A3rVs6s94Q5xoIwYd0dV45uc8kPqRJeMJy3/YsWZM/yW0ogE6nd/ikbNdWYPz8wJotSKEIiu66rGOGsdoA7RWt2ZjgfDAEuQePDX1PzycmxR3SuBS6E8XYa5K3OI/rjaXFOssEDccKRchJCzVcmGcFXG0Ahv8fBKEVldOL/OK55e1/Pm1yOLOPCGclcSw9JL2oboF/AYH0QXf++CGOrIThH10N4e1VYpZfJCyZIOw9NVeDjorzbYymAd7wnZufh1gc96Kq3RmmLWeRGgWx37nZNWpebFk1dWCR8MEocKCzEYFMWKgKiQ05Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Z8BcYf1fr/61vocs6eCb0Rk2GSCoTLjx+9seygjT2Q=;
 b=idw4UBJs5CilLgs9Rs1Q1971pYK5ai5/j4D50fSTiMdhkiI95D4MzYZOh1TsX0DycV+V/vRA1rBpEu9IsVTvSUH59ERbTj55s+6wonlS831LITlUHioSrtctxYyzSGdD/X7uLeOLrSv5RdMTofnWMrCW/Uoy+7EpEHI7q4Yu+YigAeSLpiF+1AENJUV/PJN5wwN1H7Mjoy67WATiBuDDQ3Xa6Tt7Tazgdlf/47YL2S4nUilOlemj42DIgZSaABqfPFMPVFqXobVDb33jBs6hoe/gVMeFKmQNDVKihI9LQZfPpCZlBaIIRX91owrEeadCaHriz6ZmYkzzQlaOpKXHdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9412.namprd12.prod.outlook.com (2603:10b6:408:211::18)
 by DS0PR12MB6583.namprd12.prod.outlook.com (2603:10b6:8:d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 22:43:21 +0000
Received: from LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4]) by LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4%5]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 22:43:21 +0000
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
Subject: [PATCH v3 0/2] rust, nova-core: add DeviceSize trait for SZ_* constants
Date: Tue, 31 Mar 2026 15:43:17 -0700
Message-ID: <20260331224319.107082-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::13) To LV3PR12MB9412.namprd12.prod.outlook.com
 (2603:10b6:408:211::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9412:EE_|DS0PR12MB6583:EE_
X-MS-Office365-Filtering-Correlation-Id: 881388a2-1954-4b53-e1af-08de8f76e8f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jE/c5cto+zEBO7tyYf/+uO4H2gQnzYlP24YEebctr1AnoVV4M/TFuKz3cnvbkccqEOreUsu9+7HwOx2x6dJ58hLXgxeLYgPKhuG5Q1U7LO7fIQoC26aDril8Ds9E1u2Az5wdiCjJAzvhi6A6m2d9oUXj0ccXSHrEBRY7F6LlOrbJcH8OMtN42k42i9zdXg8X26+CMWOQ3NaHHco0x5Lze5WqBrRkbM6FMUz/BDDMyRbTzSzF6UscvWP0mIXL19XKtCzQQpN1OSVb1Bjjeph05Uj4dM0OPAg36Jkx4qYDpEGuPqgW64xh9/1cfJQ5zSy0RXxVj8hQWuDjYjOsXqOnZEF2ftB5GcZBEA/A3Nm3/43NhQh+Ngm1s1+lsqswoqfglYpIc+V/S0lBderAy+QXZxiZ+OrDX8OMuzjzUvzizn/f9qf+XEcrNlK+ZKB9HBvKqKZS/crSe/zMkdkrnXGfU4wjc8q10etrkIJIyij3vNFmm/gwFdmLr+etyl2DYoERt1G3Vj0VOUKkfKmS8abn8beafoIkXQ90ZAY2hLzvSW64YHbDOgWtFRGHGwO7MJlLHAbV/CMq4cGWa3OsRpP2rNZmv2U6x9CZGyKHENwGgT/+h1LIiQnOKlQWikyHJfGZU/qRlLAPZ/oORSnWjiQA422j5tnne8eznVn6gAxyRxtU4yRRVNlsGlVTSpp8dsJSx3xE3y/i4X7ElJ238znHISCI9OoVjCyW7yTbU78ymN6eeaI9af+aSuav0yyw2v5+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?roK63cshIjos6FaeteWwQTZGN2/XWosa0F2Q05XUu0yovkCX5C0SLCmrF1PW?=
 =?us-ascii?Q?xv+JvV32N8YPmkq78+hUZmnLeR4mgRATTngDclYkyR+s81Isp0k5BKVZAp26?=
 =?us-ascii?Q?ylAm6X6EAdIBdifMM2/qxF5Z6AL7F+/GQbgBhn60By3vusLrHgyMzjxWutdH?=
 =?us-ascii?Q?3y0HWy7pHInZPeb0/LTGdZ6hvD2elkL+IQyTmbwVs0GL9ozrW8Zfuctjd1eR?=
 =?us-ascii?Q?poX4tthNBZQ17wTIIzFc84APStvt5YEtzHgxOzjGItjjARoNBIlEJBrMAJuh?=
 =?us-ascii?Q?42CX6WO1+j/FKszIUBCYNUmaI4kSa646K6qiRhJrI37/rLLJ02RcVBdo5PzO?=
 =?us-ascii?Q?TvaLPlRa2MWCh/D5scjI1enI3ILnt5M7Io5NNkki3uYHnxIjPBq+Tpgvm7Mb?=
 =?us-ascii?Q?q/xl20s70WHEG/077VAE59QFjsfHfzqcMmQi/ypRA/IxzlBgOPVJS5sORJQg?=
 =?us-ascii?Q?o3GuLp1/Kfvd7jAbidMSAbgTAx8LFkPaPrJXMoOfwy/ZeeSNewfmY8qaasoL?=
 =?us-ascii?Q?80to1N/pxcJONMn/aql0c62ahuPjkV7jVGQWReVXTP0zQfXiLqdHA8kvQ+sz?=
 =?us-ascii?Q?ha8/59av+l5OIn89hOTBMabk67e8uffOUtsXr24s13v50m55W77UK5ZCZnO0?=
 =?us-ascii?Q?6vN6T9kyPH9RhVvflKg0Cdxb+79K3/U4vavpkjJocYi9IqTa5GvjEGrKNsgi?=
 =?us-ascii?Q?Az+huY7atuUtHOItQso6pe5ksDbyJtAU23HRzlofb7PM+vAvONi38FZSbnNu?=
 =?us-ascii?Q?rnL8qYzGFziZrbKBRtp7+cdYCqZajcnSvrUGx5FHwhZevSbopJC64pQ+bDcd?=
 =?us-ascii?Q?x5qM50agu5QqtP487kTYdqw0qRaAyXoH3pQpzx4m2TU1KgsBxHBKn7GWDQyJ?=
 =?us-ascii?Q?JapD7XyD/Nf7xZEjEtTbcFqaQT0A+BOmfzCOnxaGEWpOmF/LLcxKccFDFC6T?=
 =?us-ascii?Q?55iN8ipFESp/c3ryaoinVyLXShOPduPd3pfDc5w0d4myZ8YGCdqi3KNPF6G1?=
 =?us-ascii?Q?0p6lHjKRnEYZXvY64YsgptLoJKKj/TPox7UqZ8Rx7+Hfp7jV29L2L+O7Mwjl?=
 =?us-ascii?Q?Jf7/HDqCDbkPknxwBDW7n7f89F00LGnovJvlewenlkyRWr58QZ9eonBFZLwL?=
 =?us-ascii?Q?nwJs7uFR+gUJixHmYNQdPj+GWYcqOD8grT4M57K1xrAFPtxI937bx0OZtvuP?=
 =?us-ascii?Q?fGz9ef7Mu5tcX7YoEuOtTK2fEfMOC0E3HAr2WPHFSUkWoKN0f90M5UvpX4xE?=
 =?us-ascii?Q?kW5mqPCXUDbGWFPGYcuwco3tGmDwrbCkJvbpsOO0Yor5BnkHV/C08tleDmWF?=
 =?us-ascii?Q?eT2n27Nawhi1bkOjG0YZmkcrYEFK4yXzkc01xKpijn7eir2WxG4abNXBYFt7?=
 =?us-ascii?Q?pocTiSHUcyDUxxsTAnqIDM9x5Mi16GPMMon6XnrNgfa4hCQ49sz86eTc/n8z?=
 =?us-ascii?Q?zd0DAOKN9rQj1n9fjdXGUlUSM4IPbLv/TrzofIEZ0RtKU1Rf6ogCY5osp0WO?=
 =?us-ascii?Q?NQdr8Y9UvNy3DKRs2O7DGO7Ljrt9bWno31b0kggufDcj0M0FGNyw+0PR/iVf?=
 =?us-ascii?Q?FFsqMttWOUkm6YhRQeWeXA+6h776mbmlSKLe/MS85yMhfdQIjCYV0izT6Lz8?=
 =?us-ascii?Q?u017U/fhwdYJMBRiCqQj5eDYKir6OTmxhqN8fbjhi6LdDEFJpGYJzF+Zl6on?=
 =?us-ascii?Q?RhCsELAEbfVlEbS9uX06I2jsQDMV4O0ThUH6n/CoZ8XK9E1kL1mu3CRcme2z?=
 =?us-ascii?Q?C3SGoNMsNg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 881388a2-1954-4b53-e1af-08de8f76e8f9
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9412.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 22:43:21.2863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CzasY/4VeUHV970ODYfOaIk/stMjLfqbuAC6Vbg9XsYsbW2ibVHWmr52f2cxiMD4QH5ZAkSuNOVCPX8YkBoT3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6583

Changes in v3:
  * Dropped the Alignment::from_u64() patch.

  * Reworked define_sizes! macro to accept target types as arguments
    (define_sizes!(u32, u64, usize)) using recursive macro arms,
    instead of hardcoding impls for u32 and u64. Overflow checking
    uses u128 casts so the same assert works for any ("reasonable")
    target type.

  * Added usize to the DeviceSize implementations, so the trait
    covers u32, u64, and usize.

  * Hex values for each constant are now proper doc-comments
    (forwarded via macro meta), instead of inline comments.

  * Rebased onto latest drm-rust-next.

Changes in v2:
  * Replaced flat SZ_*_U64 constants with a DeviceSize trait that
    provides SZ_* as associated constants on u32 and u64.

  * A define_sizes! macro generates everything from one list of names.

  * Added Alignment::from_u64() so alignment values can be constructed
    from DeviceSize constants without falling back to usize variants.

  * Rebased onto drm-rust-next. No longer depends on the Blackwell
    patchset.

v1 is here:
    https://lore.kernel.org/20260310023145.120037-1-jhubbard@nvidia.com

John Hubbard (2):
  rust: sizes: add DeviceSize trait for device address space constants
  gpu: nova-core: use DeviceSize trait for u64 size constants

 drivers/gpu/nova-core/fb.rs     |  21 ++--
 drivers/gpu/nova-core/gsp/fw.rs |  15 ++-
 drivers/gpu/nova-core/regs.rs   |   7 +-
 rust/kernel/sizes.rs            | 166 +++++++++++++++++++++++---------
 4 files changed, 141 insertions(+), 68 deletions(-)


base-commit: 7c50d748b4a635bc39802ea3f6b120e66b1b9067
-- 
2.53.0

