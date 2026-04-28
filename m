Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020087.outbound.protection.outlook.com [52.101.196.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774D9451054;
	Tue, 28 Apr 2026 13:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381882; cv=fail; b=oOtb13ZvMBrsFv3HoCnlS8oDWx3yxsOWD/E0C6h872KE7k97oPkG6rz2izw0NwqusKWwwu10kz8F4NqmGpllDQL4Z/rjhF+kd3TmbMwhVgg/AWr/XvDkhyF+DSZ7H6mPgIUddoA3LXHlyQLhxJvWs8y5Fo8xl8SfR2FRSEcT1pQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381882; c=relaxed/simple;
	bh=2S7GJnb2K+0NfkK4k7tgqqG4Ny8wTVTi9xKgCIURDRs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=EWlW7yaP+x7kxlrlyMuOPH6ENbVZL183FYk25Q0EadPMC3H0I4DNh6NYLzp45bDaV776+LZqpRZqRhFKNyA+s1pcJMmOj5Z8vnMJNYaS3gKNVgbzNtftF7pToWE4aIym41mPGEXiUoILAXxgpSv1uncXgkBnqUmFxIrb+uY2KAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=elPJBu9p; arc=fail smtp.client-ip=52.101.196.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="elPJBu9p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sAcofJD5NcM4JR03biaaNNqKlLdJGcO38bO1aDWPGEHnfBNJ6xERn4/3nf6Ya6ZINvGDIfbhNnD8LzZp12De5DtEKXX31PWBigxy6kcx3k0Z9eKCTDNmUBK49ublhY+dmW/ln6YOZmPa0DjAU6DhBxSa9tUEMPMvdWRageIpxPPZ8e2RaB9LvnON4hVdNfJwSCMEZ13HJzAbXD1yRa71IZ6ni8yoPhpf5VZloD6y0FrmeDddTvQnglaUC1WDb3EodgsbZjNo9qJs9rCeIQECeGEQa3wHDUALW4ezwbsWgKqWktY0Eo1LW2gDf3UeNVKAFJ+pPSCFlsRkDeigI//EgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLRjulnufU+FM9cXALmd111ZNjNo/CSektrJrac1+9U=;
 b=kA/A0yU5xhKXRtHoW/OlqvdDzLmagXB7wN7GI9vaeDcleudnTPCKST4mKVYGfdWlUz9D0al10SPOxoE4W4LAkrPuK03lrOQGfWjuhGsdbYgMeJaErTuBnflakUn1GCf0Nc1oTjSITtx7RNYuk5/QOZYQSnLzqPi1ADLHaNmd+6la/K+Yphq9fk0ckYxob/AFqI7vE1ew6KO7rKF7Y/SI1a07WzdGRiMeaqE+3FyndbdnKt37liCZSB1pYKfWM6ao72IKVKauI+fn8fbII4/GbGz6mDBydEbT5eA7h2nFMYWdK606lXlUvhoZLeyJebDDTbmjUpoi0iRA8kOxb/Ct9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLRjulnufU+FM9cXALmd111ZNjNo/CSektrJrac1+9U=;
 b=elPJBu9p6hUd5D+BJjLiIilvBfi64HN45BsZK7O9oAEMfjH5+bJU5L0hjAOSFfDpz8E+MgOjBjwHCy0ooDFOK6AiUbcJBLQ1AklR+Wc55jasYcxl4kVn1Z7Me7uOg3d9Nwm5uSNXmok6HejbvujxdaWiJ893jy280AojjSPE6BU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB5969.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1ce::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 13:11:13 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 13:11:13 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 28 Apr 2026 14:10:55 +0100
Subject: [PATCH 06/10] rust: pin-init: internal: remove redundant `#[pin]`
 filtering
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-pin-init-sync-v1-6-07f9bd3859fb@garyguo.net>
References: <20260428-pin-init-sync-v1-0-07f9bd3859fb@garyguo.net>
In-Reply-To: <20260428-pin-init-sync-v1-0-07f9bd3859fb@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777381869; l=1268;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=2S7GJnb2K+0NfkK4k7tgqqG4Ny8wTVTi9xKgCIURDRs=;
 b=vq4G1sQowLoSPwqZaQ0iIaq6eo6lwxwJtrRKvDBjfNzIGcRa2Cvwb+lyTX2PELJ42Mo90gYdI
 WqChC+us3unD2VrAJh5LeVu0YIPGZY/XcktprgCASBGvlYk8Md4sO2H
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0074.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB5969:EE_
X-MS-Office365-Filtering-Correlation-Id: 744eb68f-2a81-4805-5507-08dea5279ecf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|376014|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8LaxM9CJVb18rvbzr5hNTRBAAozhKPwb9dmrS5YPT+YcB75seBgoHhBzWlI2p6gkRQOimW4y+yIkudO31zZFLuJtYvIE6/Dl/YPmRzypOoFLCXyJHwZpCmMX4J8EEudqeZ/qixi6pUhVuH5pUloQFbG9TZAgFRgbdjJQJBaw9q93OWO+CrgfmNo5QBoXtWEG/LH+Zd4vasP8bmf0MlvBFxzmoeLPmqxgQv2lkGQjntAFj1LhtJ848izIgKNLoq3mqArHncxILnoCjLmLS+CkaAYHvSYR2fqk6LJLkRkFF/sshYvLuZ18xc/jkccFL0+rJYG6XkNsydH5ScP36CW7ApxEfG2Dw3vZkjnnzgqClYtv4uKOFQ4tat5kL4SHcMEQrSJtjVb3Dv06EIxWJcvtcnWMFyvPyKSN+1X0S/NSA+wIckBFAx0WN4WoMHqrxX1VNI5olD3OiBwgTBCQ9B3675ciy4a5YX83n07aQ0hSqhS6l5zCES8CHDziQIHsiYbb/ceELQQikPdBIP9pDy1XOtA9YM6+lA0dFaN1iWnPkSDP2lZRhkswocgasbsB30ETYjDRH5+0350MK+KUeLJ8uGeT3txr0Y0Z5XOjiz4jhQJQtndg217llyQoMCiIsIYfO4vpNDKGGP7nk6FDaxb0I5pbCqDRLmT+CCORb7zLIQt33wLzNqD9FGqipD41hnBp5WjsfuNCdWjYFIvbpUcgxWuo3giq6wJ6JuhHPTL99Fg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THdTWXBBamVSQVJUaGUwSXA5ODVzeTBlUG1IUUdrWVVvWW8xTzVOMHYvR0k1?=
 =?utf-8?B?SURBWlgvWmFramZRL0dRV2JTRXNPOHJXdk9qSzkrM3pWeWFVM2VEbEcvNGxQ?=
 =?utf-8?B?ckVqOWdwWVNwaDcxQXB4QkF5Rm4veFVKV3ZkamNLWGdGTG5hbGhsTGFxamxZ?=
 =?utf-8?B?a0g2S283TGdnNnd4WjZNSWhmTG9aUHh3SFBQekNraWRHakN4dS85TnNXWkx0?=
 =?utf-8?B?eG9RMEE5RmMvVFZxQkFoODZXSCsxMUVkdTFrbUNoSFdYYXNkSFY5cXBBdWhF?=
 =?utf-8?B?dS9uQkE2YVE0ZXhRRnZXUHUydUlwZTlRVmVkM291SXNLS2dKY1dVRWNEZnVL?=
 =?utf-8?B?Nmh0ZVRMTjFXY0ZpcERFZWcrYnZWVDdGMzZ0VlRyejJTNjdvNU5ORU9QUi94?=
 =?utf-8?B?RVM5QUQ2d2FIL3puZDJHNEpQRzNBSGJBY1dTaTlzZ3oxNmNQWWhMNS9xVlFm?=
 =?utf-8?B?aWhBbSszaTUydk1sbXVKQXFGRjliV05vQSs1TDdteXJJUFY1dVE2L2kwNmpN?=
 =?utf-8?B?VzNTdENtMmlOcVlwV3o3ZDVhWUJ6Nk1yNng3N0gyYWRLeElIWjBjK1Z4ZWhS?=
 =?utf-8?B?RFI2ZWJNWHJtSGcyb1JTQy8wZmcwL3g1S1lMczZiOG5MY3MwR201L2hkY0xE?=
 =?utf-8?B?ZTZPVlFBd0d1cGRmbkU1cFJ4V21VcmFQU3BIUXNuVWdrOWlXblVUUUExOWtm?=
 =?utf-8?B?TUNBeEZjMHBhSzQ1MGE3NlBwUDdvbml6TVVCcDhReHZNSDQvc3UyVndETzY1?=
 =?utf-8?B?SFNTZk1RL09HNENQcllaYVdzdStvL1VFWlI4N0x2QU1VYmxQaXdKZ2Z0RUFO?=
 =?utf-8?B?aGQxR2gwbzhSemNtTThxakpnY3lOUEtxM3pRcDllQW5kUzJTcTlHd3NSMVpo?=
 =?utf-8?B?MlNPcCtyMkR6MkVsZDQ0YTZ3blVyalZFZkdhZ2dIbi9BZEl5dzN2R0ZhVEdt?=
 =?utf-8?B?U3pVRURXQ2k0bDJ4azZuZy8vcmFCTkZDakwySTU0VGc3bHZ6NFNvVDl0aWZ6?=
 =?utf-8?B?QzBydVBjUVVXczBqVjB0S0Q3WVlhbDg2cmgzaEdnS2ZGN2ZMdTVFUDV5b2I2?=
 =?utf-8?B?NDc4R1dRdVUzSXM4VWdxYTZwejgwNVNVQnhoV3A5eFZQZXZHRkhXd0NSRTY5?=
 =?utf-8?B?eEpGN2tZRlBDUG1SR2tUeitlREFJbVlKdDFnQUo0b2MvMUR5Z2FJbDJ5eVVN?=
 =?utf-8?B?RDQrNSthQkFHVjhiVGduRUtDMDNjVnNUMlNvYnVNemdZbHRlOWdCemhSS3Vq?=
 =?utf-8?B?M2dFQWlTQys1VkpZNU1qcDUrVnltckdvMWxhODFJRGpPUXA5eGhDWEVrZlp1?=
 =?utf-8?B?RjhhSFplVW42THpvU3ZhMFp4Y256b1BoK2VxanI5TGhqZzhRMFR2WWw0VDdm?=
 =?utf-8?B?SDdkNTRGWDBXaTFzTXVCaGpleGp0bDh6RkVWYXE1ZUs3S3g3VHVFS3pyV21S?=
 =?utf-8?B?SlBZRU1rSWxueVJLcys3Z0I5TlJlMzJtR1RqQ1NyWVozTlN3Ti80ejYzY3pL?=
 =?utf-8?B?Sm5ralFObXg5eVpCTWVhRnRkVzRkZFEzQnBQekZ0b1YwWnk5cjFhcm5QVHls?=
 =?utf-8?B?bFRzcFpSK20zVTR4elhQbVI5c0dSS21OenV5TDZhaDR0N1RHUFA2RHFmdGRa?=
 =?utf-8?B?U1V4Y0FNQ2hwMERQa2w1NjVGWmVaRnpKblJEMGpOOEhKUWxjK1c2bFlrS3Bo?=
 =?utf-8?B?cXRYTnYvSFNTSEVYRUloa01KTE5DSmxQQ3luT1l4S2tCQ2x1N1I4a1dqR2Ru?=
 =?utf-8?B?L21kS3hMYzFXdmtqNklhNDAwblF0R0VDNVZIZDVMUVN6VWFZWEtwbHI5OHRG?=
 =?utf-8?B?MFJXVklIcDdHQmoyTGl3OVB1b2tmRVgyUGxrUWltbEVGakRoMnpjNnZZdElo?=
 =?utf-8?B?Zlh5YTNteFovL2ZrRzZTRURkUUxLN3VnLzdid2UwZVJwdExFYkVVcmdYTU9Q?=
 =?utf-8?B?U0tRSHIzdVRIYk4rZUNpbitGelVqM0NwNXppdXhQWDdDd3RiMzFFeXpVUjQr?=
 =?utf-8?B?M1BIbGVicEFDWGhIQURVQXN6YU9XMlhEcDcyczVkelpXUGMxQklsZ3FFbzc1?=
 =?utf-8?B?eVZOMC9NZTdPU28zRDJWNGo2QzNwN1pieWdHNy9QZ3FqazFUeHJXVno2bGg4?=
 =?utf-8?B?WFFUV0pOMVMxdm1hZlEvSS8zKzBaRDN1ejROakUvTUlCbmt3dytRajR2cFNX?=
 =?utf-8?B?QmErOEdyMGhIK0xhUXQ0ZThsa1I1U2tna3c5cnVXK1ZwdEdqRXR5SWtsb3g0?=
 =?utf-8?B?VlpQNDd0QmpUdmFkRGl3WTFQQ3VxUnRUT1JudTg1K0ozdE9rWWRuLzRsWitF?=
 =?utf-8?B?b1kyTWNrM2lER2JuNk5DVHZ0ck9Ha0ord2oxbkRlS05uQ0R4bk5JQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 744eb68f-2a81-4805-5507-08dea5279ecf
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 13:11:12.0502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u65Hp+WT9r5ptILcR/ahLu9O/HchJXyZDH4KzEqqkSYNr6/T3E/n2uE0RplqsvZNwUuSL+0TNdEB/ZDcSrNffg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5969

The `generate_projections` and `generate_the_pin_data` function already
receive filtered field lists, they do not need to filter out `#[pin]`
again.

Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/pin_data.rs | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/rust/pin-init/internal/src/pin_data.rs b/rust/pin-init/internal/src/pin_data.rs
index 6b1b8f26379a..76cd11bf28eb 100644
--- a/rust/pin-init/internal/src/pin_data.rs
+++ b/rust/pin-init/internal/src/pin_data.rs
@@ -258,8 +258,6 @@ fn generate_projections(
                 ..
             },
         )| {
-            let mut attrs = attrs.clone();
-            attrs.retain(|a| !a.path().is_ident("pin"));
             let mut no_doc_attrs = attrs.clone();
             no_doc_attrs.retain(|a| !a.path().is_ident("doc"));
             let ident = ident
@@ -360,8 +358,6 @@ fn handle_field(
         struct_ident: &Ident,
         pinned: bool,
     ) -> TokenStream {
-        let mut attrs = attrs.clone();
-        attrs.retain(|a| !a.path().is_ident("pin"));
         let ident = ident
             .as_ref()
             .expect("only structs with named fields are supported");

-- 
2.51.2

