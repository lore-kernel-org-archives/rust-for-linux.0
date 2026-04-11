Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011066.outbound.protection.outlook.com [40.107.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A8C175A8C;
	Sat, 11 Apr 2026 02:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875287; cv=fail; b=H8xiVU5I+l5R8P81eKwndm73387qjRczOuqjVG3tJ5im5NmeNp9qb7X/tTped3Jnsgdmpe9qmawNK8DE92chHYoSX7ohEq5RkzxUEZmotv6cCn3mKT+t1RvvwfY9Hjt6BzW9jX3nrljRl3wZK+l/VW9PpY5RCmfzm4OeRfqQMgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875287; c=relaxed/simple;
	bh=Hm92NAT1uFtLknsnLjQHTIgoC+1QPud3uskho+k1Ars=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=bSMpTQq6TPuYPUK05ziCzEbuY7pUrsM5u5zwoAWQ8rOyr94vpgQRZvcuwwnOp1iw1uGR3f72O4k5us8PZTrWktRb6fmcQhqnOCBfGEUuMxUKIC4LQ8bwHFUINPRU/fkMVdoqXSlIBcia+AkstuoXdHLKBu637LbEd+NvGEUKygo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ch5Ot0Qg; arc=fail smtp.client-ip=40.107.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ch5Ot0Qg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p2YotgKP6BwgB1js1f/vd2Kftg51mitHk7cM+amiUIeomyuw531XbHKcYRosciVA+Nl05Qf7Lbj2NbCi5AmVKvdU9hVlJxYLyidQ5ncw7yXfmfxsslLPo6FqNGVP5IvVHQ9gyaaErJKoJ0+1WkoWU+Mv7pDZ3uu6Ne+6An4e6kicFijjfrCz4NSIQF5g5VPCRB/4nMbeX59Ouzz3Slg2Lq/5MhfcVbIMWRPBU0qs3+kM9QigaLgE2VcJToqTDrCS1IYqQe3danyIeMl15/CgunGDOVowlIPLQHn7fa0mqHexqSU8kiadFAjof1jCqCbdMAcnsZeyB0EAMJG+Qipxow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QIlsmsRG9e4i21k/BxsKyYPU20ywXm54PPpcvDq7KVU=;
 b=w6gVN0BxMuvTZA95KZKszJVCkljXmp95AQH5LlYN1oMV3qGZjgRnVKoXiOeErMIXBW5z2XBhWS9b0YVPObU+sc02PzEABNJA8NsbzbFnba8S02EqiMM/41LfnfjRC8j5LqqhKLyp00iU54DkTUIB2UEF+uqBEWBLvdUJdIkT3vfz0Tzj+BJVll4V80X0qcMddVlX6iOhJUoyPBY8+6Scy+pbL8RsuIuhkcBVKjlC45021KUQ68CHpgFAbnPS9t+HDnh3zoNbd2sCCUaN4grlSn4MlsMv+QbR9UCYYuarR8f3ic+cGaH7Mal86mi/VrekAnmGsYZ0RNNxN45ZQsGQaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIlsmsRG9e4i21k/BxsKyYPU20ywXm54PPpcvDq7KVU=;
 b=ch5Ot0QggLLCJnMqoENxKxP9XiFByTYk1WZW4F46iGsb+ZmxaPkRbQgYzvyJFPADU/GUfodgSVs3vx4haX0N6ybGRxjYuJRZmY+BhCxrR/Zm9aDrqtjUBjWyL9nLHF4bHksGOIFYGdxQdR0d5rDaz1GxAiGY674rxmhxfQbJuI6yYWsQTsaObiTr1wRjXlFdknlVC9FPPmdaLzkEC+lx03ybIMb4nBhYRyX9Vorj7S8v6WEB7kNvX4UMoZ4VF1Ap+7EiJ7Rb6OaFyBQ+lb0KETbAMs1pWHcfoEzjAFEC65r7HtVvrtK7vW+wc4B0M6bPIT/bJ06CVxdYOm30EZgjdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH0PR12MB8775.namprd12.prod.outlook.com (2603:10b6:510:28e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.46; Sat, 11 Apr
 2026 02:41:21 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 02:41:21 +0000
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
Subject: [PATCH v6 0/2] rust, nova-core: add SizeConstants trait for SZ_* constants
Date: Fri, 10 Apr 2026 19:41:16 -0700
Message-ID: <20260411024118.471294-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0258.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH0PR12MB8775:EE_
X-MS-Office365-Filtering-Correlation-Id: 44faee00-41f6-4fbc-490e-08de9773d086
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Zz7rXZNaJqCQPiPRLrtKdnXptVbd3l5gPW7Xif0Wq98vKTi5egKyDacRMb968gQcs2pzTCTfc3R4C64oah1rxixRu53awZguTm4Zrpr3+ZC9Hd7hGNW8Z+kdkqHFjtUUIyyuU8GcSLoa6XclyJQUq5vx4tB465C2o8G9HlhPQtwG8XJ7iDEynjcUJnBUwg4h6qdPuYYDJXKp6B22esncT87VS5jMHn8a0rCZ/0g2MUUWVTxteAxepkQFQmubFvc7dRcWBQ7eDIf7WQMyyZbueFt6ylLFMmLtHoG5PgxK/3kIchgZzgofF3acjdISMjAvfdZ13sTNszvEgFoXF5YwP3nuKU/YofsFqIlzX5TktwgxXVj28/1P8aNPTvOxHuJJI8lIuMkzaQsr/yHbXBhp75euXRYYInWYvg6TxD4nw9IM7LLFmYP+zzxb7Unvr4zv7NIuiq8KhYBr+2p4mxrbwStmIzazaVMise72X1UH2yFNUIaYZ3rzfCJdcN7LD3Qfp80T7o/tXybyYi2sySABBOs3DUwqdTfRVINejl2OpgMG6n4mCHkzzu/G1kAu42d6hn2zrHZPbGUY2493InF4z4RpWgamXQfUE3rU6aYiQ2/fwRCn9OnyvWpRjq9G1WiS3Hhgt5qQurLjoP08faNJTBGuRM+JK1FsM143Asyx9WTjI94RYSrPd+2vjlKqPKGTgfSk+8vC5hzfi/pjC97P8L7YOuItmEWOMgXNT0fP/Kk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hKwSQwSmYhEgh2wC6ZWdtPO6ThWLtybsGlXSX9YFT6RFdT9uLvpRgso4X2aF?=
 =?us-ascii?Q?h/QI8zz6cN6u3vSrQXwci7maWuvUjT0zWyphiDiQrQ6igUoIcxHmbJ6R4Mrk?=
 =?us-ascii?Q?sKve/h+MIflkg/EIKbY3cEoR3UGfQftdpEYIeAXeZoD1eOK3EW1Pqcfd81EV?=
 =?us-ascii?Q?EfPjx7kDjNFVxPSKHxdpGBT+I+OP/5l2LnDubHeCI9boNiRC0Or6JQBmHeeT?=
 =?us-ascii?Q?frve9Yoe/csFZJ2TpiUrX94rOU1NVN7xHNV+iKphiaSI80Qv0oKyvivGdpVD?=
 =?us-ascii?Q?T6XcWaRFerimcFX8/GsSwQMtMVaeMEL1RKPpn5tdfvmYw7xWZ+qUh7MW5pjz?=
 =?us-ascii?Q?U/rDMsfNCCC4Ys5Kr38Ln3i+8MOnVRBAy/WfJReT1kXaNcjxsEevOlpScNCs?=
 =?us-ascii?Q?zBhD5eRDf6iiRGLhBvE1x5/pXhMikHPHo25UvECOP/NldWCTmHUjby6YbU61?=
 =?us-ascii?Q?iow4imGH2QpkwrPV3huDEd9NN74taAmKuLfMeCa8r8Y9MPmM/4kC+McJyJ33?=
 =?us-ascii?Q?DzjIMx2cZZL7VjxGtRcvAgyNsC1b8AAeX0TqCbO0u2YPwATTWtzFeLnmNoLU?=
 =?us-ascii?Q?8cjTRPtk7tuPWABQJ0LzfHi4S8p8ex7OHVgzEjSY6noW2eSM1zz88/y4Pplr?=
 =?us-ascii?Q?G/pL2L/Z7/FjQZ+RZvjFs5ZWoXhD34dgm5VnXqHVG6Qtb20vRoPmqEVvIKyE?=
 =?us-ascii?Q?2N0G6uxWUSvKuLGBlmbdVl9UvRH8XZgxQomRDfFjXg03T0SaEQx5nff1VEvV?=
 =?us-ascii?Q?6UWgLlxaJGiV7MH2JTJadf0wlDs2VnDGj5GNbC7QqXN/CcBlzO6xnUR6BOWc?=
 =?us-ascii?Q?Gkyi5t4hyoaG58At9kXpomRgdC4MBdUMc0LAR0Pr17T0nDrb75EvUHWyMSa5?=
 =?us-ascii?Q?Capye5Mc0rtnDJKCEyJCpCQmL6e52uGdJHl2Vka4K6upErzIchzbopxVkBEE?=
 =?us-ascii?Q?qdXk7wJ4xA6I7L87MoNW8cxtSgcOl0vWnAoxDpwfMLGsy8I4sdnYrQJvNLT5?=
 =?us-ascii?Q?MN/MPFxqn9Ip37vlPGWA6uVovadMSPgeLXfOF4VolGqpJajF69xGfYssc8lZ?=
 =?us-ascii?Q?7RccNA1YZPE0pNIetKokw39guMwHaUzSaltaV7csmT8l6nWHcRBpNWsT6n4s?=
 =?us-ascii?Q?5CMSmjhQooyaJFmaVFwmGWFlRGoOLukZqi50pAbe555atEnXDc+7EtHm98Gn?=
 =?us-ascii?Q?sud52zKVLNXZPLwWyNU6dYCg7Lgo6BatGUrgzImEVrLmSP/xm9ZB7Pv1TWF2?=
 =?us-ascii?Q?fZohBuWB/Id4YBzFjMDtHE8+9D6S5Ghcze07kAssqQD9gmMqwStDtT8vIgNs?=
 =?us-ascii?Q?t7OZb2J9q0Z4+k9rmZFie/LwzNr+sBgL3dF7yOWShjBU3+55Ig4+Kyfn9Ve1?=
 =?us-ascii?Q?fd9xQYgBSKxjWJ+CrAj3RmIbxt9WQc9JtoQeOYAkIa66ujwjOTjyPrjHPNOU?=
 =?us-ascii?Q?bsvjxzJOSZLIm9ATbk5Zn3hGhpFq7RqGdYiz1wNGGoF1dp8Pn2nc1hRLlvxP?=
 =?us-ascii?Q?ke2JyqrM6M4CzRmNoO5iZJqgqWz/n6FBbBiy7a4wTGyhw3LsGkwxNPEelJby?=
 =?us-ascii?Q?QIfgkpTOuhx9XUpOz81wF+Nw2j6miXRbiWolHzpPhLS0Aq5F2dqyDqeP/3d9?=
 =?us-ascii?Q?tyFelRjxZs7EstYOHbjeu8IJhdnESujZPgnvk76yo58EMgtycSMDFiAva78v?=
 =?us-ascii?Q?4KdaJS9NyADFi5+1UzsnxsnTUucXOhiHIBMohaX5JRIt+RGcQVvBvFwfU6Pj?=
 =?us-ascii?Q?i7/avrkYwQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44faee00-41f6-4fbc-490e-08de9773d086
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 02:41:21.0999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EopSuahd1YE6YykxTwyIdLfVBdax6b9tYT3xvwnePRnIJyquZBwYzikSGvFa5SPt+Qiz9E3UKSAVfOFpIollqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8775

Changes in v6:

* Rebased onto Alex Courbot's drm-rust-next-staging branch[1], which now
  includes the prerequisites, so this is only 2 patches instead of 3.

  Sending this because it makes the upcoming Blackwell v10 posting
  cleaner.

Changes in v5:
  * Changed the subject line of this cover letter to not use the old
    DeviceSize name.

  * Collected Reviewed-by tags from Alexandre Courbot and Joel
    Fernandes, and Acked-by from Gary Guo.

  * Added a new patch 3/3 with a todo.rst entry for device address
    type wrappers and a marker trait, as discussed with Danilo.

  * Rebased onto latest drm-rust-next.

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

[1] https://github.com/Gnurou/linux/commits/drm-rust-next-staging/

v1 is here:
    https://lore.kernel.org/20260310023145.120037-1-jhubbard@nvidia.com

John Hubbard (2):
  gpu: nova-core: use SizeConstants trait for u64 size constants
  gpu: nova-core: add task for device address type wrappers

 Documentation/gpu/nova/core/todo.rst | 14 ++++++++++++++
 drivers/gpu/nova-core/fb.rs          | 21 +++++++++------------
 drivers/gpu/nova-core/gsp/fw.rs      | 15 +++++++--------
 drivers/gpu/nova-core/regs.rs        |  7 +++----
 4 files changed, 33 insertions(+), 24 deletions(-)


base-commit: 8884dbc1fd174315b406027375bb7a4b211a8fae
-- 
2.53.0

