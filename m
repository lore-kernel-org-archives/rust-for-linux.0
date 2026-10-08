Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021088.outbound.protection.outlook.com [52.101.95.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD97B485CDE;
	Thu,  8 Oct 2026 19:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487612; cv=fail; b=DhZ+asiM6wwdBf5qmfLPCPh1mJV2jO1CP+yRjH13mEdoc53tg27PglcPYH+/E5di8P1lFMet/YjB6VScuOb8MzWlTPx1p+Hk1Ptw37U800gkdkv9RLZLQ/fcaJya3AYJM0mIc6UoblhIYn5X15OQcSUoH4RVPc+OopWF3tiwvxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487612; c=relaxed/simple;
	bh=7U+67rOAyw04dIznZGpU3qXzDg+5qB/4wV6daZquD+A=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hJQznx3RYhndh2vBUoZr1in78elOLfRaO9bqerlbgJBfsusTMt2y63lFItIx13a9Jlsvcob737ApFYdWjuAx7bXoJlpg0Q7CTRLrafBWNA6VWkvxxxWqoULoyrCdJxdoCGPRAparw7iMjyuTEkeoyt5Nxm5ZiwVkR34YskcwcqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=GQB+WzGG; arc=fail smtp.client-ip=52.101.95.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="GQB+WzGG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VIOv5EAhQ7raQyQq64oppvJnSPMzHmLvHEjUtG1udq9YRJu2giuB76hrQsIbPJ0MHYqR6n1ylU7zliURyyh3wvD2Quq0IQhSWMww4qqgABcAW7sY/lLWHhDtuRo3ZLJmgpCVD5CYtJWMc3EFFCGyTFoxsi3u6yDEnWwvSrENS7T23692sxKWkS5D68xXPqqY/1FPOk7zunsaV1wyKT2AxvC+HdanU/yahkWtm6JQaKeRoyA1WsPLb69El2YpEZfBXk8vZM71X5FCGkSfQnpFwPqEXLUjeAyDxgwh81GjTSlGP/abhZOumm9NlCJSCu+/PiTIue4TSs9LyFKl1oWSyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LmfbdJgG+bw3ZCpZd+mh761o/mwRsCdDWyOAtu2VCkE=;
 b=ryw1Mg8/ap3n6+dARuMwmthZ3En6qSKhYGa+o6asWf4kjsKoujlfqcnr5t44FbE1hETOyyHkTRZzM4aeAoFGK4Z/k6a0ncbf+t3kqfKnDZOu5oqE6bixN4O+YQPxeADsuI6rWNyKqEEzCNk+MFhL+LQZpB2UL4r5/2X6gzOOmnJ+ijzWLz9tWefs5bBHhgyXB9v4hwZ7qDRsSrgbaydAyJj56Ofl8+w3SnrlH8YTyADOuzB4VKJnO+avGjIneTCn8UXzqXVcU2aLnJTT+YWBcfyzSjOkmLrkOzhyZDoeTiMWWUKtXq00b8hSxQPWXycWjnYjXWCllms3ys9ZiV2vvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LmfbdJgG+bw3ZCpZd+mh761o/mwRsCdDWyOAtu2VCkE=;
 b=GQB+WzGGiELZUJBrBuEveHpn3t9xO3MkYt1cIln1MobefD+JbvuA72Wv9DgNHTGPxL3hHstMGnVqc/NfjO8XOBFCTNrUmQyI8gnqJYVz0p+LW64IcoH9UcEewOiJwZ/kuQtbO81zLEl4zreQYOTYhobGPA3lj3F970qzucvkM28=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB5279.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:257::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 19:26:42 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 19:26:42 +0000
From: Gary Guo <gary@garyguo.net>
Date: Thu, 08 Oct 2026 20:24:25 +0100
Subject: [PATCH v2 01/20] kbuild: rust: allow `clippy::comparison_chain`
 globally
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-dev-selfref-v2-1-e280b3c8fba5@garyguo.net>
References: <20261008-dev-selfref-v2-0-e280b3c8fba5@garyguo.net>
In-Reply-To: <20261008-dev-selfref-v2-0-e280b3c8fba5@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1530; i=gary@garyguo.net;
 h=from:subject:message-id; bh=7U+67rOAyw04dIznZGpU3qXzDg+5qB/4wV6daZquD+A=;
 b=kA0DAAoWD6EBe3/QE7YByyZiAGrH7m6i5J/tg1b1bjtgE4Jd49HKGJYY7Pc64FDdZUSLEDsFc
 4h1BAAWCgAdFiEESIsBZrIBmx3TKnfpD6EBe3/QE7YFAmrH7m4ACgkQD6EBe3/QE7batwD6A3Va
 fuHUQw3Od0VwvkzPCZimQva8mLgD2FEcnxd3UJkA/jMzpRUUYubTwk6EBnelagqhwBtbSVBdr2f
 M1mCqZdUO
X-Developer-Key: i=gary@garyguo.net; a=openpgp;
 fpr=E25A77AED6FDB55D05B304A09D8C6F14E3E60652
X-ClientProxiedBy: LO4P123CA0308.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::7) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO2P265MB5279:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cc25da0-c505-4f0e-2eb9-08df2572157d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|10070799003|6133799003|18002099003|10067099003|22082099003|921020|56012099006;
X-Microsoft-Antispam-Message-Info:
	M8GCshblau7ISRLk2/q+ULOpQihr7xaRWwmDub/KlhciI6Q0o7rhUnWTKNSRM82cYfvGgnetSPti7VvnHTD2PpGyGgqdYzW7d4O6DQ3CwUwHxswoCLYYDfH4wnrEF9bfDAQgprlw7MHLSWRRorGEORdojTI3gZpKLZlSMKVx1w3oqLNxeVjPGVQvLMRj72F2OWA0oCZLz6rhfVhVb3K6P2I2KbdNJLZNHSkvj5Mb5WXrApYm91Jo5h0vMDv7RRwRX2dUY6YWRkeDVUqoQcGEPzdXS2a9MtxrijMKLYP5IGumqZvjJfM04p5v7JmKoPSLSzPajZVmW+O2gr20+3nIEGpwFcYKHnhYT/YHtUce8ZDYRYcjuVX0RojOPMEGkVyMHKxWY0f6BoZFjF9BhdW39pIWm0+cIKV4oiUf3EVDwjzmuLrM6gq6YtSH6j7P0HiBErisLa9AqzBYHPJvyaaUaTKfOcNn8/8+n9sy5JFURWFQUZXoHDc67vD0gsHB5ZwSEJ+ITQ3lxxPPXwfTI+PIdPKw5/TO9UpVIV5r2U+wr3+nEOw4E4pz94snmOSNBORkdHjBzAJNS0G0XOnTL+xGVvH7Lb4r7Y3hFROelErRv649ZbvOHZi4vfzKorTMFCEkflcQEQ3z0pRL8l5+CG9jZoGcxmGSSVTU/yH54Yc/WM9ca/VlDOS5xSxkqrt9pChkwl7aedGvVjkkbGVrfvnGaw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(10070799003)(6133799003)(18002099003)(10067099003)(22082099003)(921020)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1Y0NjdzUEN0dGdVdC9Qd0ZNTFk3WG5McGNyejVPb3hGeXFSN0UzdHdqV2dX?=
 =?utf-8?B?dWx5NEZNc2t4N2NEQTJzT05nSk84Ulc2bkxGMVhycmxaY29pSG1hcUR3c0Ez?=
 =?utf-8?B?ODBwLzVVdzZTR05rTmFZVUE0RXBDMG5GcGJkMGdQRkhpOHdBcDAyZU1SVzdq?=
 =?utf-8?B?SEl6d1lQQVg2eWlyaDNlczkvU1ZhOTk3bUJES0luUEdmT2pTY05SdzVkemNX?=
 =?utf-8?B?RUdBVnN5K1ZlMXdHUWZqYU5LTXozdzBhTE05Z2ovOFhKQjZXYVRIcWNJYkdQ?=
 =?utf-8?B?M0MxRk1oZzgvWUZLS25MWWE3RjhhSUI3OFoyajNySWliSkFBaWlKMjZDaGhP?=
 =?utf-8?B?SVdkTVY1Nm5STUlrTDlZNmlVdVpsU2dOem4vRVpFK3dVajduSFBKdStibE43?=
 =?utf-8?B?d0FPS29nTi9QOGczUy9OY1RTc3M4L2gxN01ubm41MitkT1FmUVZIWE9IaCtR?=
 =?utf-8?B?dFNDSGd2SmZTb0NsLzlZd1NBSWhuWnhvWTBQNWRoM2dsN2RqOXFhWituWkVJ?=
 =?utf-8?B?c29YUlNSM0dkU2UxNmZzZzMxY2JBUk12QktFQnVBaHFQUTVoVjNtT2RFSE94?=
 =?utf-8?B?U2RybUplVkNMVUJWMDA1K1E2b1E2MXNNd2lDTnh1Rkp3NG9QcnYySVZLTEcy?=
 =?utf-8?B?OXBkWWxQYzRicGV5TGJLMTlkNHJhUUhmbHpWTUpMeUg3OG5jZVBhY0RxeTN2?=
 =?utf-8?B?cWdUQUZpdEc3L1haMS9ObGg0Rit0NkwzTy9KazArZ0c3ZklxbWVHZkFtWmlD?=
 =?utf-8?B?VVZtTHhzblYwb0EzZ0xDY1VVZjRJODZtMmdyenBMNkJ1MXpEQUV4WXVFaE1W?=
 =?utf-8?B?dkl5anJsSU8wSzIzbFNuTFBHOHRCS0JPb3RXeUh4ZW1hMzQzOFQ3Ni83RGhO?=
 =?utf-8?B?N2QvZ051QVozdHJvVjAvWFl3SXNwWkNNbEFYQmdmQmhQaURTWmVOUGxEbis1?=
 =?utf-8?B?cmhiQUxSTFcweGRENUxOaVVrSlBlRHY5V3NFQ3RLRG5vT2dPQ3N2bkFDT3ZG?=
 =?utf-8?B?SS9yOUNFaFlvcjc1UWwrdFFCMzhyOVFMeUoxTUlhdmV1VmZkK1ErQXhyeGxl?=
 =?utf-8?B?M2pWdGplU3grK0RuOEc0cDA5U0FLTE9jRVZQOXBTdFVOemZCQzZxelZRWm5K?=
 =?utf-8?B?MURlOEs0blBzTzlvWFRMU041T2pJOFBGOUxMTXl4OVlWM2FTaVpvVFRaSGlZ?=
 =?utf-8?B?WHE0cUtZbmEvWHozTUVPQ0dvNFF6RGJIazQvbHgvTkpOdHFwY20xR2hvcitB?=
 =?utf-8?B?VUlKOXEyYllBblRZbFNsdWNEUUJBNEFSbmxaY0JvZy9ObDJ0L2JwNE9KUEcv?=
 =?utf-8?B?Q1FRblJCdVVZOVpQbTdUUEx4S1JjNWdCVU1YY2VHL2NlMmdtYjc2cFlZTE1a?=
 =?utf-8?B?TW90YnorYnZROGcwTy9lYWpJV2xybEJXblFyck9QZFFFSXlKTlJaNDVQVVhQ?=
 =?utf-8?B?OVhBYzBoZ2N5cWQzakJtV3pVSkppYk14ZVdFOXd0UktXWUpyZXFxRjN4ZWVv?=
 =?utf-8?B?aFlPUTB2TFJzNnh1d0tNNjRaVDRnbXptcWRrc0p0K25oeFp1M2N0RXRtSFFu?=
 =?utf-8?B?UDMrQ2k2NzdXVVl3dWlWTG53cnFaNmtLUUNiQXRYRGJrcTdzU21pbWhSS2pp?=
 =?utf-8?B?c3VRL0RLbXdVamU5M0l0dGF4WHhaNStUclIwNWlqcmRQZkY4RDhXMC9id3Y1?=
 =?utf-8?B?VVBHNkxxOW5XaVZ2UG5QYVNSYnpMS2ZQOTJ0VTNNTW1GbGI5VXF4YVc5cTMr?=
 =?utf-8?B?T2sxRmtxdXhYNzgzYmZSY1MvK2czYy9jaHA1dnBNUTZHVDlRN0tzQ1IwdzZv?=
 =?utf-8?B?Wi9IeS9qWjk5aTdMbExvZHY3YzVvL2NmM3lBN3pUOERXWkRXUm9yY09vVHAw?=
 =?utf-8?B?Z1dXMEI4ZjhpZ2xheDlzc3NTT1BLRElKOUgzUitaNlBTTldvTTJiYkdCUnA0?=
 =?utf-8?B?QWJramRPMHhadW05cXVZMzYzSTBhUms0TnpzRDV3VVY4d0dsQi9CRlROaW1V?=
 =?utf-8?B?aVNhQlRCWHhnMUhmVG9xY0R0ZUVIMzVmNmlwL1JhYnhMamxWZys0NkY4bDRQ?=
 =?utf-8?B?NXAvb0tldHlUMFlQcnZjeXZCNCtvNDVSK3NyZjhSWHo3dmgveDdQRkcvUTlY?=
 =?utf-8?B?T2tkeGdPbExLT09nbHV2c0tuZCtIWGJXUjBqM0hQV2VsejZ4cWlId3hJUngy?=
 =?utf-8?B?ZEpuVWhuSklsTWFObjBqRzgrNjhzYTVXdzRXa3FtRFZkRkdLbVhUSmkzaktW?=
 =?utf-8?B?TWFrV0dUekdMd2pmTGNDcXJud1NFMXkxejF0cCt1VWJaK05GZVpObTVNQzZa?=
 =?utf-8?B?ZFROK3dXb05OQ3p0Ym9nTXhpVGJ5OTJuczd6VnEyWWtPVG1MKzhBb1RKYity?=
 =?utf-8?Q?A+PIoOh0SsuJc3O0Vc/Wfere4eFgTIcd+Y8PbrrYd5g29?=
X-MS-Exchange-AntiSpam-MessageData-1: RyNaoWq722v2Hg==
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cc25da0-c505-4f0e-2eb9-08df2572157d
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 19:26:42.7457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Kv2taS0kMEQAH35Fuu0EDdIRcnjqqmaNhQTVy1NHGLDGwV3YG9k4P6quT1jd0KUhj1U3o+d8A14GVHDgXb7RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5279

The lint would suggest comparison chains to be converted to match on
`Ordering` instead. The suggestions do not always produce more readable
code, and also it can produce false-positive when not all ordering has a
branch.

The issue is known upstream and thus it has been downgraded from style
lints to pedantic lints, which makes it allow-by-default since Rust 1.87.0.
The current kernel MSRV is 1.85.0, and thus the lint still triggers; allow
it globally to match the updated upstream behaviour.

Acked-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index 0f1b80100b47..2839c6c5045b 100644
--- a/Makefile
+++ b/Makefile
@@ -476,6 +476,7 @@ KBUILD_USERLDFLAGS := $(USERLDFLAGS)
 # These flags apply to all Rust code in the tree, including the kernel and
 # host programs.
 #
+# `-Aclippy::comparison_chain`: the lint has been demoted since 1.87.
 # `-Aclippy::unwrap_or_default`: the lint is buggy [1] and ignores our
 # MSRV. It can trigger depending on the optimization level.
 # [1] https://github.com/rust-lang/rust-clippy/issues/17379
@@ -494,6 +495,7 @@ export rust_common_flags := --edition=2021 \
 			    -Wclippy::cast_lossless \
 			    -Aclippy::collapsible_if \
 			    -Aclippy::collapsible_match \
+			    -Aclippy::comparison_chain \
 			    -Wclippy::ignored_unit_patterns \
 			    -Aclippy::incompatible_msrv \
 			    -Wclippy::mut_mut \

-- 
2.54.0

