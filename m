Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011051.outbound.protection.outlook.com [52.101.57.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBBC36493A;
	Sun,  6 Sep 2026 21:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788731914; cv=fail; b=J8t0TwaztkxyIwMpttwEyGNzesBqkusGj6Bjh3Jy4l6s+pX+bBuQBzxqXt3b06NIbW4ypCsfrcVXjLs1lNMM81WrmWoc36ICF1zclxUbIV/uaVzAuaaRreMHbuht481K6Z9U6xWOBXe2e0EU26t80ssRN591EWLByUEdIpb/VfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788731914; c=relaxed/simple;
	bh=rSkDXCHfVcIMt3NJ5mmtKaRguOaFWXCXGCgb92IOZkA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=O3jeSzT3cej6Deq8R899d4jdAhxJntUFp2ZoNbjIYqHOehxLqX0QW7AKTny5AtEyQvt/4jeAc30MNBOSZH7azwZMmlLg3fn28HkSY6wF1QC7xEGMZfbiE3r1e+vChAg6LuyjGosC73joxgTWhReNQwBiKMdUBmsFrjUwZxDOlx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Lg6rZ7qY; arc=fail smtp.client-ip=52.101.57.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Lg6rZ7qY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XmMmXuODG80RVp5y/ZpyMMp9XYuQtG0MypmKCWK/AJt/cxNl4LmoBPuniUIHZgswwLRsPIBjj2uopQnf/d6kOkHTJUIE7Hy+zS+e7YT2uQM2uuZpVDpEXNex724ajN51OTzfJAxf35MAZrIwYM21JlxCU6xfFpHhdkFDrvqoFSgPblWdQrHY2LrBZ/YBnld7obtvJNyfFqSSYHSkKz5zKqkbM+/rv9fG7jMOuogveUXGqJJKR0KeVtjNSOkQDRENqdtc9dGd4efkFkaQJwiPW3LUDulb/Icu9pypLhGMJ6L3C3xnY1E+/GRsHQNxQM9RBv1uiZK/QW+KjxE2heQEMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nCVSVhakTwqGOnv3lHf/Akbc6/c2v4z4Aae4QNgEUs=;
 b=peKLXn5a/juOgn9C+stpRcSIbqhadN8hkTetkpHpzwifh5WOsY/oDLKvcqxxFgxXXtgGy0LF7d5wkrDHt/gGS2FXnFri4GHxTDDnPVx0KoJhPJDwc2VhZJwPG4FnfoQA50Qx4b4r8SnciCWmG1zbWSsAuuMKMXk8UphfAVb+lHoe8hNHQVilVV3tMwzFO+gPUa9iF/vRwea8sSQNSyC9ltPTDtIiRlQtb1N+vZijIiQdum+7kT6Sl48dOkWP+OO9oxLGaYSCoy9NrGvij/VoPFGNIfJJkhlxKsdmX8dR/2nFmL+oIbv5u15077P0wS5TUBVn3La2OffKh/C4lWAr/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nCVSVhakTwqGOnv3lHf/Akbc6/c2v4z4Aae4QNgEUs=;
 b=Lg6rZ7qYonE6vZddrl1obb23nTNP7uciitiZBECMFEyca9mwyh1WOpWKXVWHZtyx3qXF5ajS578jz7clj3b6/tBp2cY4AsFZO/oGhjfqpStG4kfc4ebxPlwT1E3ydI+zbNzZSVDL70RIcQp12APoDXbgi9vQ8JzPqOGJZrH1Ha34i6e38hwsZgt7D0Rzx7gtjxWqufRR60Wv5PuslT1j/11nNP95eD9o2F7XWUjzGwLBP6e1lCTS6C7L+h7RoYPlgWwWgs9dexlFvrfceo6zA+hRu15Ja8rNxQpF3tdpRwJnByPWybs5ucRHv1I+sDx3olln0xAdzd8sRwP0V0h+cA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB5788.namprd12.prod.outlook.com (2603:10b6:208:377::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.15; Sun, 6 Sep 2026 21:58:29 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0382.012; Sun, 6 Sep 2026
 21:58:29 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH] rust: allow `clippy::as_underscore` in the generated bindings
Date: Sun,  6 Sep 2026 14:58:22 -0700
Message-ID: <20260906215822.1201022-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::17) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB5788:EE_
X-MS-Office365-Filtering-Correlation-Id: be25a43a-0bd6-4a76-92dc-08df0c61fc26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|1800799024|23010399003|366016|3023799007|11063799006|56012099006|6133799003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	1OKl/SVUkOOH6GREwKZrfs+rIVzPi0Ozp/C9UPEbAL5DoKr1AqxROvYLsWRRP/ab8sUs1LKcUVI4ihFRdwtHbtOdsk0q0M6u4aOqRcvxPFSp+VYjMRAgTK8xQefEm/BA9UNTeknXKpr4XDAzGgfKGafAlwTkWAkGD5RUkpr6OJXbbUGNdeGmiLuHX0KrgDTUnTqCKIlwfxiAhoPmiBAdGFw4NmNzzOKu0/puT3r/7Mr02uNf42IVO/fkh+MpPB+7MZy0T9nvdACRr4OgZ+6vvYiKcj610WQ/ZFpJTsZRpA28ZIH/w4VW5CNmlWv9J1mBqca0lcG4dkylx6ZFbjHLO7jtgLTfbdAkE865LQLEWkLXohbkN1sJaDOEimjESWOMCQs93gJ2QbcQnBvIEKat8MM77d7HSPGWRMoLadAUe4V3QnYJw76Nc7QSP/uuTNvxoKLhHAYBQo27pk9aPSCChBtKX4WiGlM4/VeBTHD4gM/IK0Gc1oF6EwcCbzfcX7O8xEPpWZWdhN+G33mXnG3aXjwlwzBTTN0839gMF3ePj4Thod7DEhADB0VO3e4L9QYIgqO8N6Q4rASq1P3fkOxw1VGRoxCUuUq+UwcLjQI+FUDVZgqGh8S9lXwQn0nwFZnCvxGhvN2V5SUn55ppesTNm5hdLlm/KbrJaiAtYOeCKmM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(23010399003)(366016)(3023799007)(11063799006)(56012099006)(6133799003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BQ1//fRy7ITyzdXaq+6AzuHhSa+9xFKH4t2N2CfEqgT8CKDJcBsXATMKLiCc?=
 =?us-ascii?Q?essvpiNg0WGFQgKMQ8qHHAjjrDG7AePjOqnvFOytdAmSpNFKWX/FNyMGxfWm?=
 =?us-ascii?Q?3jdHeKW2CWUX++i6SExU2eB+GEIhkgcUkW0YhTIqTMHlTIsRlvNcjiztjKuv?=
 =?us-ascii?Q?5VhTCYBNStAQhgwNgGBZBdX1eajQkxo/gAWml2pqSxmJ3Pwyg793ZAGk/aXz?=
 =?us-ascii?Q?mtEkDkdLDSbnMEJqDx/ctScpH7/Vrtxkvd8p0gYHoX99L9oJl6Fx2bY7gyoz?=
 =?us-ascii?Q?Q4Qx95yPpcMQAdFaXQNyYzxBP4FW4toe7cRJTndla3Qtx6uE+qqC3PgN8dwX?=
 =?us-ascii?Q?lQ8F0/AH+CY4D6Gj+x1MXF1Jx0Hn8TNym4iYNX+nCJjN2/1EKSo0CS2RtacV?=
 =?us-ascii?Q?DE43a7yX/A1xYVwO9srUzXRyhjZqAI61mU+YrRdHE/Lb6lypCiX7W98pmgRf?=
 =?us-ascii?Q?LItczJ2ReE3BwDsQkwuplsqrOp8K5AE0jY5Fh8Rd6svxgSabJqb+DnGUeENV?=
 =?us-ascii?Q?wbvSdJjcq5AHHMmw7SOLdWB9LN777Dig9kvOYoyXnlfGc3qHvNQYuB27D0x+?=
 =?us-ascii?Q?nRO4crT/id/+CnDrwOpu9B59KEglHRkZq2nU/CwH85yqs/Bua0HNA9blfYjZ?=
 =?us-ascii?Q?p08i0yJREp6Aeominj0qsM+ULb52UOQC0W/nEdxUdu3uanJd2z2KFUbfb054?=
 =?us-ascii?Q?OCh+x/PAXMZgzZsA6ldz3i6uJ/u34h1j7hCow092yuHePudyB2hexrgPLVSx?=
 =?us-ascii?Q?KgXhzoESaXuRb0lsbbEpLad7a28A4XrokstSOWWfkOZZj/5Njd/SLBFe4VTR?=
 =?us-ascii?Q?kaqcf5lYaQ9uvOqDXTdbAay3akCkq8pi/S1//wsIU0nUdgHZZpzqOChpYmGX?=
 =?us-ascii?Q?wfCExQhc72SzlGGOWqv5eLf2Y3OjukS6rnsEI9HJTxtuxU17spd6sW97Ldh4?=
 =?us-ascii?Q?iNdi1gCvcLvVW7wWFjCB2D2xefqfMaSjhYA/LlDc/60xq2aNEPTWSRfebUYi?=
 =?us-ascii?Q?IkNlvmOvaPw25G9jntU6p/r0cNauvM5OdGWjnU047LXQyzNocoLq5l1iFJ89?=
 =?us-ascii?Q?wI6wkvWR74EMeggqQx0f+dMqQhlCbrlxxZH2rhkGmz/EomplT+xhKbB7ebFX?=
 =?us-ascii?Q?AKtM6Y7C12bhZGsBp7D9F36MzNtfOlwPNB/GBgnkjZ+4DpVBNUxLlyzhfpbP?=
 =?us-ascii?Q?+8dsJWA45fMH28HC75lhCYTulZIdAxSJPJyvuceI1E7kDpj9du6zpgxHZwNo?=
 =?us-ascii?Q?H8Fr6WDyl5rgP3yLNOkd/jTY6avWIgBRloq3moophiKaWBmdccFm4taCHdcE?=
 =?us-ascii?Q?PnBZpo2YdFZfIdRTmRE909EVnazbEx/L0pYkwyG5yZj0cEKHLRgtVb/QRMDX?=
 =?us-ascii?Q?FJANzoT+/rfzqWjPVQXMKWIEq6LoDXeqNtm7mPPsbh15VLrD187xgON6F8rx?=
 =?us-ascii?Q?9raRjUbQoNyfqMkt7vvL4Ja+e0drbZHrbXqUZCKq11d2I/dYPUoJobJttSn7?=
 =?us-ascii?Q?VC5p3tZ6gLenrnlvbMYy+j9A67pOAvOcPUCB0OJxQo3fvr5vJAV0qWDoZEqA?=
 =?us-ascii?Q?dIqJUeQQjc1wJGvyT848RJB13C2vdzTk79ee42H9Im015j5vXGaLIzGXK0L2?=
 =?us-ascii?Q?1vKaiwd7gekBjMl+mhPYWrwiFL5eVpVEuMUe8l5VfdzF/tsaT+q1ULWuM5uk?=
 =?us-ascii?Q?rBZR1yBSWEhAfTHm/pNSlmWyxyhsHtd4HRhOiWLHTkSBnGYmhszrn8sqQvAV?=
 =?us-ascii?Q?anp8IDMy5my1Kn7R7Jo5Yh6B3rNtRrs=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be25a43a-0bd6-4a76-92dc-08df0c61fc26
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 21:58:29.3099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BlfROeZYeUNvza04CdpH2sLK2YUdcT9FVCoo+F/BF0vJScyyhFd7hq+6u5U6V/5dtA3h3Sqgj2/kY0KWJswjWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5788

A CLIPPY=1 build emitted about 15000 `as _` conversion warnings, all of
them in bindgen's generated output and none in hand-written code.

bindgen 0.73 returns each bitfield read through a trailing `as _`, and
0.72 returns it through a transmute, which the lint ignores. The
bindings and uapi crates allow `clippy::all` over the generated code.
That group does not cover `clippy::as_underscore`, a restriction lint.

The minimum supported bindgen is 0.71.1, and 0.72 does not emit the
cast, so upstream CI may not see these warnings yet.

Allow `clippy::as_underscore` by name in the bindings and uapi crates.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 rust/bindings/lib.rs | 1 +
 rust/uapi/lib.rs     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
index 812f8e5a08d5..ad24c920b919 100644
--- a/rust/bindings/lib.rs
+++ b/rust/bindings/lib.rs
@@ -22,6 +22,7 @@
 #![feature(cfi_encoding)]
 
 #[allow(dead_code)]
+#[allow(clippy::as_underscore)]
 #[allow(clippy::cast_lossless)]
 #[allow(clippy::ptr_as_ptr)]
 #[allow(clippy::ref_as_ptr)]
diff --git a/rust/uapi/lib.rs b/rust/uapi/lib.rs
index 797ead5b5626..2df0340e63d1 100644
--- a/rust/uapi/lib.rs
+++ b/rust/uapi/lib.rs
@@ -10,6 +10,7 @@
 #![no_std]
 #![allow(
     clippy::all,
+    clippy::as_underscore,
     clippy::cast_lossless,
     clippy::ptr_as_ptr,
     clippy::ref_as_ptr,

base-commit: 1676a4478e434d43f8cab79587becd16d3e86552
-- 
2.55.0

