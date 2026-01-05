Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020101.outbound.protection.outlook.com [52.101.195.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83804313291;
	Mon,  5 Jan 2026 16:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767629158; cv=fail; b=TUo9Hg1k4qgjxv/k9W1p6HW7X5yeULkKiX3xXSdAIwlGWEYraV34v7pwW5RdZst8frtl4uCuHvlAxYq3DS9abJlVXAJUQQF5oqNchoAdMF+uWG/KKzMzKMrbKpBikhez4t8ZbDJVHWN/c/iSOaV1PSK/wHS7QPXbwv4AJlpsCZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767629158; c=relaxed/simple;
	bh=StmxWS+STyFN1+L3HYx0Vw/ea08fMve51yjlPxzZx/4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EDh25gi0A6beZgTC8SfMpXXG2naf9AytiMUIFMACTc2AIkvF7RlIxVw6pU1Afi+i1GhBNCbxBvBb63mrZcoDcIVZ2R/au4vugUL+UztlF3cBq7J471ZVAWHwaecHXQa1gSXLY665j12Bu2N6ieIq1nrmw1+5RjN6/5bSpn2Q+pI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Qv7PaQaz; arc=fail smtp.client-ip=52.101.195.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Qv7PaQaz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xgGtlUKr+5Desg7W0v6MRruE4RCyf65H+5sOr40TYeLInU3HRjVKEhYvEzq7JASy2laY6ZTXHeFOZ4dN2Z0n7cpxCFLaUrDoPw32PoE2/qkByPGwgZolW7CFfLZnw5//8ewJrinUZXUt3Zn8wYh8mvn7WYAOr3au8h5NgzIOdi+mdBInya38zlS4NR2FXzAgP13barGvmyZNDuS7SNXuGHIkLdbHeumKdHOHpyoFgnOJMec2H6GjaMrvC/sVJ1a562KsacUcJMDreyxs6VZFSd1wpwzitCiAxoPYdSebqa3Xlt9FDEVHhJzAS3d14qv7SxO4BHFFsjAfTRp67kSFcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fws7AnhBRc9G9/EhSUbkUm58MZzC7dA+teKGhfnN0U=;
 b=UPK/FjsEOf+fMypwlC3su9AQC3UUwYhhniyZLXsrrHntMroX2vS1pJY9OoAclUPT7v2vg2auP+D+2m3t0HrHX9k4UiYZJjO55GpLNuQwJ8moA2sS03tzQvAXPj5NLEgPShkY4YVTMwVolpZ3ivZXqeTMAPoskc2KEVOJAG1JixxNE4T4+WgUZR9K36Brv+KSfec6ob1uRNjMpNq6Jw/RpI4mkz3rauVoA55obSoYOEPtVdaZEV0Wti/COjcHWRjpHq8GkXLqUH+j0K/zWF/1iu6EpUiAf1GvdzWSc7U/c/zsa1HqGQEJg70cQKWPxXLgqXB00J0NVCHRr8KzFBQRuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fws7AnhBRc9G9/EhSUbkUm58MZzC7dA+teKGhfnN0U=;
 b=Qv7PaQazPxJMzZEXCb+k9zRErOd2nqw4tdFuEd13F5LqJVi1YNMR4QxaIZ97Pkkg3VBhit4zCOG9QvHknnNICCYMUOr9USmNV8zQhPmjNobE1y6vHan7XeFuttXJbTV/owFYQN+2f1DrOnfUgiMgnwKNXvaAjTLvGm5fPE2+EOk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB3515.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 16:05:47 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ea6a:3ec2:375d:1ce0]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ea6a:3ec2:375d:1ce0%7]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 16:05:47 +0000
Date: Mon, 5 Jan 2026 16:05:45 +0000
From: Gary Guo <gary@garyguo.net>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/11] rust: macros: convert `#[vtable]` macro to use
 `syn`
Message-ID: <20260105160545.29a88dd4.gary@garyguo.net>
In-Reply-To: <CAJ-ks9kFPFjwsgk4ShM1+CLdTSkFLY3WZC6keM=6nKG8Mf7EbQ@mail.gmail.com>
References: <20251211185805.2835633-1-gary@kernel.org>
	<20251211185805.2835633-4-gary@kernel.org>
	<CAJ-ks9mQXP1mAYOseoUo0jbKD0FrhKOSW7ifgOUKzfrTM4WYeA@mail.gmail.com>
	<20260105021756.5df32974.gary@garyguo.net>
	<CAJ-ks9nTwOvJi=5b7SLZn6ZEd9pPRPQJosnAOScEw6LJ__Un6g@mail.gmail.com>
	<20260105142733.3d4ecfde.gary@garyguo.net>
	<CAJ-ks9kFPFjwsgk4ShM1+CLdTSkFLY3WZC6keM=6nKG8Mf7EbQ@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO2P265CA0389.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB3515:EE_
X-MS-Office365-Filtering-Correlation-Id: ad4825bd-dc8b-44f0-ee24-08de4c7449b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|10070799003|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bEgxTkF5VnB6UW8vMTFGd25pMEw1NHJITjgwRzI1Tmp4bEZzUVUrOFZUczl0?=
 =?utf-8?B?akFnelo5TWxNaGc4TktRcVE3WElkeVJWU3BjdG1Gc2tSWC8ydGYwUFdEUFV2?=
 =?utf-8?B?akFTNld0TVp5WGxySDdaaDV3TVpWc0JINXNsM3ExMjAzdGM5cmhiSEE5Zm9m?=
 =?utf-8?B?L1VDZG1rWkc2aUY4TUR6SE55bEFnUGJVTFdqeUFmeHEramZITkR6TlVic0U0?=
 =?utf-8?B?amR0bXhycTlHZzVQeFhlNkxiSHlOdTUzM2Nud2wyZW8vNlRlWVViMnExZU9M?=
 =?utf-8?B?LzBoQWNGaG5pTnBOcEwwZUtwTW9oN3BMSSsyN0xVQTdMYngvME9HYVFIbHY4?=
 =?utf-8?B?YjRIN0RHVVE1RHJnTkh6U25HTXNFSkFHTXFYZVhtZk1Tbks0LzhHMGhnaHdl?=
 =?utf-8?B?V0xCS0Y5Zms5ZjNDOXNqV2M3djd6ckx3Ni9zM3VKdHM0WkZ3Z0ExL2cvRXoz?=
 =?utf-8?B?ZVNuUW1oMHZnQktoK0NWK1ljMXUvZFhxNXhXNGprbFE3UlF4Y25PbzQrM1pY?=
 =?utf-8?B?czE4NHJSMi9nbVBleUdDMjVpbUNwV1d4UkNyTUpMUVpYQkFnZ0VHZTF2cWQ4?=
 =?utf-8?B?NkdGTHZJOUxudTZwQnk4M1NzSkl3alJYK0E4N1d0ZGYwaDZkN0RqQURWVEJP?=
 =?utf-8?B?RFg0WlNiaGsvWVAzUEduaVZlL2IxY0VuYWJzTnk4WVpGKzFGc0Y1Z0lYcmF2?=
 =?utf-8?B?ODZrLzkwTTRSaGdaYzZmRWFWMHB5MHhjdjhMZjZFOXFCQThWUUY4K2ZHbGpz?=
 =?utf-8?B?LzdUL2NGTTNIcVhiRW9JeWxIeGx1TlNFa3hQL1ZxeFBqMHpIcUxYZ0c4Nk9N?=
 =?utf-8?B?YktsekVCTC9XS201Z2N0YlZoSEpQZktOUE5lenZLenpaMGJqdlVZcEtFNjBJ?=
 =?utf-8?B?akt1ZlluY0F0QnhnWHJ6K1prTnJnR2p5OFF6d2E5RFQyOEhhMzBDUFUxRHlr?=
 =?utf-8?B?K0prUXJaN0xPQmZTWTdDRXR4eXdGNnJHK2VxdU1ZVG4zQ1ZWeGtWbm1zSkNF?=
 =?utf-8?B?YU1zNklobmR5YkNyU21JS2NWKzJseDgyTGZmaFdLWjhEZ0JpVEh5VHJHV04w?=
 =?utf-8?B?Y2l1R3UwTitGZi9aMXc0cEMweExYNWg4SmlFRGM4d2UyR0J5WXQ3cEY1Zmdp?=
 =?utf-8?B?QVgwRDkydkxGWXIvZCtkV0ZrRldUMUkxV2ZTYlRpZE50VThsSHBVSmsxWE1N?=
 =?utf-8?B?bjh5YUk4R0lMNzdya3dKUWhPekJBRUlJelZrQlpVNVBCOEJJL1ZlRFFqRWo3?=
 =?utf-8?B?R0U1VnhMRDZhWk5xQ2p4aXZ5QTQrb2NYS3EwRi9qMTFMOFIvOGowZEYrUDlv?=
 =?utf-8?B?VFNFUkQ0RnVMdTY1eUFyNFJ0Ykg4UHB3RTIrQ0dHb1hUc3hxWWlVQUR1T3Uz?=
 =?utf-8?B?Z0w3QWdScGtXMzdvS0N3eHFYc3V3ak1sbVpDV1VpaVJuMExoOGpocGJJUy9W?=
 =?utf-8?B?QTZFWVBVc1J5cVlORFI1eEtXS2xUS3BBdWxwL2s1RkFBNFVQR1hkY0gxYUY3?=
 =?utf-8?B?eEM5aUt5NmtuUmtyUzFXaDJNN0IrSGVvZWNSalh6QitCVHVTdGtKbUFNZVRR?=
 =?utf-8?B?c2NlNFZGQjFPd0FDcHprblJjNjdrTFA2QzIwTmJmaUNBYmZOSW54R1IrWlJk?=
 =?utf-8?B?UHNIdHo0QXBYR0hlTHl1YU16c0orYmhWVzBoeVJxeGFlWmhlMmNhNzZXaVZ4?=
 =?utf-8?B?S21aa0hLTTFjekVRMGNHTExFYUNDc0h5Z1R1Z0FiSFYxT2hJVmx4bXBzNEFC?=
 =?utf-8?B?c3UwNnNxRE9UY0UyQnFvZHBvUXlSODhkNHhhUXd3ZjAwbFNnZmEzVmZDOGNu?=
 =?utf-8?B?ZjNoeE5pWjZwVTcrVVljcU1vTkIxd0poblpBVHZWOHp0SmtIZEJEelBOMmo2?=
 =?utf-8?B?WEhDdDNnbXF3YjBqcTZnSmUzbU5oU2oxQlIrd0RYbzZVdDhHV3hqUkVtNy85?=
 =?utf-8?Q?K+VGrAXzHK5LS3Bt2jBUsnoGNVRdQ0uI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(7416014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzRLVmdVMDVNK3VYaHJhbWp2WjY5NlN1bXdONUcrSnZYYU1VQlFTT2lkd3J5?=
 =?utf-8?B?dmxMT0d0Q2VUbWFUUm9zVnorMThuNHhwTm9HcmV2emtodkFmOVZqNGppUm9N?=
 =?utf-8?B?TkpNWmhPM3ZnUnlPcFkvUXRPSzJzZGlzSkJZUHhWRjFtNFlsY0VGWUVLVlFR?=
 =?utf-8?B?WWxlV1hFYmxVM0RURStBRk84ckFyK2hmcU5Ld1dvNW1qcFE4Wm1KQTY0NnhS?=
 =?utf-8?B?UWNxOVdhVkx6NlNRb1ZDMnRQRkJoZ0oxV1dnYVNWdk9FZTlKWHMrUm5OV0cy?=
 =?utf-8?B?dHpCVXZWRE5IczNSTDJ3RERIZ29qb0dDVzg2L0hKKzdmM3NqUmViOGhYVHRI?=
 =?utf-8?B?dmFHYmNWbjRaalcrM2E0bEVlQ3pDT0JBcXltdXBEVytlTWN5aFQ5d3NqTm94?=
 =?utf-8?B?YU03TmlPR01TS1lxdTFGcXlDZXpOYVNPOG5NZjlORmpudlRIU2hONGdZWno5?=
 =?utf-8?B?YldQU05JSVhxeUd3akhIMUl3a1FJaEZoQnBDd3JsZm9McWVnMXhVRllPdURh?=
 =?utf-8?B?SDlzVzM2SForWFp0d3l0UkhUWkpjcm1ZNDc2d2diRDM0aU91dmx2K1l4cG5G?=
 =?utf-8?B?Y1RsNCtTQS9lOWtleTZJNUJWZ0w4UkhBMUYzQkU2WmhxWnZnNVR2TGpvRW40?=
 =?utf-8?B?RHZYSTRhSVB0VnhneGlUTnF6NGlNRFJmaXBYOGNsWWNHdkh4WkdYZTQxakZN?=
 =?utf-8?B?MWFub0pUdDlNeStpR3RHMEpCdUhsZXByaHR1a1o4djRTdnhINmFxY2dONUNO?=
 =?utf-8?B?RVh4UGtxQWo1emVXR0V1TXVLR1FTaDR0eUdmWm1iR1V0L29qY1BoMFl4UTNR?=
 =?utf-8?B?UU5SVlR5YWNxZWZiR0hULzdmSXdOK2U2YUYybFA3L0JuNUFodndXRldibTRq?=
 =?utf-8?B?aStwUVVqekVPbXJGNERKdlc0TFJFQ2ZXejhZMi9uZFdvYmxQZTVaZU1XdUZp?=
 =?utf-8?B?QUNDUlhVMHl4dXVZQytBQkNCRXpJSHZoTERkSDl5REpHSVdXYjhselRIRmx1?=
 =?utf-8?B?azk2WTBHV0R6VVJ4NjRsYUdYOHlWUTNMK1JsQXhja0lSM1pkUTB5MjRPcWhD?=
 =?utf-8?B?RnVhUXBNaE1wZ3dPUHMxTWNyUCtqTklUWW53RFFkejJRd2tWdUR2UmVaRWhi?=
 =?utf-8?B?Yy9lZmc2Q2hONDBpc2JqbDB0U1hhV0dxSm1ybDdaTlg5MDhTUCtOdVBNQXJB?=
 =?utf-8?B?dktSU3AzdVFIVUhxUHZHd0RWYmZiYjJBOEpGSFhNVEp4cFJFK2w4R2x4UkZR?=
 =?utf-8?B?d0JuR0xGb1YwZEthMi9DZU5KYVdkT2VBSU5iWHhMY21pS1Z0ZGFSNnBFUXR1?=
 =?utf-8?B?bmhzQWFONE1NNklyZnVtUmxZdTVYZElZQjhjczhlbzlEaE55QVRBV2lHQjRV?=
 =?utf-8?B?WGFXajNGT1JLT1M0OHhpSWZwdGNoOXNaQWFiWjJSbEx5dm5xZjhjZWNBRmVG?=
 =?utf-8?B?Wi93Vnl2OWtQV1ZEQzJtMGZlYjVXdlNVdG80UlRydE5vd2NwelNRUWJPeUlC?=
 =?utf-8?B?bExjKysxRkt3SjRCSTNBY0J5ZTBZZjlGVFg5dnEwMzF6ZFhQaG1MdFpKcTN2?=
 =?utf-8?B?aE1takJzT0xxdzhDNS9sMW5YeXhXb09reE9QTTFLRDdyZURGcVhmOVUvMkFt?=
 =?utf-8?B?Sis5L3QrWmg4Tnk4L2xuWnpBTVpYZkVjVVJ0NkliN1kxZFppQXRGdjlJMW1m?=
 =?utf-8?B?RGNhdmY0Vk9uOHQ5Nk1leEpocEQycTFjWlpndk0wc1NYcmZkRXdIZzljSGxi?=
 =?utf-8?B?TGZBSi9ZQm10V0RzRkRsRnV0RjNhYkEzNWt3MFJVWTJLZmJQa0gvNUc2Rngv?=
 =?utf-8?B?b1VsM1hLOVppcjNWR2prdHJ1NXYzS2dvQU9lQzI3dEZyY0Y2SVQ3WkFxMUR0?=
 =?utf-8?B?VUVuWllqZDMrZ2tFcVZ6bzhYaEZ5MDFvcGFSM2tqQjU5OWFrQW9YR3Z3MjFC?=
 =?utf-8?B?TTc1MlJiN3RZTHZDaFlaN2ZTM1M3a3RiLzhoMm43am94TFlwdE1qTDdYd21n?=
 =?utf-8?B?STJUa3pGZ21ONGtCb1p2MDRjQUlDay9oSkpFaEN6czBUM0tmQ1c4QkhjL0p0?=
 =?utf-8?B?d3RKbEtZbDZwbVl6YkJwTXJpWitKckhzQXhPdllkbFkrRXlCM2FOVGI3bm13?=
 =?utf-8?B?YVFldk0zY0JjclVqd2xZa2U1d1FLc2JldmlDNDRSOUNUT3hIaGFQU2tYNUhT?=
 =?utf-8?B?SFpGMFdiVDJVY1M0b3AzeWtkSExsb3JkSHV5RlA4SU1SeWxtU1FVQmFpdXN1?=
 =?utf-8?B?OHZZU3drdXVCOFU0dUhVVzlkV2Jwd1FkalhOa2h6VkZvWWF1ZFJ5Z29rYUlW?=
 =?utf-8?B?a3d4WHhLMmR3NTMrSmZkUSszSEV0U2xscFlDeWY4cE1YSWdOOVFYUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ad4825bd-dc8b-44f0-ee24-08de4c7449b2
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 16:05:47.0623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b7V5hO6bYU2FIdx791jHASrpzPabauwJHZaKhf9EHmRQJrDcqpb5eTawWcMkKuLVTRx8Bo/B743KJk9rlvMi8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3515

On Mon, 5 Jan 2026 10:19:57 -0500
Tamir Duberstein <tamird@gmail.com> wrote:

> On Mon, Jan 5, 2026 at 9:27=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
> >
> > On Mon, 5 Jan 2026 06:02:35 -0500
> > Tamir Duberstein <tamird@gmail.com> wrote:
> > =20
> > > On Sun, Jan 4, 2026 at 9:18=E2=80=AFPM Gary Guo <gary@garyguo.net> wr=
ote: =20
> > > >
> > > > On Sun, 4 Jan 2026 18:44:43 -0500
> > > > Tamir Duberstein <tamird@gmail.com> wrote:
> > > > =20
> > > > > On Thu, Dec 11, 2025 at 2:29=E2=80=AFPM Gary Guo <gary@kernel.org=
> wrote: =20
> > > > > >
> > > > > > From: Gary Guo <gary@garyguo.net>
> > > > > >
> > > > > > `#[vtable]` is converted to use syn. This is more robust than t=
he
> > > > > > previous heuristic-based searching of defined methods and funct=
ions.
> > > > > >
> > > > > > When doing so, the trait and impl are split into two code paths=
 as the
> > > > > > types are distinct when parsed by `syn`.
> > > > > >
> > > > > > Signed-off-by: Gary Guo <gary@garyguo.net> =20
> > > > >
> > > > > Logic looks correct, but the duplication between handle_trait and
> > > > > handle_impl is unfortunate. I golfed on this a bit, see if you li=
ke
> > > > > it: https://github.com/tamird/linux/commit/8354c5a48769f5e1e52963=
d19ca57c31e5926b08. =20
> > > >
> > > > I very much prefer the code to be separate. The trait and impl *sho=
uld*
> > > > be different. It's just that they *look* similar.
> > > >
> > > > Defining
> > > >
> > > >         const HAS_FOO: bool =3D false;
> > > >
> > > > in trait is defining a new contract while providing *default* value=
,
> > > > while
> > > >
> > > >         const HAS_FOO: bool =3D true;
> > > >
> > > > is implementing such contract with a specific value. They look the
> > > > same but I think the way `syn` treats them differently is justified=
. =20
> > >
> > > Yes, the similarity is perhaps superficial, but the duplication in th=
e
> > > current patch goes a good bit further because all the surrounding
> > > ceremony is also duplicated. =20
> >
> > What do you mean? The only code that is really duplicated is the gather=
ing
> > of names from items (which have to be duplicate due to type difference
> > anyway, and they're still duplicate in your linked commit above. =20
>=20
> There's a bunch of boilerplate surrounding this code that is duplicated:
> - declaring `functions` and `consts
> - iterating over `functions`
> - computing the value of `gen_const_name`
> - checking if `gen_const_name` is already in `consts`
>=20
> These are of course mostly straightforward, but it is duplication
> nonetheless, and it is all removed in my commit linked above.

I am not convinced.

These are very light-weight lines and it's not like the duplication
contains heavy logic inside. In my opinion the `if` (or `match`) that is
involved in handling them differently but inside a same function is more
cognitive load than just duplicating them. It's much easier to have a
top-level if to split into two code-paths.

Plus, the reason for `gen_const_name` check is different for the code
paths:
- for trait, it's for handling `#[cfg]` functions which are allowed to
  repeat
- for impl, it's for allowing user override plus the `#[cfg]`.

With `syn`, arguable the `#[cfg]` should be handled just by propagating
the `#[cfg]` from function to constant.

(Actually, we don't need to iterate over user-defined constants in the
trait code path at all even without the cfg change. I'll remove it in v2)

Best,
Gary

>=20
> > =20
> > > =20
> > > >
> > > > I think the fact that existing code has a boolean and do different
> > > > things based on it is a good enough supporting reason to handle
> > > > different code path.
> > > >
> > > > For some new `vtable` features that I am working on would require q=
uite
> > > > different impl between the two. =20
> > >
> > > It seems unusual to justify current changes with future changes. =20
> >
> > I gave both reasons that why I think it should be distinct code path to=
day
> > and also why I prefer it to be it for the future. I did not justify the
> > current change with future changes. =20
>=20
> The today justification (the presence of a boolean) feels weak to me.
> It can be made an enum if that changes your position.

