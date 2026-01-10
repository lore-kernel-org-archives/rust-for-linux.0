Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020121.outbound.protection.outlook.com [52.101.196.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC472773FC;
	Sat, 10 Jan 2026 19:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768072743; cv=fail; b=V2MtKYDJ8N8J5Y0qTx2QEP7EnR5t88PFE/I3noifs74KhlxhrSsIgSJQWa6J0UqUocb4/+CEovM4CxlUCK/X/aKTgzzII6QI0MBkns1q4ZYTyXVutm1ZbpCzRNcXFnUuYfuKbV8/j0CqHvonHKnF8PbKREyyYeES1mZpE/dT6Jc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768072743; c=relaxed/simple;
	bh=e3MaDAhQkDcjKDnmK3N4bc6d5BZ2ELun/6GNyDsjAu0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=bPA0YkTmu0IwTIMu7krYpFrSbhF9XqAm8g7LYa5b5I/kpv2tSCsW7T2AHQHwFjdx9TTHb/8OyRTyLpWBIF+OBz82592PbkdRfltUlchE0YJU+E8H/Cbyg77mxhoasIAWo/Nw/O/e5AHb/yClk7yLaKkZJybRWAXTm7HnUc2kvhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=QXNn4MGb; arc=fail smtp.client-ip=52.101.196.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="QXNn4MGb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eHy4JMQmZ7r98xUmgwEEwQ0Llnyb9tlCEdFKRwutMLttDnB9oADok8GkObr9wpbZSA5xg3EBZqGfZh9k8FvSocQSgA3yMTe3TgVLqxkmZqaBAjZSNmi5K0i9M8jK4pkNFvsATx/c5dh/wDVazAKWbVY9bY8FIv2HW5dBOPzaB0M/cTxyPH5G2GSYXqoxeNnz1CQrH9f3e4Js2UtnyxJIro6aHK5NNboWwNfZ9iDhMFV2yxnp548wgWKVIkMRJACzzKxiozS3RyHIKSr8vBG95xCRQG37Y9S88gYhjUcZMoO8zRHaxpyfzusqNuXJFQPZq9I86CFbJ29dHfyZhveixg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIFrBs20r3t2yDKm8Hiw7ttaCOTPZ9ZunsfiHX54G2c=;
 b=rRNwY65Xn2BqlPo7pboL7zU/VDiW2cMNjdmDKojYVmb7QtgeJJssNvTFPF1BxrpDaZigMOsAOCEadfgiKOPGXIzndHRHMHZULPhxpCQci9JvnbZ3hZ9k0nwaHo9asLOA64ejY1P/2IoZIoRK5gJfPu4JHR8xAj3FX4X15i59w8VL5GBK+qjmxi11UCMdlxPO0Y2ffC+70neu3W8omoet7t6EBj8f2LAnHEGfJgSrrDCxM0av0tkiwf6Yc2h5fwjC+c+OG4yL4QxTqTJMI3fEq2ZDd5wmXpcNHLP8pvxGc1wXcylruZxyg8a8m8CLYRckeaXxgQCnFFcUO2m3nGRUew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIFrBs20r3t2yDKm8Hiw7ttaCOTPZ9ZunsfiHX54G2c=;
 b=QXNn4MGbhFzlNBICn0XoSHYk7k4oSsDwnEqK9i2rLm/Rfz751Ajna3uuSbdtIZ1Pc08BFH5ThaSgJHmDdaJqiGOzkacUqjnNzXDctIEtAkjsoWCAbJanUMMJ+sR+0vFGhNFSJVLb1dOy77EZsGjcJm2QI0R5L4jISaI0/XZSga8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6518.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2cf::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Sat, 10 Jan
 2026 19:18:58 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.005; Sat, 10 Jan 2026
 19:18:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 10 Jan 2026 19:18:57 +0000
Message-Id: <DFL5H6I370E3.6M3D9QY4I1JA@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 06/12] rust: pin-init: rewrite `#[pin_data]` using `syn`
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Fiona Behrens" <me@Kloenk.dev>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Alban Kurti" <kurti@invicto.ai>
X-Mailer: aerc 0.21.0
References: <20260108135127.3153925-1-lossin@kernel.org>
 <20260108135127.3153925-7-lossin@kernel.org>
 <DFK2IZSN3G5Y.2ESC7WN213SYD@garyguo.net>
 <DFK7GA22REIQ.1YSKLW77KQAWH@kernel.org>
 <DFK7M3CCUXLM.33VAXRHV6U4W0@garyguo.net>
 <DFL248YSG9CS.GQNSONYLIDWQ@kernel.org>
In-Reply-To: <DFL248YSG9CS.GQNSONYLIDWQ@kernel.org>
X-ClientProxiedBy: LO4P123CA0476.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6518:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b89aeef-07be-4599-5bdf-08de507d1ab5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|366016|921020|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WGZITE9pVTVubHUrQ1RlaVJzdm1Rc0FaZVNmRUtzazVtVkc0bXNxMlVEc0JG?=
 =?utf-8?B?dnJ6TjlVY2VmQ005YS9RS3UwcklBK0g5eGRQeUpBUEwvWmlCTElMSDhYL1hj?=
 =?utf-8?B?a1RiSGhHdU5obW1WS0ZBd3JMemhland0d1ZQUXM3UWxjN3lCMUlQbktsWUZN?=
 =?utf-8?B?WXF0TytFckhVeUhFcjd0WWdPMzQrdGJtQkpkUUNKbk5vVVFRcE5ZWnljQisx?=
 =?utf-8?B?UnJzeGdTalhUcng1OWpWMHRTNmlxaU9zakhqRzExSEdQbVVKNG9BQ2pXbkZN?=
 =?utf-8?B?a1ZLdG9GSEVVRFhveFM4Z1hhcnlrblp2b2M1c1N4TEc1YXpIM09VeEQwNVZn?=
 =?utf-8?B?WVUxRGNRL3lhNnU3QWRtM3g5c1hyZ0Uxc21scDFSNzJYODlEZTZGQmg4dmdH?=
 =?utf-8?B?bVMrTTdFMUVTQXFCeEtTUXgwL2xxVjFLeWkvVktSWGFFYjZLYnk3V3RQZFM0?=
 =?utf-8?B?UnhtOGtDMDZlMUFoa0tLUlRLam5oV05VQ2hyWThRWWNoaHRSRURJQ3RmRWVF?=
 =?utf-8?B?ZXJOUElJMFZlcHhwelpZRVV6T1Vyd2RKeVVKR004WU1DcVJhM2JacStMMGVo?=
 =?utf-8?B?K1psekVjUitOM2l6OUNjYVZCYUdyUHVpa1RYTnEyWG1sd0NvSDVLbU5FZ2Mw?=
 =?utf-8?B?TllqTWVVTFJiVGlNRnFIYTFxZEZpZTc2UVBieFU3Q2lEdjg1WU1lQ1dWT1dQ?=
 =?utf-8?B?amtxZXFoMHBpdXhTYVI2bTBxczZ1RHhtVk9SUEZCb3lwWmpucmtpcSs4Z2hZ?=
 =?utf-8?B?NnBic2lpK2NZYmxqZHJwY2lFbXJ2eWJjZDRHb3RxaE9zbmh6cXJuTStJOTQz?=
 =?utf-8?B?RnBHSGFHVWozb0pOT0tWMnl2UUNQR3NLcWpwem94S1VESUhteUdOU0U4UCtE?=
 =?utf-8?B?bzZLZXRYcGxrbjZaN056aDZUY2dWYUFuSDVvZ0lTcHlYMWorTDFVVUNKVVVv?=
 =?utf-8?B?cjA3c0Z1eTJNdE9ocEZDeWdiMmMzSzAwSUhSbUdoS2Z5UUVObS9TbUpVa0w2?=
 =?utf-8?B?aFF1UkxMZis5VWkzcFRUVWV5SkFVdWhJeGNDQTFLbDFzWitLWkpmbDY3V2oy?=
 =?utf-8?B?YncxSysxZVlRNXNTRW9JZ1FwOURIdE5DbzNiM091K1BmRVNFOUxhTUlBRjl4?=
 =?utf-8?B?em5hSFFNejZYUjMra2FDWVU1S1FpVklLM0lYMVR4Q05aWlM2VFZwNW9XS3JB?=
 =?utf-8?B?YnlJZ1ozYVNhVVRlckR0NG0wM1BibDJSdFdFV2JSMmJwN1NmNFVST2lzMmcr?=
 =?utf-8?B?aU9iaWRiZzlSTnc3MHFieDhUL0ZNK2VCQ3hBYzMvdXZxVDN3aTJwUmtCZmJZ?=
 =?utf-8?B?cGhSWTVUbG95YnJzUkVlMFRBeUVrQ21EK3hHMlNMdS9VVm1ZNjk2TTRway9E?=
 =?utf-8?B?VlZoUVRXcXBKRzA0OUd5SkN4VWVVTmZLbTFpVE1SZlhtTXFaZnRKbnRta3BB?=
 =?utf-8?B?aDRqUk1JQkIzRG0xd3FtZ2hmRFY0NmNxL29NQzlPc0pySHlBYWN4bllpdHVK?=
 =?utf-8?B?Sm55aE5wOG1RdFJXT3JraXY2Zm9GaFdEcFg3STQzMUMxb1hyS1NnYlIvQkVW?=
 =?utf-8?B?ck9UbWNtNXNDL0ZRUSs0RVhLN2xNZnVPN1UvNU1iKzB3M0daajFDcUVLMzhE?=
 =?utf-8?B?S0R4Qmc3QmFXQnJzRUgxRU9nZzVIOGRzeXBORk9VRDhxODQ4OERuc3R4a212?=
 =?utf-8?B?cE80UjNubC91OXBwb1FDcGx1TyttaTcwMEdlUXA4YnJENHdvUTh1Y1FrSTc4?=
 =?utf-8?B?Q2JoS2IrQmc5dVlLMGRqUm80NUNBZlBzb3p4RElRR3JTeWEzM29CdE5qSUtG?=
 =?utf-8?B?K3pJWGQvSmZOeHpRbC9McDRlN2I2RWdlbDE1aHQrNngxVXFURVIrOFZoZXdO?=
 =?utf-8?B?bFB2WGFuWXlLQXNsRTduL3FST0NNbkNlQWlDMUhXdlZPRzQvS2ZrbENEQnJK?=
 =?utf-8?B?TU5kbWF1bDlzOHQ3clR0NS8wUlZvdnZ3VncrRkxVVWRHUGNnT2lLcTIycElo?=
 =?utf-8?B?Z3I5cVRhZTVXQkc0SmthWHl2aWZmamVEcnZLRkpuNTMycWVVY3ZhMGQvUzZL?=
 =?utf-8?Q?lYTWlP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(921020)(7142099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0RqNktpcHNWWkI1VHJFbjdBSFhUTTNLWWVKeUp4RS9iZ29Nckh0RmhpU1g3?=
 =?utf-8?B?RUFKcHhJTy9yVGZaYmgxRHZwK2lWRVpGNzZUK21DU0dteEpYN2F5d3lDaDFT?=
 =?utf-8?B?WDc1L3ByRTNzMTBSL2lRSkJIUUViMTFCcDRJbU44bFZWejVFT1psOU1XclpH?=
 =?utf-8?B?NXJ3RkpCL0ZOOTNwNUhBTllFdWRxdWdYWTdub1cvUjNVL0JBZ0xWbGFpTXhR?=
 =?utf-8?B?WDBGWXpqcnpNNEJ3KzlQVURTUVpmeE1MZ0FHek82SndyRWsrWGplaVJRZFJv?=
 =?utf-8?B?aXZqUTBwNWVRVGI0NlFERkdSYjM2VDdBMFd6NFMySFFaSkRxN2dLbTA4czVl?=
 =?utf-8?B?enRNZVlkRG5CbjIyUU5rNXY0Z3I2cE1udHRXVi9Rai96NjZJbFJRa2M5bUk4?=
 =?utf-8?B?S2pBOURkSGUrRnUzN0pBTWdvb0pCWW95ZFAxbDlCSGNzejlaanNwSm9xMzhj?=
 =?utf-8?B?d3lBS2pQVjJIM2N0U0NRZVFUM3hhS0M5SjN6alh1QXFCQ2VOSGZac0pSM0Rp?=
 =?utf-8?B?RjNCOWVXck1jNG54T1E5UStQa1RnZk5HcHNXU1VPTEsrRWZZMWQrRS8yMHVZ?=
 =?utf-8?B?L1lhRWdHRjc3MERZZzh5Vm14RFZvZUFjRkw2Y2NZMmhxWE10bjYxMzBGYkFJ?=
 =?utf-8?B?TjVvLzQxY256azg4eHNIZFMweFRwbHMwSCs5RzB2VFF6eFJTblBVaW1BODMv?=
 =?utf-8?B?bUZOQXlyTzVEZ2pDMUxGaXVwQ0UzYmg1ajJ0UzRqcERzT0FtZ0FRZTVXVjRW?=
 =?utf-8?B?NUkwS2hkMHJIaVdzRHJmRjA5T1N6NlplcmY0WFljWURENGMveWZBVmZyN2xH?=
 =?utf-8?B?SVJnZE1JUUJ3c1VXYlBvNERwendQVnJrUWZ6Wno0cjRlYnJobytGbTBITGlH?=
 =?utf-8?B?NERFWTgrNnZXLzZmQ0ZxV0xkZzFkT1ZzeFZxTWVOb0gxWEwrcjVYQk9kMjQr?=
 =?utf-8?B?REVZNVpoRWdaemNLbjZvNTdKSjNKdFRnSUFuQVpIdTVpekw0VG5NVURMUTdx?=
 =?utf-8?B?YmR3dTA5YkdNazlSSkdvdG03cEJIbEt3U1U5V1hnamZmcnlsZkJFNDdDZ3F6?=
 =?utf-8?B?Z2tpUHU0YzVVL3I0OW9tQmdTWm5wSHBlZEdJeTRPeHhkUFU5Zlo1dmJNMEU0?=
 =?utf-8?B?UXZ1akhsa3BuZWFRMHpNZXY3a3A4Qlo1cWxPdlFHZUZxeFlLRnVLK2F4M1Jl?=
 =?utf-8?B?REIwZGtFOERzbVZwdFNwQitURzNETTcwVFNleEJqUU95L1B0S05PU25QVWt3?=
 =?utf-8?B?SWVJbzZRQVEvbjR5Q2FvRVFQWERCSzJYcnAzSDVpNHhiT2pKMk1HNy9VUCtO?=
 =?utf-8?B?eXZ2WENYUXZaTjlVeUpRVm90VGVuQ1pHdjFBSitWM2V4TStQNnNlY3VjVWxE?=
 =?utf-8?B?OUNIUFBXWjZKdFp0bGlqb3pab050L0RKSWRtZi9yNmhadkFIejI4WXhKSXdD?=
 =?utf-8?B?YnZOcWJrRVJFZW1LWFZYajgvYkNyQUZXcTU2bGtSVjlDeVdIRmVpeGdlNHpk?=
 =?utf-8?B?NUY3aG0xSDZHdkhKdEZPMjE5MW5BNDNlZ2ZZYmE2TFNuV0x2YXVkNnR4ZVN0?=
 =?utf-8?B?UmRrQmFUbWNOQUtocWt5ZmJYR3hGUkdvcGpoT1RDQjhzK2hkQnlQZXZ4Z3Bn?=
 =?utf-8?B?VDhENTBLc3ZGek1wY0Q3c2V1UU95TXRwbjlkdS92cXlGekw5SnlhUFFBMW1o?=
 =?utf-8?B?a1pVS2xma0tDVjZFL0RMR2JyVkttclpEL2pJWHdVa3JzYXRoeWQ5cU4wak93?=
 =?utf-8?B?bVVGSk90RjB1QTFabXplUXFDZVo3VmRuUVlvbmxtRzdsSmwwUnllOGg2NGc3?=
 =?utf-8?B?aE41aCs0R0xNU2R3Ym5YaVg0SFRPSjg0bk1oTndTVzkwbE90V2toYy9tRzFF?=
 =?utf-8?B?dWJ2OHpjK3VtR0RCcmZIRnpPTnMvVHhLZm5oL0FCd0ZvaEJJUlpDSjJ1U1dO?=
 =?utf-8?B?YndhcWo5NjRBZFZnSENtQWc0bFJxMzFCcUlQWUM1Q1Y1SlV0c3dTMjY3RXk0?=
 =?utf-8?B?dUZaaERvYUwwd0E5QUx2eEd5Qk96NHNiVTFOVEdtN21yYjU0MUJlbWQzbWw5?=
 =?utf-8?B?R0dOSyt1RXFUaTRMOWg3dVpjY2Z4TW1BclVaZVBTVGF5UkRqeDRwOVVReVVR?=
 =?utf-8?B?cDdxOVB5c0gzV0ROYjIzSWZSNHFDeitIMU8wOThXakJ1MGFFSThrd1VGOXZF?=
 =?utf-8?B?M0RpTkNCZHhlVS9mN0VzQ2oyZnJzUEpBY3hreC9LWkprNHpxaWFweURFaHNh?=
 =?utf-8?B?dVh3eHZIVWFXK0liN3NOVzlzNFV0bjlJNXUzczdCQUd4dXM1THlScitCcUwr?=
 =?utf-8?B?OG9SckxSaUtkLytOc250UXdTMVA0blN4OG9lalJuamZ5clFVazN2QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b89aeef-07be-4599-5bdf-08de507d1ab5
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2026 19:18:58.3333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AzXjkaMVDDGK+3g4FV4Zh/WKhoSBLnt3LdELzQhe3KthLuGJ3oCBaKQQTyVGPfJ8ozazFyLjaIilYGL2tKTCpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6518

On Sat Jan 10, 2026 at 4:41 PM GMT, Benno Lossin wrote:
> On Fri Jan 9, 2026 at 5:46 PM CET, Gary Guo wrote:
>> On Fri Jan 9, 2026 at 4:39 PM GMT, Benno Lossin wrote:
>>> On Fri Jan 9, 2026 at 1:47 PM CET, Gary Guo wrote:
>>>> On Thu Jan 8, 2026 at 1:50 PM GMT, Benno Lossin wrote:
>>>>> +fn strip_pin_annotations(struct_: &mut syn::ItemStruct) {
>>>>> +    for field in &mut struct_.fields {
>>>>> +        field.attrs.retain(|a| !a.path().is_ident("pin"));
>>>>> +    }
>>>>> +}
>>>>
>>>> Multiple places have similar things for stripping annotations and chec=
king if
>>>> structurally pinned. Would it make sense to do this at the very beginn=
ing, and
>>>> build a `HashSet` of structurally pinned fields, and use that as canon=
ical
>>>> source for all generate_ functions?
>>>
>>> There is https://github.com/Rust-for-Linux/pin-init/pull/94, and I don'=
t
>>> want to take away their work. I'll contact them and see if we can fold
>>> it into this commit/series.
>>
>> I don't think that's the same? I am proposing remove `#[pin]` and build =
a set at
>> the very beginning of `fn pin_data` and just use that set. Which is not =
what the
>> reference PR does.
>
> Oh yeah you're right. But `Field` doesn't implement `Hash`, so we sadly
> can't create a set of pinned fields. I'll just create a Vec with a bool
> and pass that around.

I was imagining just using `Ident` but I guess `cfg` is part of that too...=
 Or
maybe just use numeric index inside `struct_.fields`.

Best,
Gary

