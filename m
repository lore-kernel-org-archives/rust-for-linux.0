Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010026.outbound.protection.outlook.com [52.101.56.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264323C0610;
	Wed,  1 Apr 2026 22:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775082478; cv=fail; b=SygwGHRv1YzL3/d4pagG10U4yoUg3WRV8F3Rm3x2pCY/7Ue9Dn6i3Ab2RrpytyW9P8Jw1sFuCRm84d0QArNAT+Kqvql1RZHZkQp27CgqG0d8R8EU7F3ch0fmApMvYILj6m0aFjPnfv2LbnNG0qzjHbLWsmAoI698vLuDbAkgGBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775082478; c=relaxed/simple;
	bh=XXDojUPiQdPFGXnfTBPA5NI+GLOGbRgxi2aL+8vbO64=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ie+u3/W+F5jb0O11ZL2tEGD3sovOdakKUXWQChtra4i/ccTQIhHc8Z4jvovR5ZIfOLWaitUdGsPn4LikHOXTK4h49jwMlrPAoQ3EIMDv3QzP4cp/Y16OQEYkl20DRwhBl5EKUYNUKIcybMsPX5dwpc+OYe5SIdJ24xF4XR/nAe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=C6e6PNGD; arc=fail smtp.client-ip=52.101.56.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="C6e6PNGD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u7e6kD8vCYALfb/TQyMqRU5nhUkynYj8aI5kllxRZCPxpapSg4ej5x0013o3xQwrvuzHKGJ7hbb0eP7rQ9fIjVu5aM5UsXRyz/3I7AvReNCLtMEuwbajXrm0MPvmXKgiiKHn4cil2eg0FVuFlNZ9o9Y3ltVfnsftzASfn3SH3nqEqCzs49HBjqfHMYbV39RD6p+TazEAoUwyxnY/nAlRnlRi9n3yzkcOyuDmKpSjI0j/OEy2ZUTlU3NgylKJFmknIfH9NDzrdK64hByizm08Eglxu3eF0RIfZnoNHHe8ZxZs/FAXmX0uhvkxC76GxDjaW8ei1SFdWTOI6OpCdRig6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/QDMKlR4LWg5+oGhkExD/bcbrwfnK7o3BXQV50Jl9C8=;
 b=vlbOzFpfX984FVC2Qz6W2v1UXRLx/JaNrwPsUEdFRASnCQkjXf4b4E75RJpykwW1HMoTDGwyH/7plDeKzNGUEztIWJIcN/iyJUwvbSWeCGG/0X33NyRZ/3mQAz3iRxMwszmhNndMJSWs6DevvwA6ucKHoBP5SRZpv00LaofUTbWFiXF9Oknl/BOUTKXzT6MS1Y/AA7o1Hy4lZcH9TGA1HiFHJg1+1h/G9/2r469kwYpHGYiZ5vzlGQ5rbOsBRvpDxcVmhcK4ZspnHA6QqsuoLh5D0SAw6SkY18VB09EhfCqge8K4BoBqa+X4MhJ5mRsTN7wjonRRtjxhHAfaz4NvCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/QDMKlR4LWg5+oGhkExD/bcbrwfnK7o3BXQV50Jl9C8=;
 b=C6e6PNGDXsS/QHghiuG8kFFMk+tCq0myrFjVr7oSR+2M3lCX5vD8lsnCiC4w0M6v3/zyP+z3E9pInq3keFtwcVj/o2LW7drKTFSyBr/5q5kQo+RDicqxe5xtKfJCrm4dUp2cNhPQPLTTkrR/CkPNy+sYJZIjFYeuYsQUmEmEQ+RENzsLlpU9p0xJ8eXKU2Cj6H7NAeWT1rF2tbXtOZda9Mkr7/T7gqGitsq0fYEVf9veMBSW+nGo3EBM8g32ke8W7YtKdKZ0mTE5l4Jhdi1itmPCY2C1/LG6eFupzlq9IHXoJtYUH9x6WenZqJMAruwHqK1uKIx5E3+lQn5ZCdMouA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN2PR12MB4456.namprd12.prod.outlook.com (2603:10b6:208:266::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Wed, 1 Apr
 2026 22:27:46 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 22:27:46 +0000
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
Subject: [PATCH v4 0/2] rust, nova-core: add DeviceSize trait for SZ_* constants
Date: Wed,  1 Apr 2026 15:27:41 -0700
Message-ID: <20260401222743.148710-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0169.namprd03.prod.outlook.com
 (2603:10b6:a03:338::24) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN2PR12MB4456:EE_
X-MS-Office365-Filtering-Correlation-Id: 33c072f1-8840-4cc1-e5e4-08de903de602
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Wr3UvZHW3cXUWATSpamkIdwKxZPTRRWy9tLCGSGMSQqvNByDSzdfL4j0V33/jYLNHWcy9iTBKuCwX/dy07bG6RvTCt5mwheRM4ZJaan9FnhKtWExZH8JssRyZtVP7qlqD0p10KM7J0SwUM6rlY1RlozqKIG/gGzgTDSePPqxle2LcDRRVQ57KoVVar0eF8YR+u935gNjT4rXemDjGFITkjC7GZWoZQrD9b29r1TCgJgwqj7O8zXCO9n84E3mul0DxwzV+BKZ0h83YoRVkIhzito0bh9j5eyJhV8by2EvLKrGofZjziKe9ORrjnAinnT5BaM8JhAA1LKJqVFVaYxhAFP6dtrviY3Sklex9C7Lf8MimZveGOtqf2ptfBzaCZ3RKi97qDZJyZacuRKQE3FAJLCCCoNuVEA8ObcOVZ2qWebkS0FJYwCSQNqay6gVF/BpWY6As9Aeu8rCKTNIaRhDNt4gZrhiQZR1c2LJDZIe3u8bt8kNJGj3wVjeHIPsQaBwlqn3JW4j22iNY7iUcL1ISnBD+sDerUaBbiz7BPEZAxEd+6RdcZQwZ+yJFc+J1UmHrQ3pK7Wh0hIsv03U1cyqM0Ey8pzrB/IOUSLhRWtyH+9G92xZJpf7oaCvLuUAmd6N/swNGQRUl5WzMDBU7T9iN4mSMNlYFIbt1RxoHGltdqXiJw8+AaomBNBJJuWs/cSqQjMqZJFrRqf1czWaXnfOp/KT46FP6S9ivKE72bgZxfM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lt30ckdgTWnoB57AD9EKAd35uHeLOBxIgSHAgyRlzQYMlMs9KhnBV7vvPPa6?=
 =?us-ascii?Q?TfLuSSVQWMND6pOJDFDQccumu3At6UO5CCFOn0CUQULgvPxNNjnHfeUIi4MU?=
 =?us-ascii?Q?t0KoORpUBPpIuPZepG/hhgdswcGnGRiIPAZeQixcm97JgOIGFNH4MT9l78DP?=
 =?us-ascii?Q?wjAjH9riP3iZF3VlcFmxOnUqzF+p5DZpL3UP5GXpPsP2HP5K6VmZoEVkG46/?=
 =?us-ascii?Q?RlWSNyUGr7jCenzMLFHi9evCjAQjpop9q1sklLniYgzi14xjaanIhZHu2oTO?=
 =?us-ascii?Q?vseOPL4GVo9SOifIJJqVIIZftumD+vBToq1KnrBzRYyzbXATSLKxs+/tIAgf?=
 =?us-ascii?Q?urd/ot8TWjetBovkQMmMxauf/y/LXNNFMQoPZSIh+hQdp3oCHLSh8PHh+fTv?=
 =?us-ascii?Q?T2xroNVZ8j7u62CUKQ5gJEW1SLd5j6QyeJlSg825t7d0TV7up8d4C+jxkz29?=
 =?us-ascii?Q?9BWaTn77/ZD3f7zWABT+sVDaq4YC9m7mZ/HMAq67PUKE03mN/MEq3wxWNmcK?=
 =?us-ascii?Q?T3nF1aD+GQBaNY12SeR48DKPjkC4GHIAQODWzZu1Rg2pheyXbFQFt+7khtXf?=
 =?us-ascii?Q?BoOC2IJgybpcwKkAJ0GkaT/0qennrKsrNyASPj1ahsodGcw2Tw7USgApn5Eh?=
 =?us-ascii?Q?ZVmrG52DIwB/CONVYjAGzYGmx0UXvzQikhNsR3iKgQq4xr/kB/HHHWfxULwf?=
 =?us-ascii?Q?1ip9dv90XeMaBWuQpEHzMy0hPMUI59pwW4S+A4GFjLbD3t0Puh6q5WabLO1t?=
 =?us-ascii?Q?63zjvS+kGP5xwi20vxEYzV1yGtYl4hv3u53PuG1K2VtH2q2LtkqoemvgD/Fu?=
 =?us-ascii?Q?WHwtIqrto155mx76JsYxfJW3ci0dKKgNi2tbiVBt46d2vUJhuMY9IGBy3tJU?=
 =?us-ascii?Q?AAAMtV9SGxBGC22PsNfIeSU/oVoe9WM7YQxcAyHQgZkZp59ijRa1Spv9H/GV?=
 =?us-ascii?Q?IjO2Pb2uZgSzxVHJ4zRRetufTGNm99Xnb+nOUqfhm5hf9mXf1IyJlVdSgAJj?=
 =?us-ascii?Q?eQN7UGSPekZYrydlp2+6DbRJ6w6S3tfU+pCGmOCxCsamJIbbjdFWUZnHXRIG?=
 =?us-ascii?Q?O1Hap1MTcX1gX/ELYTJNV8CymYY8gHBRsamvaP/T3muiB6gAwTF7l+/uNolF?=
 =?us-ascii?Q?VII0FPTgd4/pitbpJBTItilf7M1uh6l7zbf0xTP3RUii8MYFw5u+Yv0FEO1n?=
 =?us-ascii?Q?NLiqYrvnIcEaGRFZfZCXUoBOBejFmsjFo7cH2HKjegdXfl3QFZDEkZK1ftaw?=
 =?us-ascii?Q?PebxsS45HRjHkAuZN2SiIceyjOboBVgjieFHuUf28ASWn11rz4rTr9GfvL0n?=
 =?us-ascii?Q?umWdb7QR9mk+IBYkKyTbO5mpUTH3dRitlEAMvjKQ3+1yX5ORXVQ9BNoV0zqR?=
 =?us-ascii?Q?xfLnRecbeLJh/bhzYKU/5X7z/Y/NvBBqON6eQOl+0lDNBrYZcJQ/MRQ0Vd3v?=
 =?us-ascii?Q?9uaPhIld/9vo4BpbwnV/RsnRTmvVBlXCnl40SG5v2ny4SKDsmlJkfpN3iR1t?=
 =?us-ascii?Q?l9aqTurBMLhNnTfvxIbKA6x3Wi2SEbohuD42vDpd9Zg6GnzAKvEAQKBPdh+Q?=
 =?us-ascii?Q?o2mJgQQmCujGuyRbv7BVRW8pkw7t2MqtP7dw76Ji0LUsG/sjXCU0xRMyZHIV?=
 =?us-ascii?Q?+Y66BuYkcnzYbR9JzuoGqGQJM+dE5bWeln4TKpbTEfrjhRKrfXBtZvn0EJjL?=
 =?us-ascii?Q?Yqq2hofnvI0plBXIxSdIj2Yb9T0GHVTt2uIlEgbsvByyHWHTTwqUGGtboQ4j?=
 =?us-ascii?Q?zDZDVf39YA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c072f1-8840-4cc1-e5e4-08de903de602
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 22:27:46.2223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jGNY6ufZPR5vQOsuftO7zFOIiHFjQOVJf38D81L6RLlidtjOg0sYNinX3+w9U1uRYSzK4pSjvClP+llVNrRNrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4456

Changes in v4:
  * Renamed the trait from DeviceSize to SizeConstants.

  * Added backticks and trailing periods to all hex-value doc comments
    on the SZ_* constants.

  * Removed redundant type annotations from doc-test examples.

  * Used a `use` import for PAGE_SIZE in the module-level doc-test
    instead of a fully qualified path.

  * Rewrote doc-test comments to clarify the distinction between
    module-level constants (no type qualifier) and trait associated
    constants (type qualifier required).

  * Added Reviewed-by from Eliot Courtney.

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
  rust: sizes: add SizeConstants trait for device address space
    constants
  gpu: nova-core: use SizeConstants trait for u64 size constants

 drivers/gpu/nova-core/fb.rs     |  21 ++--
 drivers/gpu/nova-core/gsp/fw.rs |  15 ++-
 drivers/gpu/nova-core/regs.rs   |   7 +-
 rust/kernel/sizes.rs            | 167 +++++++++++++++++++++++---------
 4 files changed, 142 insertions(+), 68 deletions(-)


base-commit: 7c50d748b4a635bc39802ea3f6b120e66b1b9067
-- 
2.53.0

