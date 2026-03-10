Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011040.outbound.protection.outlook.com [52.101.62.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37261DE887;
	Tue, 10 Mar 2026 02:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108695; cv=fail; b=B3qqXdj4W0uiheL+w1stBYlaDv/HDEamtIBoB5N+pzYDvbgUXkjoZFVq3u8RNjxMrr924ZdgQZA4pr1fXF1pffBw7Hrsy2HPdGdzzs0JoNON1pXI0Uget+Do6wgL/7wwEKvE9mLTikqgBaZP/F++O42OWy1VACZUevPCgkQcXSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108695; c=relaxed/simple;
	bh=mdAJUU9Qqwiel6NBtgCCBiIQuKTMMQ2OgxzH0H2XNJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=jzu0opNjBFX4QDuoObgSO/KMqKfkb9HX/5kr+LAzGP4/vwG9X9OLbMVhXZ4lJ9qJ3Mlw4NZHEG1YoQeFtrjCPuoHvibPGLIeJRi6g9TyQfyPt/azbZ3XcoF4u105bDVE9jl1S5C2Mx+PwU+0UzmJFpeuId9BTylGnTyAZJREtb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=H6WQyvQ8; arc=fail smtp.client-ip=52.101.62.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="H6WQyvQ8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hVtgOVzn3DhVVC/13me+PgTx8UCgp4ObVYnvMtU+wZQWDzzbU+Xwi/we/wWW6jupgCGM8Xtp3kCuecyqO+LFtBCL5QhH0aYnF2objaTyNWITsTrkPVDL4IMh4+StHLQto5gfVKvphRxtzkqJ2lqv8KuZjsgh8C4Fb1UIDvYrJVNlnLOorjPjvA0kldzHY8CACfiuOnfkVbmrdR4jD70raIkITBdbRouZzfFlDLhnMg7SUKILqwOl9ldBw6lZox+GBw+GDRiG5oDQ+ba8gbQd7hl6Qmarx/fSON+itiHdf5jvXdBK08Ss9EJ4w2FkrmtFCqD9NTRrJMxwdlZxNVIddg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzzqOHR9vlghsiCVDtS0DjwOG8POZhcKFeO0quMEEyU=;
 b=xIHJRmkilEfu7dT794fhNLlOiULJcP/CjnalB9E3ntn3JgXOWGjDdvmsOfQKPzup6HOe+l9qcOLUQeGypr4640daMbxYb/FsVJyaMKI3f2pv580Q4HZ5lGbszHUIdOY2Z8bP2EJBfJrgoFz8Tfvg/2cyRa4yk9J5k3NOIh574GOPaw4eJKDMOycb8/8qxAXAI3aI2EEdwCJYus1cpWlEgX+QEGyfDoh0q8Tmlm0rtza7ECKpxZg26uMVbir8NxQwouFxqDXPQBI0HOHq5xuj2dU9rJgPfdOOpM48gL8iQSlnSIRvTlY3enEU7alEKGA5VJfJJDJ8HZGm26BSfoZMyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QzzqOHR9vlghsiCVDtS0DjwOG8POZhcKFeO0quMEEyU=;
 b=H6WQyvQ8UqQ27t5lvHQNGdYyDtbWGP+2kuy3mRqi+0XqL09XVI8Bb5EGlimHIpuwn7Q78lL5w9RvjQ2rkyleVN1NNSV/80de7SmwQrkfeluNDAViRoi9fpphpGn/g7WWTqPeB3KS87F+MC43/gVxVn+EIn+tw5o8uFtDpl3Uk6IRoBv3rhrBZRiUvU+jOaNqc4hu3GJMYY5m0PXanXe8X9GmC2oo5jakKl5/eWYUNrh4Phl78Y4l7u0wDV6Qv2GrslSR1KvnCdhdZg6UHBDNx3eIEyIR+kZxWjcmZAsVYHO87gosKicyLdNJfA9MeMBk889MpaAfzzaGYQ9MbaptPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SN7PR12MB6930.namprd12.prod.outlook.com (2603:10b6:806:262::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:11:28 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:11:28 +0000
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
Subject: [PATCH v6 00/34] gpu: nova-core: firmware: Hopper/Blackwell support
Date: Mon,  9 Mar 2026 19:10:50 -0700
Message-ID: <20260310021125.117855-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::6) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SN7PR12MB6930:EE_
X-MS-Office365-Filtering-Correlation-Id: ee50f189-7f06-4499-879c-08de7e4a567b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	F6cpFKNsm8HvNZ/65EqgzqPRXBPv4RV7gs4E0qfuts+QjEAY+xPEkRymW08LdSPRNRilMKL3pVcqJLXQp00zbhyh+m6YRk/ReUxFTPZolwXchgDmTFy8PrpwZOD5s8zc67QSdw4lMm0iHiTXGHO9kW71MAuS5Ai+CHAcx3wPxxN1W6KY+zkbp7vTvjPcCGOQ7JjQjIux2URN+WE34Lt2jgY9y5856/4WJ4kMNHeDCPcbAH7oLw2xQmg3ZRMk+CNXmelATXYbaO7lvlzdPv98Xe/jDG6j9TtnQ7c3nJT/jRDKMhckwd4wE89mtUIWzLFhcrKuGe6bK1GN2X5Fovb1054bYT3knrH69Vy/z4oH4w3DUexMRJ3xoZ3CFZV7IiTpxxQZv7trnAVRuWhrFac5a40AEK8YZ4kteX4piI0r0t54n2r82sXs5MIXPuNbvfVxGReE3rSsdrZ0wL/P6ECawyuTYlkG9Rkf1qElUV8oMoefhhmqC2PDX5iiMbrravaK8Ajm6SsgxKY5QYuLHP1pJ/VDVQIp9hy0t6q7c/L1YNu+5bW8yAvhDwq/0Y/9fM1uYoi24xjSvNTnXscJiMh/dzSYzhf6zsEZAEXVhVC1FdKRFkH2sJVCxw4PeuKpNGcGoErG2b2Rl4keD1mtU9D0s1a5tXOp8/w2Io40rBeZp4c8fLHmK923kg4FXKIS9laXEI136tHnRVNGKVIfVnqxWs9MY9sABKuja5KmIfseZqg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RGPa80QZ0b3Gg7K2gIhWbH8WWMbw0dw4xdvRFHf289M4pHXlrvUeBqmGo6+v?=
 =?us-ascii?Q?+oMngPcXj41m7sZQr4iEfvzzSjZWY1gMv/TNcMD1YRU6RQH4e3oAzy5bE00H?=
 =?us-ascii?Q?oHpGxR2yqKFa2c05CJf/iL/0eF3a9uIkAZDxe+L0OI94fmkfMYoYDi0x5+SP?=
 =?us-ascii?Q?7liwu7iCFVxLFx61hEzESjbf/RxYdTt5tTv+IBuoDRuvjlFWUlD1ZFUg/ZtW?=
 =?us-ascii?Q?7Zx/TGQas3o936d0674jubD10haOrdLkepma9d+1i4huq5Nl8CUoRwzpsFUa?=
 =?us-ascii?Q?nZoaevmiTvKmHtwWgcnnQhSSsbE2Pt1fSsGxxrnpFDma0FG/2uLejGHA5dd8?=
 =?us-ascii?Q?mf/KgMtS8G76eVbPv+OMG+ORtIabqk+Y7EMYr1vzl2A6ocfoQR5C3hC8mZX6?=
 =?us-ascii?Q?9T0f3sZcbLLu2sXTAZV15N71fHGYUexLgkBT4vupnnzDy2qMFKstoyBprv2z?=
 =?us-ascii?Q?90jcXes1I4iq7pCT0n3RQFhup8xQngpUap5viiqqyzK5lcSVe4ojt2Jaiue8?=
 =?us-ascii?Q?bpNt+U4lavOC2cHhSuG2v3i7Fi+cY60Ipu59ZOA5hqZQ3Hmdlm8OWuYWOjcy?=
 =?us-ascii?Q?fPrqmSsI3FW7p+SbGUfVfUYDXzUTFwd/98ErZqZUC6YUAeVqxUz+pSTrwS5K?=
 =?us-ascii?Q?0DT0Kxb2n2/e82DSK9nkx1qbeamZuxalECTvYIubl+8+xlQHN2Bfjx7EycP2?=
 =?us-ascii?Q?t8Zq66MMDXRzUbHmFVXFxXvTbwEuK9q9eBNyDqEdrprEvjjrn+1nsKoydxkD?=
 =?us-ascii?Q?5mi+hgk6nMsMoLFpSTFt85FqxOuLbEziyf1BZD2Or9jmZ09Tv3jLuhMipFFU?=
 =?us-ascii?Q?Thxm1jP9Qd2t39PMmO/no4KgaPCGRUZqJEYT5AZIBp0dD9vFzvrcy3ww3M2q?=
 =?us-ascii?Q?+pItg/5kd7eiXo965bquh6mhqRaHjSAFdUtaXHHLiVibYkL1+8fwNcszc9Ej?=
 =?us-ascii?Q?wU0HhB0cigwp+N+PGeE6byyZTtWOFc7+GiDbX3cJQgsutIJOscKs5Hx7h+Bq?=
 =?us-ascii?Q?UZJiNaVk6h9zz0rxX7/eh/aUeRDzDZKHGLh4rkV2o2H0LuCf8n32nqU4O6yz?=
 =?us-ascii?Q?wJotEchD8uGXLsQrOowhCgTB3+Yk1QXX0ikyt9RvCfOjO/gN6nwDbhtx7X2h?=
 =?us-ascii?Q?d92erHkamsfM+E9yg3/zMxC8oTXNNQBdrPy7h3padbXYRwTl0A/p8ADpAZwP?=
 =?us-ascii?Q?HDNePjKTh9zIissLc56SDoQ+GCaYap2Dax4wHSTPV2d8TCxv8HNMe14yE2W8?=
 =?us-ascii?Q?GmBhWnuDKauizQz04F6MN5meLESt4qBChlUqPS8I5eH3YAwYkEf92/qE2vcC?=
 =?us-ascii?Q?9+VKsx481p3lSvfwgXV7U7MwklRxlR7CvqKxR0hjo0QSxbV/XGPKjk1kddnN?=
 =?us-ascii?Q?79AjMURXJ20Z3f4vFBYPAA2UdGZJvHzGEK+uS+0i+A8wA7mZqmPLK+hSvDp8?=
 =?us-ascii?Q?tr2OjqdoLSQqoLG8OUg3l8koEo9VSvBwJ8L2kL7ZQf0umyj9DTf+5pzWRYI+?=
 =?us-ascii?Q?gmK06ZoGPJVD4UQZGIDSl+S/sN3CCeYaNc3Fv9sa4lsIxG5jFqSncedIp8vo?=
 =?us-ascii?Q?rO/jMHXwym+7i5EqcbdDlSqyjGN6UB101Yr7E1w7QvW1uZx0AFP/+osbWcV0?=
 =?us-ascii?Q?XyY+Ahd2cH+G7h2zH+J7N+pRPADWMouR1Vaa7YEh5HlXuis+8IBzrP2hgSVP?=
 =?us-ascii?Q?J8QNk4WgKSMiVfBK/Zw1qDhfbcfHc8tACAAR+TMUhuhz2yPlMzXvqhwghPDa?=
 =?us-ascii?Q?E2yhPTcmzQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee50f189-7f06-4499-879c-08de7e4a567b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:11:27.9389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pkrZnFx6WmOlxY7Fr4sJmL0dThXsodhBKHeosSwMQ+kN+aDTHlwo1YuINc0RQoRZKCmf99pHlPb3zzaLbcPDQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6930

Hi,

This is based on today's drm-rust-next. A git branch is here:

    https://github.com/johnhubbard/linux/tree/nova-core-blackwell-v6

It's been tested on Turing (new!), Ampere and Blackwell:

    NovaCore 0000:e1:00.0: GPU name: NVIDIA GeForce GTX 1650
    NovaCore 0000:e1:00.0: GPU name: NVIDIA RTX A4000
    NovaCore 0000:01:00.0: GPU name: NVIDIA RTX PRO 6000 Blackwell Max-Q
    Workstation Edition

Changes in v6:

* Rebased onto drm-rust-next (v7.0-rc1 based).

* Dropped the first two patches from v5 (aux device fix and pdev
  macros), which have since been merged independently.

* const_align_up(): reworked per review from Gary Guo, Miguel Ojeda,
  and Danilo Krummrich: now returns Option<usize> instead of panicking,
  takes an Alignment argument instead of a const generic, and no longer
  needs the inline_const feature addition in scripts/Makefile.build.

* The rust/sizes and SZ_*_U64 patches from v5 are no longer included.
  I plan to post those as a separate series that depends on this one.

Changes in v5:

* Rebased onto linux.git master.

* Split MCTP protocol into its own module and file.

* Many Rust-based improvements: more use of types, especially. Also
  used Result and Option more.

* Lots of cleanup of comments and print output and error handling.

* Added const_align_up() to rust/ and used it in nova-core. This
  required enabling a Rust feature: inline_const, as recommended by
  Miguel Ojeda.

* Refactoring various things, such as Gpu::new() to own Spec creation,
  and several more such things.

* Fixed three Delta::ZERO busy-polls (patches 21, 24, 31) to use
  non-zero sleep intervals (after just realizing that it was a bad
  choice to have zero in there).

* Reduced GH100/GB100 HAL duplication. Made FSP_PKEY_SIZE/FSP_SIG_SIZE
  consistent across patches. Replaced fragile architecture checks with
  chipset.arch(). Renamed LIBOS_BLACKWELL.

* Narrowed the scope of some of the #![expect(dead_code)] cases,
  although that really only matters within the series, not once it is
  fully applied.

John Hubbard (34):
  gpu: nova-core: print FB sizes, along with ranges
  gpu: nova-core: add FbRange.len() and use it in boot.rs
  gpu: nova-core: Hopper/Blackwell: basic GPU identification
  gpu: nova-core: factor .fwsignature* selection into a new
    find_gsp_sigs_section()
  gpu: nova-core: use GPU Architecture to simplify HAL selections
  gpu: nova-core: apply the one "use" item per line policy to
    commands.rs
  gpu: nova-core: move GPU init and DMA mask setup into Gpu::new()
  gpu: nova-core: set DMA mask width based on GPU architecture
  gpu: nova-core: Hopper/Blackwell: skip GFW boot waiting
  gpu: nova-core: move firmware image parsing code to firmware.rs
  gpu: nova-core: factor out an elf_str() function
  gpu: nova-core: don't assume 64-bit firmware images
  gpu: nova-core: add support for 32-bit firmware images
  gpu: nova-core: add auto-detection of 32-bit, 64-bit firmware images
  gpu: nova-core: Hopper/Blackwell: add FMC firmware image, in support
    of FSP
  gpu: nova-core: Hopper/Blackwell: add FSP falcon engine stub
  gpu: nova-core: Hopper/Blackwell: add FSP falcon EMEM operations
  gpu: nova-core: Hopper/Blackwell: add FSP message infrastructure
  rust: ptr: add const_align_up()
  gpu: nova-core: Hopper/Blackwell: calculate reserved FB heap size
  gpu: nova-core: add MCTP/NVDM protocol types for firmware
    communication
  gpu: nova-core: Hopper/Blackwell: add FSP secure boot completion
    waiting
  gpu: nova-core: Hopper/Blackwell: add FSP message structures
  gpu: nova-core: Hopper/Blackwell: add FMC signature extraction
  gpu: nova-core: Hopper/Blackwell: add FSP send/receive messaging
  gpu: nova-core: Hopper/Blackwell: add FspCotVersion type
  gpu: nova-core: Hopper/Blackwell: larger non-WPR heap
  gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot
  gpu: nova-core: Blackwell: use correct sysmem flush registers
  gpu: nova-core: Hopper/Blackwell: larger WPR2 (GSP) heap
  gpu: nova-core: refactor SEC2 booter loading into
    BooterFirmware::run()
  gpu: nova-core: Hopper/Blackwell: add GSP lockdown release polling
  gpu: nova-core: Hopper/Blackwell: new location for PCI config mirror
  gpu: nova-core: Hopper/Blackwell: integrate FSP boot path into boot()

 drivers/gpu/nova-core/driver.rs          |  15 -
 drivers/gpu/nova-core/falcon.rs          |   1 +
 drivers/gpu/nova-core/falcon/fsp.rs      | 222 ++++++++++
 drivers/gpu/nova-core/falcon/hal.rs      |  20 +-
 drivers/gpu/nova-core/fb.rs              | 113 ++++-
 drivers/gpu/nova-core/fb/hal.rs          |  38 +-
 drivers/gpu/nova-core/fb/hal/ga102.rs    |   2 +-
 drivers/gpu/nova-core/fb/hal/gb100.rs    |  75 ++++
 drivers/gpu/nova-core/fb/hal/gb202.rs    |  62 +++
 drivers/gpu/nova-core/fb/hal/gh100.rs    |  38 ++
 drivers/gpu/nova-core/firmware.rs        | 186 ++++++++
 drivers/gpu/nova-core/firmware/booter.rs |  35 +-
 drivers/gpu/nova-core/firmware/fsp.rs    |  46 ++
 drivers/gpu/nova-core/firmware/gsp.rs    | 140 ++----
 drivers/gpu/nova-core/fsp.rs             | 525 +++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs             | 117 ++++-
 drivers/gpu/nova-core/gsp/boot.rs        | 300 ++++++++++---
 drivers/gpu/nova-core/gsp/commands.rs    |   8 +-
 drivers/gpu/nova-core/gsp/fw.rs          |  80 +++-
 drivers/gpu/nova-core/gsp/fw/commands.rs |  32 +-
 drivers/gpu/nova-core/mctp.rs            | 105 +++++
 drivers/gpu/nova-core/nova_core.rs       |   2 +
 drivers/gpu/nova-core/regs.rs            |  97 +++++
 rust/kernel/ptr.rs                       |  24 ++
 24 files changed, 2016 insertions(+), 267 deletions(-)
 create mode 100644 drivers/gpu/nova-core/falcon/fsp.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gb100.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gb202.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gh100.rs
 create mode 100644 drivers/gpu/nova-core/firmware/fsp.rs
 create mode 100644 drivers/gpu/nova-core/fsp.rs
 create mode 100644 drivers/gpu/nova-core/mctp.rs


base-commit: dd8a93dafe6ef50b49d2a7b44862264d74a7aafa
prerequisite-patch-id: 1ec0faa352dab8fa7c0f209474b75cd21931340d
-- 
2.53.0

