Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010042.outbound.protection.outlook.com [52.101.85.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E607383C90;
	Thu, 12 Mar 2026 03:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773285315; cv=fail; b=hTM9L7s/qBtBoYc0kKGCgvbz+c0Uq1bK7tNtXbLHazxnIimUB3i8Vxlv0r01GgblIqHslxKt3YCmwM82kanR0WG0g33VA2cd6I15LG3W4Bn2utHMPB9B/zt7UG6A0DEQI2E7gjF1TJP3h0LNsYh9w5wCarXZLigs62xmujQcI1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773285315; c=relaxed/simple;
	bh=jPSuU5Hj2VhBHlkax25UmmU6QHrMe54C2qHUoctStzs=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Np/0Ebh5nX6tE6vl6h3byDYX1D6UQ0h143NuUAWxcwJIIeQ6P1HE+oWC8zCDtY4orsvh/HNuit+sp4NQGy5EuoprrxYayxevmwPJm+0Y4SzErADK0XgStN1kc9fuL8WmkH9QPUGl/GzNLkmE904xRKSgDTA9B5FOHIfPiLXIPdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=k+plr1G/; arc=fail smtp.client-ip=52.101.85.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="k+plr1G/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zC4DvcJQVNcdbdBC8IkTM7JRhtfNE383NuUqF42bz2utGbUJe9/gjjutIfEhF44XN6LURTw6BkKlkjy6SScHUC6ULX4KYZt3Kn0hUzLA1UyZ20T/fHbhFlNvH9ciBci03MJsXIEovm57JMYGK8uef1Ap+x5dq9w0T53ex0LZoyOc4a8sfoGwEkQoMvZmR0PuPE2qEdDviE5UuIwQoz7jSIG5Tjw5pYjLdM2r3fT/k490ge8m6GuGGuNOZw+B+q/70qg1W0w4tkjZqVE8Q6Sz/ITZipcy5aejyIaCYFCB4uP8yPwGhpCgQCw7OuuxVu1aOji6nRQAo/BOU6PJ85TvyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8HBNAbEQjM+qZ8sDGw+AcqTBr0u1tzz2Urb9KVOQe0=;
 b=eZ7hnvhy/njZDneWTGSICnKpYMV5ZB9sYfcxcH7s2+BuQHiKZxSJbkTgQj/DJoa3m2GflB1/xV8JCmP3KxOiaBwufYqmS7QGx1Bs6lQ06K9+FvwOY4MTBDQppjfCL6iqrmeuPF4F/3H0dW+6EIWwZQF2MUv5X7vToMpaJBDIkTtVmsl+z8Okgy6jvF7u8t96fQHArMlHyyMapertImeE21RH34kp4varFBtyQO+Eq7qkn0WsyHd1No/7a881QuzCYxuxHbqAdh15YfJ2/Da67xtItB/uSLgVFesuDtvbjVioaoT5SDQmHNTawVBIlymgsA+ai0HIVFFxJWWfufmu+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8HBNAbEQjM+qZ8sDGw+AcqTBr0u1tzz2Urb9KVOQe0=;
 b=k+plr1G/lcjdiD0TxPTIE5tfw5mYb2z8b34/ztoIicHg0WxZt+xdHkRou6i1zCKbYqUmQkuIgAUk6DLUjQ3GKaUPRU0qGBGthxWR6bq1ztq+GiHsp3r9Y82yGwMPsIvi1FSwaYIkOnYyz/BnC21P8WrGq2X3b705mZ7ozurAP1zUuLSCQjdQWrypS3eCZogKuvTsDUAt2z51D+sN5n6fr7LSmQIXEKzyQ+3Lsfd+FjlByUdfxqvkHNuk7WiuUJe5Er4sgEZqr4mAHB9xH07MdoIU5SvVsMgDEIXBTwfE+p72ucslOahjMuAvpEOFHZ0Ovafq+x4NvaJcaaKberXMew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CY8PR12MB7563.namprd12.prod.outlook.com (2603:10b6:930:96::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.4; Thu, 12 Mar 2026 03:15:10 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 03:15:09 +0000
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
Subject: [PATCH v2 0/3] rust, nova-core: add DeviceSize trait for SZ_* constants
Date: Wed, 11 Mar 2026 20:15:04 -0700
Message-ID: <20260312031507.216709-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::39) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CY8PR12MB7563:EE_
X-MS-Office365-Filtering-Correlation-Id: 89658311-d9bf-4b61-90cb-08de7fe59144
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	urir4OtR18QnlCUI358O0irHTsL3/3fMDhpD5whtpvb2Ck2aqggWrzYv3PO4a17hFxYZGUq5mbl/UGU7Y7OBZJHkl4PVdZkp0d6DpjVxFSeOp9BIUzsNrl866gLDvJpVkFxUet2eOQOLIxdpDjF4i41q1BK/ayWhFOVEaaoPxBx8Itpvg9HHXeQMe3GyYFt2Iau7zyUANaLh9uqDBvc1yoiiuymhQvObfmo8sUWCKf33+uJnsjEbh967f/1sK621enS5HF3EvjSts+tDJffv4lCnp/HyaPU0cGPYOzEGG3lc39naGZ+/DY9GxB9XnZV8AFCHj6euIDfEMcGQHz9QG6HItYuGBZUOLYxzvkVxo5PLWt6/KxWSiiwKT4XC6SOT9ih1K9cm5qzL5dD6WQ9+Tpeq/svO4OpSs4dWtLmy/Q9VoxK+wtGuYuo3YYNGrRSovOZznqixdlvcyWSVrKndF3i2VtwhyBZcq9A5T+lJGuBCFuucpUkjDC41jaHavSMzZyJNNNRK9rm2jOZrLhktM8O79o3qyo6/JEf2xoF6mxpqyJjvtDNmW7LUBfDd//5rYrZiKYCUHMhPPYYqEqYRkg2H4zJIaPiyk/3TBIkNgN6wX3QHfjXCE7c7OJ2oxVXJ6Q38A+IemOsi2S4qR4s8gK62vs0R4U+2ltslqCYBaRbyHpdHACxLLAYlwXnx7fjGBRWBqanEHveoPt+Xv6eJkQ42iswM4aiCgSKhm40izRM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TtphxnrT5uj6ZwC5/ZCiBHz0isnNnuiBo5c8NL63yreS411J56fXq+TxW5r1?=
 =?us-ascii?Q?84Fjmn2/VYn+3nsZUu0igII1a2fArllTdctiQyKRbsjrj9ybD9gqGsdkvlT9?=
 =?us-ascii?Q?wToSopwcsIyIJBlZRyYFSDGEnh/Is2EGCINV2Q6rJqMleK4IPtzmYMfe3Sfe?=
 =?us-ascii?Q?Rl8MkgngqiMUSXlgf8mNoeCBC/6pD4V/imBw4UHTuaPGosNiJxVYZ2e6cQPJ?=
 =?us-ascii?Q?Z49EtxI5JfCmTNI5T1GsHWc8Z5m5fdtHpIOeGyCi8fppZJvIXQjXt4GOscQ6?=
 =?us-ascii?Q?qVNaiBevP8isTeOXFNZnAMzq3iG5UqO6Ns1rlu5skbNTRF1T5NgNzUtTP+93?=
 =?us-ascii?Q?mR4ZyKdG03o/BJ2i2Cy/JEeEAPYybKrm5QKnqzS6HT+wPdffbpZJoD02/IOt?=
 =?us-ascii?Q?dNcPnYTpl13M+0VXH6l1RxH+bc+kmaXqIWwV0lONEQC6K4ZiFOigB988Plh3?=
 =?us-ascii?Q?ffLjGT9dbtxicYNloB/Ive715ZdaT+tLDlX8S0X1aGqlWZwtdub3cnmUIXbD?=
 =?us-ascii?Q?+4TMunyZhBh8oRv+S5EjwcI5MR00JUG+6Emk9IzeU6tPLv++yL3xrDaL5UaD?=
 =?us-ascii?Q?3tJSQYlEBdAQpdMAc6hMt4dstUOKh6zssLxNswqTSQU7fZJ0wOOUf790f6ii?=
 =?us-ascii?Q?MpKdUaCpcAcIynouI2z4VOIRbISVyVX1JYODrTyyCr32jQoNvXkr7LgqwgpM?=
 =?us-ascii?Q?8uCRST7edjn8yxi9NSwOUw5OR6EMrFS95nz6vBsMN8qdvgxk+lWGvEldUhuq?=
 =?us-ascii?Q?GDm7LU+L3m+UJtekRujCZAaY5+StiOQ+MzqVLVlHlbENWRaqUAhkzx7ySJF1?=
 =?us-ascii?Q?JvBSe8NKe7iKJMkcMQlv1YzHMQ74pJ7gVlJwp69rZ+8UrDAX4n/ZJ35PR+Nf?=
 =?us-ascii?Q?tb4GY3sHLvSWSDeiprrG7eCZA/tKpLSTCWFQu1BZKocNI8j0NuCAfzZ4JvET?=
 =?us-ascii?Q?3Rez2e0HNBEwoIjyka09bWCymQSXAV8HtWjYW8Ij2J5Fkbvoy0zkl8m8eURC?=
 =?us-ascii?Q?3ixRRNybsXdEweJOJY6rAgbShiMyf+um9vF2ngvdS2RzEMgb9NPH5KR6tpxU?=
 =?us-ascii?Q?4GykGfUhmIEPCBVd4A/47amldTmxjnuMPmiFf3IIJEO3b+1iRo28Xerjpd5y?=
 =?us-ascii?Q?WN8SR5APRNyXWbTeAy2xB60vzDayeHV3Om04KwXPROcTd3u+iyyTde7/2fGD?=
 =?us-ascii?Q?jU4eEaO2yWQgotMM4j5TNbvxDaO9VNx4vmHDICq448wjOaPuKWUv0TFtpP/b?=
 =?us-ascii?Q?P6P0pf02kBTIOLw2FU08A6Yo1moFy61nZZndFV2OFHzAzRXza8Fza6VVhbjA?=
 =?us-ascii?Q?AI2erhJRsMbdTvdBFAPTWpZ/E+GEDZzDWfWequ6oHxuF8d52X+z7SWkXDYcK?=
 =?us-ascii?Q?sDxgMsAwEO77zBBFB5YT3rjQT0syvMhuaz6FVyzgJbkJj4LI9ZRMM9TKLWwq?=
 =?us-ascii?Q?Te20QNiYbrlDhJyF4Xyu3kInEBwWhRInGgCYEQtly21yWO+8PY7f3syong8T?=
 =?us-ascii?Q?SKdiOsQAPY/0u7JOoD3IWR2P2BgssGDS/qmojEUdFJYC6TxgDWc2VBwwMF6v?=
 =?us-ascii?Q?JrXE3qikyqXjh5KVho050mUuk+Z76kGf6aSGqSrHHOqIWAVtahmWkdZAUl4j?=
 =?us-ascii?Q?R0YECSCtcqdEU/UQoxshlRMsJJagDv/QpeNxNX8um/0nNZk5rim096ClTB2X?=
 =?us-ascii?Q?be/9H7tl3ZUoREzavnUTlhCwDwL6oE+IIP2ixsMo3Gjuaq9IHsmtPQVaKpXS?=
 =?us-ascii?Q?Mlbxc9QtRw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89658311-d9bf-4b61-90cb-08de7fe59144
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 03:15:09.7179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oaNKdLTWIE/bbOpDaHX1eMXlLP0ifz/sVkXEZLW6LrCrKRMB1ihA7qvPBLREnP0HMxPOJ8zFJn2Lpnwphh2daw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7563

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

John Hubbard (3):
  rust: sizes: add DeviceSize trait for device address space constants
  rust: ptr: add Alignment::from_u64() for DeviceSize constants
  gpu: nova-core: use DeviceSize trait for u64 size constants

 drivers/gpu/nova-core/fb.rs     |  31 ++++----
 drivers/gpu/nova-core/gsp/fw.rs |  18 ++---
 drivers/gpu/nova-core/regs.rs   |   6 +-
 rust/kernel/ptr.rs              |  35 +++++++++
 rust/kernel/sizes.rs            | 132 +++++++++++++++++++++-----------
 5 files changed, 147 insertions(+), 75 deletions(-)


base-commit: a544873ce0575b2fd8285a1364d3e09929d9a3ba
-- 
2.53.0

