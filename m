Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022100.outbound.protection.outlook.com [52.101.101.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30C13FEF
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 17:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769188928; cv=fail; b=OfHCxeR5pbf3LiSG7o/9yCVECHoTUazf43zHHO4dQPpBkQRHlXyhz0z90X0P5cexSXIRXiXagF2yvOdzf8l1YHjWHv4KWHhBLmcDOjfClKrvtxtQZkgde6DtVpJJKQ+236WN1q6IKPve2HBjkJJ/eRDQo9Bq7VhfPAMxk5rpPxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769188928; c=relaxed/simple;
	bh=1rME5NVcpK+yQEHgsFCwJgjewvrsZZQb+73bpmANeCo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=BCJYxv8AD2GQpBnCatf2bOo34/JcJOOYQrsZY5S1ZqdyN3bIrESpm9xOWtWeskQZ3iu5rSAE7wk7dPKxOaDlxLAADrnDaeruFTB43qXs5WQNcPMTuLCZZLPlONWULx5nc3XOJykF/AS87RDPMbkDcqxIvP/FMgI3vtVll1Ey5Ow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=TS+CYiKB; arc=fail smtp.client-ip=52.101.101.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="TS+CYiKB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQvNZpzaIxr80mGiYb5TrBayz7jRhCXsDeRwwTC0okBCmmrCbH4BRrrglz6BCH1pEq6KgDNRvRouiJe80QfCMaU675Cc8d5UHyRskVQEMvodrAmvC8SrzGS0ED3qje1YVtFwYDIVWckihI0UIxZjahYsMamcFqmat3iqvKg/sR+G7OIHZAH1opv1OMUHepxdiSK1zTJBoSUBNImItDg4Iad0gkjjBNm/HQZ+jHKgHaUOzyLldHgW5tFKkYDRHwJpxi3IlfaEMezs3U3Ehc4opCDIvTTdvVZsk7pjkd/H1NqeVZDJM4HKsz+sosOZ4HxJqrEn5MhKXnnihjC3tTd+WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tt4nvXXVDdABSPJGbCrfid9jhfkGFG/AvQjf4cfAuZ4=;
 b=X3JBgcKju9Xbojt5Dw0ebf+FWtdxsJ61jR/xO45Q9KjJyJOpo+GjEbQ8hE8w46YeG3Xk9FUMrWXeCF06QE9NeW5pHTWYgt/hBqAAWKHjtNwxgnlxgtYmb9lMRhNkDJ1qpE97BVB5AkMqxds0mzpxj2mvvFulTYiVY8EN62495u/lH6R9WellUVdn4d+pBIiTPELU9PeA7lRiqjwLaWC4SAFlxjeJkcZhd8Vz+jnyswpKW51YrLai34RmLFzzJs30dXFvFX0Lf+iKq4t3DBujuJz7WsnHj4i30clJrI2yktE5WKzMUTpmGeae+lgQiJOtSXSDes4nMgWR1hS0FtZ47Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tt4nvXXVDdABSPJGbCrfid9jhfkGFG/AvQjf4cfAuZ4=;
 b=TS+CYiKB3umomA5hxG4eJmAj55iWX4wCm7PMekHfdg8zRfIR9Qi6IvOHMi/XJscFm9LsKM1jj59YrbH2sb6mRYRPLsZ9YVgpFFwNOQuYlWi2AX2x46qfVtdGyLnlO/NJh2pUeadoLZ+15BYscWPXZOeU08cpB+vUS2LPicaDiUk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO9P265MB7833.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:39f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 17:22:03 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 17:22:03 +0000
From: Gary Guo <gary@garyguo.net>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org
Subject: [PATCH 0/3] Remove redundant imports of items re-exported from prelude
Date: Fri, 23 Jan 2026 17:19:39 +0000
Message-ID: <20260123172007.136873-1-gary@garyguo.net>
X-Mailer: git-send-email 2.51.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0076.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO9P265MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dedf994-cbf0-4e46-8115-08de5aa3ecf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WOfB7N4JE9ih+l1lPw/8UAheoWhK2NjFzS9Bh6sr5HZCORUD12jcoxDkF4iX?=
 =?us-ascii?Q?bbPC6IrhFEIs1X5RBXrMCRydu+GDKjGHFHE3tExdiXXAeXAlvZSEqRHhQppu?=
 =?us-ascii?Q?4KuAPJankcM5CpdKX2hvd6e/SBbRlL6fmtELiZOCABZVMLszuxb5eIKl4255?=
 =?us-ascii?Q?eofTej4sz8ndOC7ArdoQ+Z9Kz2tInKspVlA5YMceIb46tbmZR+7j7oVz9UU1?=
 =?us-ascii?Q?cgcBAglh1tv7rz8UVExvOBspdNr+C4HvGSliNent1gADhYPRO47594Wv63NQ?=
 =?us-ascii?Q?cdiqGjb05eT0sxAD+2lcWj/G8lrcdurRf09arrk5TD9i4Mn7PPfJi4ix9up2?=
 =?us-ascii?Q?J7aQvoMplMMOS5SJbx5HSWEhdShz2dFPQxtjF3uXj5FGO03o3D9+W5FOJ7g8?=
 =?us-ascii?Q?bDVY4PiLkd5mNzloTfoUXvQ0Wh0odlpLFgBqeoNABxa9EE57K+b8kg5oDMTm?=
 =?us-ascii?Q?ln2u9AiS20G8sZHiqKcQpapLRrIFda9bHA3bUGHwTqtLjeseYfYI28bsNg66?=
 =?us-ascii?Q?jrhIJjtkorXeTaPfc01FoeB0dSnlOmrqabIutLUN3OQ7eVBTjjhPmTXE3ylx?=
 =?us-ascii?Q?IXCw05lMr+V6wAyZN/tUy2lNHQIx6f0nYfKjA+/yWBzfSoXm9e79q3mgQvfC?=
 =?us-ascii?Q?xav2GzdeAvDkIV6qEylH4LqEc854TipeVaBhbWJzFnViBZtOPyC1wlIGPEFH?=
 =?us-ascii?Q?58iGlSeFNOfDINwZ0FRruef5rJQy+NY93Ufo5vfZIV0qX8dGNZIthJhDvaBw?=
 =?us-ascii?Q?nNIAn6xEiOY70Q2VIcAkbAyvO3xCWOtKUgL2+PHIUx0LZ7Au6zDXoLt3R6oZ?=
 =?us-ascii?Q?KfDmkBzN0aT+/WbPR0lzZyNM1H7+L6r6zuF0c8VDnBiESStBaqtOvzjqzJQN?=
 =?us-ascii?Q?eWZ2XXE+6OelZftxv9+00AiW2VDjBpuCzwxp6aln4JPqBS1RTw8rEyqLazRx?=
 =?us-ascii?Q?AXvhCtKq3UMBpXaWkRjVEfdWfVACVxaX7pt4ttcTE8wcYnH8H/wyK7H3oOJ8?=
 =?us-ascii?Q?VtHwLZ3ArozrZTY69HN0tAw1eT81C8I5eF5EqpYFL/OQzXNd5L3r74XeTINZ?=
 =?us-ascii?Q?WairaWtMgzU6pN65B5sqRTe184nxwu3KL/d91gcGNpN19WdCmkn0U+dRsFuf?=
 =?us-ascii?Q?gZc3id4Jxoqh2QFHZvsjs4YCQfmpd+7Ynv/eaNE+G/u3l68n/9wF6jcAuc7C?=
 =?us-ascii?Q?VIuJq0Tu5S0BVaWSt/G8bk2AF7pOvMMa/mhiJE1KhUMYnzeoCeOY3FLX8tUm?=
 =?us-ascii?Q?mfm7EMNiULw7lCODXBko2wl3ErGbjc17U2Q5fIsAskwtChSJ3qfDp+L/jotk?=
 =?us-ascii?Q?V/QBGhIV2cPrm7gsHA9CBQ5DJVvU2GoFrtrPz6hIlMtRAJG5Mo7FTCL2eE9R?=
 =?us-ascii?Q?aN8KGQYjy4cUt4E6fY/W0h/zJAwzII7nQXIvQb8vSMhHPJptfRZnnznX+bvE?=
 =?us-ascii?Q?qmmFDH8C8Xr93e71IQjjgYSOXKzeFW1P3S+AMSUgsCvXruwaKUuEGHqOTw9w?=
 =?us-ascii?Q?MnmVIWfemjEXVvHQmAkSFyKdkPOjwY5TAyQ/jo1vEz0imx9U4rdnN04qyqZV?=
 =?us-ascii?Q?HR1wLjXDKJ4XPczSeEU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qavPB1GNQ4JzurkStL9nq+jr1wz+YzGW/0Fj1pbVY7b4DkMmmlrt0+LzMPq7?=
 =?us-ascii?Q?BEsGtL+8M374U8rXSayZ+YU0lj6NO2nwtyu1RfMHvXVkILU7i6Rk3qU3iIq6?=
 =?us-ascii?Q?zNGzK3EX07Os5PMnDJrlvRpbSxMBNtAoTXPCw5l4eeCz6cXUpe4Cs00d7dkI?=
 =?us-ascii?Q?IZiMFVAEWpy7LScETvLqaxOLj2KXdZ1OYYpt+O1iSaKPzTWqu1hPAKpitS1w?=
 =?us-ascii?Q?r0XH55v8XNgAlDO+qQEfMcbbvG/vCA/fgbko0bORC7ioRPOZQTDmLQ84cDws?=
 =?us-ascii?Q?ENp9XBYtGXZkFJCtz79TmOs90KzK6p6uYPhwThWu3SeLN3ivrwthZrcjOJRP?=
 =?us-ascii?Q?vgKQs/e3//+ZOitTe/MIww1iTaGPN2twNWSBopF8OWWEa7vxs8fqgA6YGTZ/?=
 =?us-ascii?Q?vobGuVjZFBm/oGL7fXF0z5+RTVlRF4wtgMKbcJkxpIPMxUSnLz7oqbovnPzj?=
 =?us-ascii?Q?smMhcRXWTQhwKc9hc5imYf8maS9i/aU8WHRrj+qklVF4+n8A5nxVbu2dqSAL?=
 =?us-ascii?Q?dh3QGoP33P8wvrGAepF4qJlmDV9UHmA6JiEjebhTKYLPS03yVWxapglFu0b9?=
 =?us-ascii?Q?pluqNdiENZcf/DugvJblbF8TK7SvPxW5UqxTfVJIKNX1iZyFAXlqnswSk7aS?=
 =?us-ascii?Q?PfPGEInF1xo8MFbqvAeXVKms7/zBNaRZsRcYdVWSWA8XxqGpie9Gw1z89t0M?=
 =?us-ascii?Q?gWvSqVPi2msjzWJlDw+ErAMpVgw9ywQFsuzLVQj50FxXV9sfUeN8QslLAH2v?=
 =?us-ascii?Q?lm01bSHK588Gj+75CIWoXUH/YzLGlJeEgS+P/RV+KLyM2fybP9nzHTIXhY94?=
 =?us-ascii?Q?guCQtbYK4C8wblxomAQ2PCjwmUKr+PWzEzYaNwKfzlBjQgpm2vxXmC0DxdcZ?=
 =?us-ascii?Q?JWajtaBhverCGCwr4yHVoSlAac91c5QL/Y8xlhG1gwUZKTvKGXYsuubK4tYJ?=
 =?us-ascii?Q?dHDQAxNYmoFjA8mkOaif8pLja80JYMn3p/DRwZO6+ZsqIa7M1XJanDLXegx2?=
 =?us-ascii?Q?9RiJ/GwWJLz0HmeMpJeGtReD/h1QH0vnKDh/FtsuuRqaBwHeU8RmTtlFZeUp?=
 =?us-ascii?Q?Rznr5XOMqEZRxQTCwDalGjc63rkyncTz/PHsKmIB1kYuVUfPegJXUj5GsfL2?=
 =?us-ascii?Q?Uk2736QooR8syslHL1KA41sYiEsZnpzuPAOzvTyXhwKLB+PWeAlEpgOUQ/PJ?=
 =?us-ascii?Q?SmS1Mgyog7DKxSiJCEnXnfEcHaLfXeYlfbl6z3tyWxl7CALkNI+sZhtRO5gh?=
 =?us-ascii?Q?eGV0fR7RPOJzoerV8SjefrUisegI5V5wCHZQ/yVDom3JhdYQAfaEOvfEoA+L?=
 =?us-ascii?Q?rEUtWW2H2PEkC/URTYOdVgtrg3MSBsXCn+wK0KYUn++dz3on2C/4aZ6C/nr0?=
 =?us-ascii?Q?aFiSgUrUgwahemhkPc0mTUVMGs86qC1j27oK47LKceuSUxS9YPo46DTRFQqb?=
 =?us-ascii?Q?BNWQSfnHZN98zAH8zIkiv0oH4SrF5vW4KESAgFx/vXuPpMg9/Ew+4BBohnSY?=
 =?us-ascii?Q?cMqW01FdqIavCP0Pt69l9JuPttqBpYMYQkKCjk9chZe3qpbKpc7qNdfYDD8G?=
 =?us-ascii?Q?BJgZu1qw0a+G1ab+YSHhu9LlpDwKxYFqHnFSEpuKPqrFOQaXPC8naHzfkFt3?=
 =?us-ascii?Q?kW/yBA419zBIIBwifGXIZldwX7okcAIdZUOxUYEevwt8bgDVhYxmoeyi8r6Q?=
 =?us-ascii?Q?zd7rRA8DVpYJdm4vc4jfo7KAZHSJlNmVRdTpUI/zK6WvnU6veNlgxulWKoQK?=
 =?us-ascii?Q?+drbZW+RiQ=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dedf994-cbf0-4e46-8115-08de5aa3ecf5
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 17:22:03.5515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sn1QYa0dTVbFw0pR+A/5BgJd42QHbrSCnrreHoP1e2DWJIQ4PgSynJjtt8GDGJnCM5Uww53m3KQHHAY2hnN+dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7833

We had a few occurrence of these redundant imports and up until now they're
mostly checked by human reviews.

I have now implemented a new lint in klint, which is able to spot these and
advice on using prelude imports instead. It caught a few existing cases
that slip through the review. Thus, fix them.

Link: https://github.com/Rust-for-Linux/klint/blob/trunk/doc/not_using_prelude.md

Gary Guo (3):
  gpu: nova-core: remove imports available via prelude
  block: rnull: remove imports available via prelude
  samples: rust: remove imports available via prelude

 drivers/block/rnull/configfs.rs         |  1 -
 drivers/block/rnull/rnull.rs            |  3 ---
 drivers/gpu/nova-core/firmware/fwsec.rs |  1 -
 drivers/gpu/nova-core/firmware/gsp.rs   | 12 +++++-------
 drivers/gpu/nova-core/firmware/riscv.rs |  2 --
 drivers/gpu/nova-core/gsp/sequencer.rs  |  8 +-------
 drivers/gpu/nova-core/sbuffer.rs        |  5 +----
 samples/rust/rust_driver_auxiliary.rs   |  1 -
 samples/rust/rust_misc_device.rs        |  2 --
 samples/rust/rust_print_main.rs         |  2 +-
 10 files changed, 8 insertions(+), 29 deletions(-)


base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
-- 
2.51.2

