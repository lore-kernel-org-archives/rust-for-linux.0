Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021132.outbound.protection.outlook.com [52.101.100.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFD2329367;
	Fri, 30 Jan 2026 14:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769783071; cv=fail; b=EdZER6EkMW0itU4kAbgmN7MqEF2PaLhwKGP6cj56OGa7nE7iiE3j12+dnuSyMptsbUmPNusSTa3d1bUJkY8srcs71Tou460+nDYJGoREOZr/VmEqlxnhZ7Ta+fxoxochpFz0q7QX4WcLoFXOdUIAFgxRyLzlGChry+0g103mDa4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769783071; c=relaxed/simple;
	bh=nny6MJbtIXfdlAL/ejuK/4X0YGrOSPrpBfhL5gFuv8M=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=XMEsF4bSUXT2G9v0ghBv+Xk1TrFoT0QW8rWGIWsV+GNZDYLI5JQTr/rLggDmXwAwEm+QrIEY6/CxNaKLckReLP7dlhFNYlwBN7Chnhsh19XeAMNt+n22xCb1aRVMoB2stxBCJyDa3+rtpPCPJ9Y50RpyiOSFA1joq0GWmAy66FQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=RZTHUhkv; arc=fail smtp.client-ip=52.101.100.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="RZTHUhkv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZvo3eKDqf1QivIFDtaoOTSMCPtsp3kOcKrhw59QDzkLul/IHdq4woi14QysHhqkU4klDAGh2pxSUmb/c08oetirYk4tgiZjpn0kJyP9pE3Wl6m92bZj5UJsOaRxOx7GRiKeTDr6GqberRnshcHy6Gy2I5SXaBwTV/tp5X5Ow81wFUkCY1wSTyaUoTi6xKoFQYCtP+Ua1QUhFmbCuKdVKxtF6pgDWlkNF18RoSkRwMx1UJMV3UAtwzrdy5fk7v26cac7IsbWL5iuamSheQkIMhhaXlv4Ye0VHJoNi1S6I0IIYPVT8SjQ8I4tB46Ex4TJEJWJ0HOPv3ijsA1Pp6ybVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVvRsYnwioOYlQBDwHo8gn4KnKtdBnwyX2x7wgdS38U=;
 b=OUuaexjf5fTGZg7HVMBkFclobACvBI1v83tWcDVc5EFZqgXhTp+HLztdjH9CfdhLfH0Y6qFUzhQVzQz1atOYwTeUm2mm0yz1k+gsWRnHt4lgguSIjz//t5Gy+hN7053yQAW1Gl3LIv1ghEF5Yuw/Qyvo5gbCj8BcsZreto0kC61eQTCctVtu8HdAlRI8GkAG8fpX2REBS0bVy0e9cehYK6pBcNGDnM1v8QMWnOU6UfJlpdWuMs8HttxRc4xc8SF1NiGjZQZYFeoKI9AlzLJxdhWi44V3q4xRbPgW1A3d2VYp0uFBIGa6GhqxW3KrzpePld4JpQD4oM4LZ3s7abf64A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVvRsYnwioOYlQBDwHo8gn4KnKtdBnwyX2x7wgdS38U=;
 b=RZTHUhkvmFt87QFvqlVqq4O2Ullez/2dvtDawWqZ9OsVVuULl2Q8lkLE3xW8Jd/ZKEUPxL8VH/jq+depwX2dG2fY8m4wlyBnCcRkdmbInhjjyMeN/Ne38NmbUd9Y+jPUHRa6BtnEz6Ff2XNe96/HTidwXTNf2HsHs5gS7uLcHsQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2901.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:c1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 14:24:27 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 14:24:27 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Jan 2026 14:24:26 +0000
Message-Id: <DG1ZQKV1CVM6.2HMY8Z8G7Y9UE@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Dave Ertman" <david.m.ertman@intel.com>, "Ira Weiny"
 <ira.weiny@intel.com>, "Leon Romanovsky" <leon@kernel.org>, "Arnd Bergmann"
 <arnd@arndb.de>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] samples: rust: remove imports available via prelude
From: "Gary Guo" <gary@garyguo.net>
To: "Dirk Behme" <dirk.behme@de.bosch.com>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260123172007.136873-1-gary@garyguo.net>
 <20260123172007.136873-4-gary@garyguo.net>
 <CANiq72kwRdYbs9L1hrX_0SdGHsycMi9fz6+wh+qGgWiOsFZZiQ@mail.gmail.com>
 <fb68b2d2-a5bd-4359-a0c5-019ef4060e7d@de.bosch.com>
In-Reply-To: <fb68b2d2-a5bd-4359-a0c5-019ef4060e7d@de.bosch.com>
X-ClientProxiedBy: LO4P265CA0152.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::15) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2901:EE_
X-MS-Office365-Filtering-Correlation-Id: 99f1ed78-2599-432d-797d-08de600b461c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bzlKRktoaHVhd0xDamU3d1U5Szh5SE5QRUhLcjdHVGFVMm4vYVRxYXVJc3ZI?=
 =?utf-8?B?MU5BZmtOZ1VrZ1hiaXQvS0hQM3VDM2EwTjZnbyt4a1hPUzlIcEVlTU93alNs?=
 =?utf-8?B?MVZZTnNzWkQ5KzRoeEVGY3BNTWxiNG5aYUhHcm9OYmwxUHYwbE5WMXREOFdO?=
 =?utf-8?B?SlQ2emxtb0ZIY0phbjdiL0d4Y0IrU3FXVC9vcXlrQUluV09KL29EQ3dnazRx?=
 =?utf-8?B?WXNkbFp2ZmlzS1R0VXN0SlEwUXpDeG9HaW8rbjBDYjlKelY0VHFVc1BheVNV?=
 =?utf-8?B?amdkQ1hEVUZ3SlBIQVh4RStiQzREQVlrbzA4SzNaSmpIbUJ4UFFyQ2xBR0J0?=
 =?utf-8?B?NmNtSUVQVXFrOVM5ZGtDeDdHWkEwaGY2NWIwWTB0Y3Q5V211VlNCaXZUSFdn?=
 =?utf-8?B?clFpaDcxMTQzcWlXWVhoTGdLS0cvY2VUQ2JpTGx5VmxlQ3FNRTljMFNWS2xy?=
 =?utf-8?B?QVYwNmNLYXM2OWlrYi9BZm1uZVZsT1Q3ZU53Mm92MUc1TWxhZEpvR2tKNkpi?=
 =?utf-8?B?VE5KeXBTSGVuYnZCYmwzWndhNXFIK1ZCL1R0L3pBYlIwT3U4dEdnRVRGdHB3?=
 =?utf-8?B?N1h0d0I5K1FRYlM5VTNzK2szdi9nVmtuSEpsbCt6dktzMCsvVytvbVNqOXkr?=
 =?utf-8?B?M1ZuYWh5QVgvMllpNFV3akx4L05tWW50anRrRkFnNHZHRUJKekNJMjRRQm55?=
 =?utf-8?B?SjFYOGtQSlB2Y3pKaGU5cTNyV0ZrdHpVazhKQmpRMmRmSkZKZ0tTNGlIdDds?=
 =?utf-8?B?SHpsakVQL2ExWDUrQWVHSzlHdlNEakNRL05tdEhPa1hTZlppeHhZdFRpWFor?=
 =?utf-8?B?eS8rUmNOOSsxOFJWRW0zK0NxTFova0R4VTZ4UDVPSGdDUW9ZUWRvOW5oNlox?=
 =?utf-8?B?SmtDOXBQQWppZkUvMXFmYzlMWHd6T0xPRFpVaE5wb0ZZeExrMktmeGFLZzYz?=
 =?utf-8?B?dFB4amRyY2VCQW5KNThpWFR1WXBXL3NSbG5VZVBTbjhRdDNTUEJ3NG1LNlg2?=
 =?utf-8?B?cVpmYmt3enRnSE03cy95WHAzUTNDUzIxRWRmZzlBTzZNYzA1L2IrdmhwL1du?=
 =?utf-8?B?ajV3Z3Z6WXRXMFZlOE5qRk5RN0JmVURJWVpZMTV2RXBTODZZNHFUN3dJaFVX?=
 =?utf-8?B?QXVWaVBIVERkNE83NGRNK1NPdGdPbWFDK3V5ZGN4VXlScHUwYTdFbHNsK2xs?=
 =?utf-8?B?Ym1CTXd2bTljTlJHVjRDMnVvcitZU1NiWERTK1NzZ2xPS3FHSlhuMHl0Z21M?=
 =?utf-8?B?eVF3dWwxS2l6WFRjNlFFemZ4QW8wZmgrSm1hKy82THdiMjVsSXZBdEpzZ2Er?=
 =?utf-8?B?eFBDYitSNmRjaGVEYmpwVEJ5TFovT29Sa0VWRzQyNjlnRUsyNW1WQ01ST0dm?=
 =?utf-8?B?dEM4ZENMVlZHUTFsLzRTbkg4WkEwWGJCb1lCRDNsRCtIUkpPMkdHQzlXV2E5?=
 =?utf-8?B?OVE4b0Q0aU44SFEzaElOaUVZTFpSdVg1UGVMRVdUTkxWbE5hNTQrN05mcmpU?=
 =?utf-8?B?UkhseWlJQTNMU05sWjlISDBKYjFzRWxBM2tUaEFBU29FN3QzU1JtVTJHbzN6?=
 =?utf-8?B?V1FHK1Q5cjYrSW95eTJoODNBVG8vd2N1TlNFR2F5Rjhic20wNTVNSFluN1FP?=
 =?utf-8?B?alhBYzR6cHJIaTB6akpTWG5OckJuV0pqdis2Y1FwV0hsQTN1UWUrdWgyeXMw?=
 =?utf-8?B?MGxXdEF3S3ZRR2l6V1Nka2NGVGtQeUw2dzk1QTNvUlhPL01nQkQ1VTFaQ0hp?=
 =?utf-8?B?VUQ2aXl5RTA4Rk04TG1zQXBRWFZSNG5vbmw5RWg0UnFaWUY1R2JBRWFFdStT?=
 =?utf-8?B?SmU5ZHB0cjZyQ0FoNTIwNnZDQk1kUjFWU0xsSFc2TmxXZ2RtTDU3SDE3YXhW?=
 =?utf-8?B?ZFB3NStCUGZlV0dFWVBzTFQrMndrQTFKbnREcTY4SktjYzBjeGpaN3ZsSFYr?=
 =?utf-8?B?UndSdTFoSWNLL1VPZFYwbTU3YjVkVFhrNzg1MGdZenk5Q3NTbDFrYWI4a0Nq?=
 =?utf-8?B?emM1S3dFa3Z1N0M5d21DSkZmK2FaenZGUys3TmhzVzNEYmJhMUFQWWRlckJL?=
 =?utf-8?B?RGxzbjZIS3hqVjJGNUNDWHJJTHFEZ2w2dXJHWmpMYU1jdFg3OGhrWEs5S1c1?=
 =?utf-8?Q?arCU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0xueUxLSWxGQzJYSmgxdXFyQ3RUSCsyYkdFSzUyajlnVjNoeC9IbjNXdUcr?=
 =?utf-8?B?ZnJmTzBUaGxkMitBbEQ1QXNMZkNEYU5RS0NObGxoUTVKak42Tmd5SUl6d2ZI?=
 =?utf-8?B?aE8rQk5yRWRiTXFldm1KTFJDTFhoT3N0NzM3NmV3UGpKL3I5Um02TVM5em9B?=
 =?utf-8?B?NmZJS3pxbEhOTE50M1lIY1c2Q1ZBMExHOGZkdzBadlp0dHY2VjgrSWpHUzYx?=
 =?utf-8?B?MSt2UUhmeGpnWE1qUXkvVGFnWXJLbnV1NExOa3AzaHd4RE0rcFAvdS81emQr?=
 =?utf-8?B?N3ZqWkZESGZxNkNTSFhUT096dzJGREF2alZ6QnBMVEV5SzFLYkFXSG1GUHJF?=
 =?utf-8?B?Y2p0RjFjTVQ0VFVlWElmTTF4R0xQdms5VWszcVRtLy9xS3ZpNGZadGxLTFF3?=
 =?utf-8?B?a3lrMnNxWGdFUVN1OE9SYWNxU0h3UFpRTEhIUFkwemZjVm93ams3RHJBbDQ0?=
 =?utf-8?B?UDFNOVR2MDBwV2ZDdVRvc0twd3hZUk52RnFjM0lnQ25PdHpqb1RSNDZOSXBQ?=
 =?utf-8?B?VG1CbWhQaHI5OWkxRGM5UEZUYk1pOHhLaVZ3c1ZndDF3MmFRQktjb3dUcDJG?=
 =?utf-8?B?M2FpcmFjWDRDL2JTYUJXelFZV1VBL21VVGlDU0dKTUowYVI5YUxPbGxmMUo2?=
 =?utf-8?B?bGVHOEwwZzA0TzFGQ3NGOVROTHZpOCtlT2R4cmhCbDlDSGRtajVsWVRScmVs?=
 =?utf-8?B?L0d3VGlJTWFqVldLKzUyTWVXOERwRndWblBONSs0dXU0NkQxK0FSdThFUnlS?=
 =?utf-8?B?cytWVWtSV2ltTkdSR01MZHdMblFpWTZQL1B5UGZKU0tUMGQzZVdOUWIxUnBJ?=
 =?utf-8?B?Qksvd3haRG1xanpwd1hnU2VONTl3UUJaNmI1Umd2akVPV1lmZkU3OGFoUzJp?=
 =?utf-8?B?aUtFY2JVRVBQYjk5dmJwZVE2bTBGYytvQ3NSeFV5QWovamw4OGtHSXpiNVN2?=
 =?utf-8?B?aTVRUGNBN3VTOVp6WkEzRS9odmt2MllVc3h2QlJUVFl6a0VBaHRlZ2JONFFa?=
 =?utf-8?B?SGpDMTlaQjRKN1RJanZndVB3b3VnTVM2YlVTVXdvbm9NOG5CditUZ29oSksy?=
 =?utf-8?B?UUxBRHNENlNDTXA1MjB3aU4wZHhBOWM3R3oyaVJLcVpjdkRFU2NOZVVHdGxx?=
 =?utf-8?B?TmFJcXNYRzdXNkVMa1QrNG1Rbks2OCt4Zm16ejNFdUk5OTRlWitDeXZoL1ln?=
 =?utf-8?B?R3MySjdYRTVqRVhPNzR4dGVMR2piSWd1cS9uK01yUUNhMEdNYUpEY0d6Zm4y?=
 =?utf-8?B?ckhpY0N2Y2owcEJUWStvVTc4WmNJNkk1d2d0OHdydDVLd3Nia3lxZlBYVFNC?=
 =?utf-8?B?SEtVZnVpUTRYZXh4VGpoQ2NNOENwMFZlRG9EeVZjRXdpQVY2OVhTem1PU1Jt?=
 =?utf-8?B?RlBNNllTcU82aVRVN1MraW5MS3d1Ti9nTThDTGRVTkJrSW0vYkxpM1FVdU85?=
 =?utf-8?B?SHQ0OU5xRWFZQ1pjbDdKOGF3NFlObEhkMERGb0NnTWN0TSthUkR0MitDL2Fj?=
 =?utf-8?B?YXloaG5VMGNrWUZyTDV4UDZqckRyTlErbEIwRkhqS1NFbENxUzk2Z29aeTZL?=
 =?utf-8?B?YmpkMGM5UUw4UTdTcDB0d0RpVWR5WEZmZmpHZDZndTRQelhWb3V2L0VkcEZS?=
 =?utf-8?B?ZlV1cmtHVWl1VWVENzR5ODZiM2NNZVRtSGg1SVFXQXJqMWxvcldRNHoyR0hH?=
 =?utf-8?B?QjZHcDdSb1hrdndnalZMZHl3M3pENmxmR29EOHBWWTlvTTRMZ2p3dmNPdThG?=
 =?utf-8?B?ZjRaaGJ4V2NiZXY1SjJmSFI5TnBCUTZGWHFTaHQzNWxlV1V6M3NRL3lvai84?=
 =?utf-8?B?YlR5a2QxenJyeldnL1ZiQnBFVGxjSGk5eW8rend4ZGdzVEs1enB6MGhYei82?=
 =?utf-8?B?SUJKdzYyb2toWmtkV0ErZGZUTmh3R2EyTjR2VTg5QzR1WFR6YzB3azBMRHNn?=
 =?utf-8?B?eTd6V3krNjUybWRvWU5yRlpvUHMwM2FhcDh2WHVrRkwyNUQxYkhlSS90Vmp2?=
 =?utf-8?B?a3NTdTArbUMyMExpSlZYc08xWUlxTENFNzUrN0VNY3M0bllJTld0c3JraE9Y?=
 =?utf-8?B?bDA5NU5obFhVemVvYnc0dU1rOTdmSitzUjFZZmp4WW5waTkxTjJqVVFXMzRD?=
 =?utf-8?B?YjNXL0JGZlRxOGRSV2pYY013NDIxckdxNnJ4MGlqQlVFVTJIL3ZqQ3lWc1dp?=
 =?utf-8?B?SUVzZVRaVHduVGVlQ0JLZmp3ckRlMXM0YUs1OGhVY2F1WXQxR1o0anNlS0Ez?=
 =?utf-8?B?TzM4U2Rqa29sb1YzcElpYjIzdWhzMjRVeFpNV2M5MHhtZjJjWEp6dTVKUXRW?=
 =?utf-8?Q?oLmUiUOhuB8pL06AVN?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f1ed78-2599-432d-797d-08de600b461c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 14:24:27.1206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQQaA+Jz7Cm+i/rR6NTlrih69EpwKhRQBr3/qSyf9g341fycbMozovD3kjXF3yZM3bBGuxpqWf3W9JzuTyAefQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2901

On Fri Jan 30, 2026 at 12:45 PM GMT, Dirk Behme wrote:
> On 27/01/2026 12:10, Miguel Ojeda wrote:
>> On Sat, Jan 24, 2026 at 6:08=E2=80=AFAM Gary Guo <gary@garyguo.net> wrot=
e:
>>>
>>> These imports are already in scope by importing `kernel::prelude::*` an=
d
>>> does not need to be imported separately.
>>>
>>> Signed-off-by: Gary Guo <gary@garyguo.net>
>>=20
>> Applied (this one only) to `rust-next` -- thanks everyone!
>
> Having my klint setup running now (many thanks Gary!) on today's=20
> rust-next [1] I still get
>
> error: this item is available via prelude
>    --> samples/rust/rust_driver_auxiliary.rs:12:5
>     |
> 12 |     error::Error,
>     |     ^^^^^^^^^^^^
>     |
>     =3D help: import with `kernel::prelude::*` instead
>     =3D note: `-D klint::not-using-prelude` implied by `-D warnings`
>     =3D help: to override `-D warnings` add=20
> `#[allow(klint::not_using_prelude)]`
>
> error: aborting due to 1 previous error
>
> Somehow dropping this was not part of this patch. Not sure why ...

It was already dropped in
https://lore.kernel.org/rust-for-linux/20260105142123.95030-1-dakr@kernel.o=
rg/

Best,
Gary

>
> Best regards
>
> Dirk
>
> [1] HEAD is 08afcc38a64c ("Merge patch series "Add support for print=20
> exactly once"")

