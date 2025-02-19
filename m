Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020099.outbound.protection.outlook.com [52.101.195.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D7DEEAA
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Feb 2025 20:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739996241; cv=fail; b=V4EU8pWFAgIolpHS6zw389Jd/VB2EnFTNeIGHVjjd56t/0FienmOBIAai7e4biOTbHLD3D4iwgunDITVQ9gHqaZz2qgBqprBQgNzpJhpeS5wDdLrBYN1xV9q7CPMHCRVdrWdRNOe6/9wyCINQ3yaO12SU1MQ8M3GV5UmA0qW1QA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739996241; c=relaxed/simple;
	bh=kmBIKQnsks/rEgGjXQoSNvxfKv01lJANSPgtsLLhUmE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Gn6B9yCljWJRoNgvhikq9RiZSUGeRyPPbZw+peVeF4Z4Hk9b5Gl8Bxc1hrhf9zclCU5h8llNR2ITMDyduFTMLNrBam3CiTii50eRRQQ8BOPa0UPuqpb0SP27ITvoGtA6kf0sXuL/DvS4jVqodth/gZhdJlBJzKWsB3XFX84gKnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=HLcI2Itq; arc=fail smtp.client-ip=52.101.195.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="HLcI2Itq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Em5Whdve1dSfBzs333zFxVqUTtYaAYlmSAj9Wp1N+lZNDxciXccvTNnm/YopEneHJeoZWG+MZUKyhDhso1P/qhkZRjKPghGcjAesvg86YklsnAR/ELNVZSsLx9i7tFwt559vajV64xyTE+8DS8ilmASEmWc/EeJUHhxTwbpLi7uuOpUYeI7ZaXAJra4+kQkqdUlne5xc6Vo00P16uVfrEGP7SIqsVTOgUhHd1ZdRyXR+NeuGHLg3OAr6WwDrW5i5ncloSL+PlBIb1egeGaJmHMrUiBoi19yBRCBkBnQsEFJUKRq4Den5s9Im4iSydH+y6rpq6zneAzVcNjbWZhoCbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J/Z3+nLFOoG7CPMyZMl0zLzmUq7PVJXq1NTEjLGFxW4=;
 b=xvnGYSssoBy3YE4khjRUjWRmKYh0hXD6fwrOw5wP9NhDt8FHiZqyBLW++iTUAenxjnZYOnTn1/v0a+jBt8coK39X/cvw1GtB4nG7An3OC+x7JpODSEAiod4hi7FLL6LxeYchkUFj04ob2/BdqO/H1La5vYTpE7OS8GUOr3+gI7q+2yDCUMrvrkdH/qZxeL2pJv78PVrHoh2kSgBMxEdKo11S9uMIK1RNyR8uEVRXCR3TjqTjXcZnkepkNOrgYl6plVOVYgIVa7jKNEBQI4k9gsMfsKKrmYbvdRVCTw3NisQfLdGKqEAV0VajK1VcwqnEj/4j0ZxiTY9gEU73Ds4ZiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/Z3+nLFOoG7CPMyZMl0zLzmUq7PVJXq1NTEjLGFxW4=;
 b=HLcI2ItqY3YsUQrE/Agh680m9Ovr4J02klbdD20ADt1UGP2Y5nDNNwImuTemIqMKtuzgwYepuKOn9phPLSVgZiNGEF5tZYNhjpFoRu2MdpFNniAJm2lG/BvLY/6GuamELd3PSkc+pa/7tDsw683kZIYoLOR7A75KxqF2Lcxxk58=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO2P265MB2783.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:13d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Wed, 19 Feb
 2025 20:17:15 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%4]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 20:17:15 +0000
From: Gary Guo <gary@garyguo.net>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v3 0/4] implement `kernel::sync::Refcount` and convert users
Date: Wed, 19 Feb 2025 20:15:29 +0000
Message-ID: <20250219201602.1898383-1-gary@garyguo.net>
X-Mailer: git-send-email 2.47.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0225.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::10) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO2P265MB2783:EE_
X-MS-Office365-Filtering-Correlation-Id: c4f9ccca-6a64-4000-f67a-08dd512266ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xohs5/AHdM+cD855vcYZ2WWv1xjZk8pFxo/Rdlpjsog80HtEueXa2ayavYOH?=
 =?us-ascii?Q?v97+eL13E+JF9hrK9jlyt1RBxZ74uveUpLdfpapCGxjKZoQ4Zk4pHHfCrdQ0?=
 =?us-ascii?Q?0aUSgXB9ttR/7Kj2tm5rLyEgbjEQ4dAhWh1rBLkTAbvHK9c4aQSJrZjquIZ1?=
 =?us-ascii?Q?YtjcwozbHt2FQkq6XlN0DkBcmF0MhqZyINhzHLjrI9WynYqle7JJvk1Ja7YF?=
 =?us-ascii?Q?fBn3UsxuT7Q1JapEL8080iGxTVdSEe2119cwfY/iaTqWRY3Kc0Zf2r/4EAXX?=
 =?us-ascii?Q?YhaWeJuxqaxB+xK80Vq6SdxFGZdIn3KGXi9ssSknzXmGRd717H88kMOUbgpw?=
 =?us-ascii?Q?Vm/hRfaFv4LuFBNzSybv5//HRqO1bSrtOhuPxGyR8InFlhMMV98DakWbSkAz?=
 =?us-ascii?Q?ok/P3rVS5j5vNrwzfQt9FEfTx00j8LRH21RZgyDG3pqLlH5ts/Emb8fuLzeO?=
 =?us-ascii?Q?T2f6cEEl3AmaWaKq2Tsfhfna5nZzch6PFcmKcEEiffzxlnmzKaEYDEVPHmIh?=
 =?us-ascii?Q?VtH/yRDRZ8mP+NADJZnQa03vRHV6EsXNTmAVmacTJyH488CcylcJSZcmPjEC?=
 =?us-ascii?Q?lPJKNOE0GOKd2GirJDaSUoaubkFQTqCs5+dBAthNRsdeSzTehyscLMQxOonx?=
 =?us-ascii?Q?tfL/IRVLtjNOde/81Ax2+mgAjOcdotTq0/bLTP09x4RGAuZCjdjFbe4DEIk0?=
 =?us-ascii?Q?0oumnPaWeQU1nVdvB1IBh+TiqnhFU+9ER95owkQSx8FzVQsjp4HF3kqWVJQO?=
 =?us-ascii?Q?LfrDkPBa+jdYdPdLd+SHuZH/0AGamof5odEm6GGx+TRHFnfO4kStXFyA0zX5?=
 =?us-ascii?Q?Fg1VAAal6A6+VxFBtsai6CZ2vAIhRaBtXVx3GCPSvs2PS3LI6SRR+MP1j0lE?=
 =?us-ascii?Q?4orkFtEi5ygyGCEBQZPGApmQNo12bFwYM0QzRo8BcnA/13tm4nyMlD62qiRr?=
 =?us-ascii?Q?gDsjTYjlopkqnj/rnx3+qheowO5UqOWIzXAp4CmonEogYAYZvvRnffslZMyL?=
 =?us-ascii?Q?+2xeARMbI4lLXGDlvhCnmsHeE8u887d9IWoFZCbC6BorLcbMymX4RQgUXk+x?=
 =?us-ascii?Q?qn0L5vnaVDwSpL02eiNxAeZgrLDU+4LVEVnqh3yJ282uXQjeeg1NC8xq52Eq?=
 =?us-ascii?Q?sGcyQ/uRhasfJL291muvgWpKFp9zB37jaksA7SxJPIxBXzFy2+GNqTWgAdCj?=
 =?us-ascii?Q?97fg082bN7qeFOxKT5YyME4YfgRRijE/7gAWtjeZTLG1EaZs/8+G3dLpERdS?=
 =?us-ascii?Q?kf6B4IlaRmI4jGJbUa+SDrmhmfWT89YsMD311C2XWPI4wg7xs/ZUXS3NAmR5?=
 =?us-ascii?Q?qi5KWZwVCplAxy/HulJ1r2KXrJ5kyzZn4cvBJ30y8krqWsttCMlJ8bNjPreF?=
 =?us-ascii?Q?RQohjH2i9foHzcrVZ1lmAXQmUA1YjuSpVIh8UZRNAPBkw+dp/p0K31FBMXtl?=
 =?us-ascii?Q?laSIGk+S8M0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1hhCST/NJFFDZN6PcCol7fy/23S+gma74TPhiIlwVAl9EOnLuxDC88rsBBbI?=
 =?us-ascii?Q?GjnccVEZ7yp6Z/HmSQyMgmJNBapdFamH/zb4CSgZys4cNUkEQdBo54ZCQ9Hj?=
 =?us-ascii?Q?H+QcyVpxjLmXQI6xu8G0hlOiAwUt0a5wQgXIHCxCuhKQWn+myp2OmiApOmiJ?=
 =?us-ascii?Q?/kOqc2DAgTh6bwacEFRXOKecNcS43StzAwvMvIatha1PptAPt7Y4pPhWoMtq?=
 =?us-ascii?Q?eI3ytveKcgLYqzsyUBztJuS6sJNTs+G5d5TumODqz4WGXzOlwE5SxuHn8UrD?=
 =?us-ascii?Q?R4GcwM3kS/HmsRtJ9l+ZzjhVYX2mfnxhYbettLnV2K3oyl7F+PYS45E6PQsH?=
 =?us-ascii?Q?2updDPYsnHVhHCSLGnQR5d9OzhOnpvTa82OFPi69voKolH/HMPfIBkDHBZ+b?=
 =?us-ascii?Q?SFaFpesHCvk7klG03WEqwp8IbVm4LnQ9+VcX0ynC6s3lHIOa2Ee2I47rU9SK?=
 =?us-ascii?Q?YFkG+8Ll6uh+Z5rn4kZWmYsiWPLx3iDdNNBbWs/d4IvPYxZjT7glmnrp1bB/?=
 =?us-ascii?Q?5kH+u4CLpeElWYyodDMKvTeMWyanRpXHxQTF8lP6D/PI5Sa4K94sApAAcseJ?=
 =?us-ascii?Q?nRaml2yeityl2ReoxTxj87xrjw4DgPb/l2Z45j1/Vm6qYm8wqFvgr7SIeEtK?=
 =?us-ascii?Q?e9Zp6R8rO4OWa5QMqXxtTe9Hp758o0YYY6SMmffbMA/XvFLLTwc/atkT3WAn?=
 =?us-ascii?Q?ayMXq2HyCj7DU34iSzQs7Ky9AWfUapYTVclJA8c9+ChUB/BK0m70eQc3ZfIH?=
 =?us-ascii?Q?GeCnzSDwqnFEPAwX0xVavAJvmFJjStc3ieHfvcDiwO+baeLg0zQmgEOwuohB?=
 =?us-ascii?Q?N22na7FJOImb1hgMDaBmz4Vcg1uZIF5Jtz6A8pa/YZwjMPHOrCn52SH0eusi?=
 =?us-ascii?Q?Ku1RUXSixUZw1AWpRtFI2QlVOltpwFrXMQEV9nJY1GtyrsR70pxNFb56SWX1?=
 =?us-ascii?Q?fyiZzLGif76YDDOjk3IUVQnpni21d42TODHYmIZGavKFbBCUwO7OKC73hprE?=
 =?us-ascii?Q?p6n/Xg4HdW54kTGddh2RSfXkos2aCeH5fOVEnW55hL9D+PFHP7LmBGrW2pc9?=
 =?us-ascii?Q?9O1Na2TqBGR3P6jaIc99F74aNIbDecHibaJWDyYONEuKa1nuR9TsB64aOAMi?=
 =?us-ascii?Q?Al+ni/4qLew0Ep2hUjmJp9JaZcrEdp4LEJeMegi3wl/kzk1sh6pC+zMHB1s1?=
 =?us-ascii?Q?DpyJrbq0Wl8zYw13yquJNOOSGEJTKQ4CyLCXukHB0bppMj+/z+NkZrPihaPw?=
 =?us-ascii?Q?b4HA5DAF11Qu6c1Wz/mTrjlhbpGOzvZEtqtXCYVAbNrUcdp6HiwO6ZSYpZAj?=
 =?us-ascii?Q?k+mueDcBTpFT31UACix72wcx4cxJX5VB69pEspORsMiK8KzlBBz3/yhR19HS?=
 =?us-ascii?Q?GgpjDo0gOgEm01F0KJnMNREzJl6mgySm0JqmQwNDufuxoxcd3BE0Hdhxq6Hb?=
 =?us-ascii?Q?aDVHFB55t/fI0dqP14DoF5DdHB7YQ6QKWb+Fy7v/WIeV9xDZY13YSf4Xsdnz?=
 =?us-ascii?Q?Mwpk6+8w/D9xCe7yjM5ksWsQiCLnzaOg394TdUh7/Y8tnGw18+P2zelCHhnx?=
 =?us-ascii?Q?b/1WFEwIV+kwCwq9CFlvEb79pmrzsJpRPLJyJoUQterRP/mwkXbPpXSCsUpQ?=
 =?us-ascii?Q?hA=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f9ccca-6a64-4000-f67a-08dd512266ac
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 20:17:15.1396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +U1N9O/B7JknotlMEi57PcUMrltQ7qQImzKUGiRB+ZxAyt56BSJRZMlghp+nkP9UU6HhGE5TUI9Y5bvaMw3cng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2783

Currently there're two refcount usage in rust/, `Arc` and `block::mq`.
`Arc` uses `refcount_t` with FFI calls directly, and `block::mq` use
Rust atomics and custom refcounting.

This series consolidate them to have a single `Refcount` which wraps
`refcount_t` and have it used by both.

With the removal of Rust `AtomicU64` this would also make the code work
for 32-bit systems. See [1] as a previous attempt to fix this issue.

Cc: Will Deacon <will@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Link: https://lore.kernel.org/rust-for-linux/20240905061214.3954271-1-davidgow@google.com/ [1]

Changes in v3:
- Drop `dec_not_one` and revert to `dec_and_test`/`set` as the former
  lacks acquire semantics.
- Move a `use` statement from patch 1 to correct place (patch 3).
- Update maintainer entry to include refcount.rs and add myself as a
  reviewer, as suggested by Boqun.
- Link to v2: https://lore.kernel.org/rust-for-linux/20241221183024.3929500-1-gary@garyguo.net

Changes in v2:
- `Refcount::read` method is dropped
- `Refcount::dec_not_one` method is added and `Arc::into_unique_or_drop`
  is converted to use it.
- Link to v1: https://lore.kernel.org/rust-for-linux/20241004155247.2210469-1-gary@garyguo.net

Gary Guo (4):
  rust: implement `kernel::sync::Refcount`
  rust: convert `Arc` to use `Refcount`
  rust: block: convert `block::mq` to use `Refcount`
  MAINTAINERS: update atomic infrastructure entry to include Rust

 MAINTAINERS                        |   2 +
 rust/helpers/refcount.c            |  10 +++
 rust/kernel/block/mq/operations.rs |   7 +-
 rust/kernel/block/mq/request.rs    |  70 +++++++-------------
 rust/kernel/sync.rs                |   2 +
 rust/kernel/sync/arc.rs            |  65 ++++++++-----------
 rust/kernel/sync/refcount.rs       | 100 +++++++++++++++++++++++++++++
 7 files changed, 166 insertions(+), 90 deletions(-)
 create mode 100644 rust/kernel/sync/refcount.rs


base-commit: beeb78d46249cab8b2b8359a2ce8fa5376b5ad2d
-- 
2.47.2

