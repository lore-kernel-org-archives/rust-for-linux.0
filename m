Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022079.outbound.protection.outlook.com [52.101.101.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67712EBDD9;
	Mon, 19 Jan 2026 13:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768828086; cv=fail; b=U/6d9ztO++qHngTvcMDovys7Eo6AKDtPInOReppdDoX8pKwOR+U23i+TCWRPpY57lt1hFq6PEskngKGKKuKYMGI5XpHHOQheCnZ2KxjG7IT+dLWC+O9r6kEXryq5Hx9dwtqFIZswXGvQo9Fn5IEWVWuX31iQKtSaY7reUfIZly8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768828086; c=relaxed/simple;
	bh=2GUQxunN+I4yfC27sQ1Xhmy9P0xMnTboEuizkrQ2f4c=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=U63Z4OOLNIUrBe4bp5ZIzA9ndd5RlUe0AA/dNSJNT47eMCnQiLdJHhU1PiAPtRKPZ230E3mNEXVljkUksuwkHKeXHWSeSwFSGqaRdrSuwKMqKI0Z6zYU2M4E5frP41xuaGC58JYG1GPnu/V/PL8SKydfL6N55UgoWZ59v4gGxUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=VT2CMODF; arc=fail smtp.client-ip=52.101.101.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="VT2CMODF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dVWFhEZrfQtORZ/C6i89WirHR79hCuLC7RIfNoC3peEu7Zx+0FRSw88Euqy/qoM7eANtVEBZCz4X1+aqhW4RPwwKoRd4hvyBvo79eIycpoaEPUEshGHjQFy83iF3zZYvGKkQ9LD0iCD5WEQhv/9AO6h5UDxDIEdbPU4AnJ7U7Hrofl4VBbZQYgTJaUXccdijMWD5YV3/KhZ77DYKtv7WVbBIbaklYX9TNm9p4izQgo5e27G5y5jTA+4e55V21cqbJVGZhG0FYP/BBu1WeGlxZGSnS1Cho+/0I6z18FOkmnkaFH5h8DrGYs0cnBesll5LoJXJSc8HdkYwxXKr+IIuow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8WpKjXaPl2g7UGjLRT20SH7WXsQ+f5WykiZsB7nsxk=;
 b=FNHZMD9oR4xfvDXWPRP+AmlwyLiNfcAihWhZHUWV0kwzwI98sp9yDyzbg8ZGdF6SCCf+h5tcIe5t/rg1XsKX7s4nO2Zp4660aHpf4CNSH1nxPup2Pg0Zh8A55qmg+2blkpUvu05I1Ks6OnkkktD0CKsSOzHQB0UP0YQQHTeWXv40K47WADfETHcgsL5KeeRDjlWNaEkutINsyJimzun/YlpUpP5wVPzR3sVczbEnPuHZSPil8J80Fj+HDCwtFQU/uetCOl3gWGzskvhtU8EptaibG0uatw3anuH/zvclPAvfnz8U1n6auhZn2PUxXUY6HFZ/pkSxbEVEn0b1fU99NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8WpKjXaPl2g7UGjLRT20SH7WXsQ+f5WykiZsB7nsxk=;
 b=VT2CMODFmymVBq5/KjLlEwQaB3T+S5DD+ZKAWXgYrAVf9QaPyJFmN6NOM1Q8PydOZIwENS10FydQV2cw+4uDx5SqoX+MfeZiLyV+Ct57zjQmvWi4R44t+cmg/p75ZJX9yZQEUpUwLDkvIPNuSn8k6Cvi2Y0DiYwlFGt8LyyzDFU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6164.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:24d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 13:07:59 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 13:07:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 13:07:58 +0000
Message-Id: <DFSL81HEHYU6.8E3YYOXNV5C9@garyguo.net>
Cc: <aliceryhl@google.com>, <anna-maria@linutronix.de>,
 <bjorn3_gh@protonmail.com>, <boqun.feng@gmail.com>, <dakr@kernel.org>,
 <frederic@kernel.org>, <gary@garyguo.net>, <jstultz@google.com>,
 <lossin@kernel.org>, <lyude@redhat.com>, <sboyd@kernel.org>,
 <tglx@linutronix.de>, <tmgross@umich.edu>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v1] rust: hrtimer: Restrict expires() to safe contexts
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>, <ojeda@kernel.org>
X-Mailer: aerc 0.21.0
References: <M2M7QTmzyv0cuTcfmp8k-pHEgTa6pOlfONQW596m3-nM_3-fQoakLTxJy7SthiIlT_5I-07GG9On36gsydLT7g==@protonmail.internalid> <20260110115838.3109895-1-fujita.tomonori@gmail.com> <877btdpyz2.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <877btdpyz2.fsf@t14s.mail-host-address-is-not-set>
X-ClientProxiedBy: LO4P265CA0146.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6164:EE_
X-MS-Office365-Filtering-Correlation-Id: b88d0b2c-c818-49d9-0f65-08de575bc514
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dTVOL1AzZndzSVVGLzhobVZuSkgvU0pOeTdkRG1DOWNUQnlYUytnWFRuaFlT?=
 =?utf-8?B?L096UmQxZkNyZzNBc3dmNjZNbXdQRGVuSTNGODhrSHdxSjNjUFI1emdvdHFY?=
 =?utf-8?B?RG82Smp1bVJxWkNDRGJmclJ3Z1ZRSG1aS3c2dzYycTBOM2RIdkJmWHNNcEV6?=
 =?utf-8?B?K29WVWFpb3RER0hRYjIvMkw1WXBMMmlkY0QzRXFuZjdVUE5xYWRUK2tOV2JC?=
 =?utf-8?B?cnVlT3JPaFhyVGtjTGk2OWNVWENHMG1iVVU5L0lSMEViYVBneVBuMWVvdEpF?=
 =?utf-8?B?Z3pWWFFBeGhqVlAwYWRBQ2JzOU53UC9hQUYrMU5oMmZPSGQxOFN3d0FMdXlX?=
 =?utf-8?B?L0xGOVpldytFblNhcjdIRmUyWGdhQVRwYjlaOCttNnpLNlRPNk0wdUZ1aVdJ?=
 =?utf-8?B?eU4xeTRVVm1tMHJDdVVKRUh5SmVWSTRvTWZNblE4cG5Ud2JKWXcrRTJvRFpk?=
 =?utf-8?B?akliVnVIRFZ3Mkgyd0lwUnd0S2kyamo0cUg4bXJ3VnhRMUQ3YU02clM4Tlcw?=
 =?utf-8?B?VmtlZlNPb3BOUk5qbFdkZENIOGxNekJ2NVMvQTJVbGdNOEZpS2lJeklxdUtN?=
 =?utf-8?B?bU5uQjJoSXhBUHBGYkhQRDdic1ZlVzFNT1ltOTVEa2RLUStpQklNb1c5OEhs?=
 =?utf-8?B?SE45Qk9JVThZcU0zREtOdkZhd0hRUm9ydm14Mmwvd3pXWlpyeDhPaXp6cXhI?=
 =?utf-8?B?bkxlTmZxeDNjOVB5UGhQVjcxbklheVduT3VJaWtxdStvTmdHOC9UV0pwM1kx?=
 =?utf-8?B?dlR3dEJ1cjFsNlpRN1BzQTVsRmpkcDRhenJxODFjVERIR0Fod3ZVVWNqdkZo?=
 =?utf-8?B?bCtVMUtQYTNOd2p2ZW5zdkFTMGdkUlRMVXFHUEJ4ODJTQS9ybkZsckVBclNj?=
 =?utf-8?B?YlVOQzlNRnVUdnZvWFJIaVJFVmJWd2ZyQklrT256Q0pTaVdjQmhSWW5RUkpm?=
 =?utf-8?B?T3M2eDZKZ0xUNFhpZ1J5WE5GWWFJaWxFRzdVYkp1dEFPVHYxa0VSQ1FvbElY?=
 =?utf-8?B?SEZ1U0gxY0dLSllRdm4rQVlJbUFvNjNkTnNnVVRVaWdSYWgzWGthQStTZExC?=
 =?utf-8?B?SlFZblQ1S2R0S3N1eFpXNTQ3YUt6c2FaajM2K3Y1ZVNpNm8rMHpvb1pFemd5?=
 =?utf-8?B?aTNKUkRhRVFsTFZ6VTJFM0pJajdwS3BJbVIvbjI1UnlhczYrUTdKRWVhNXZZ?=
 =?utf-8?B?ekxraTVKTXZqY3k5UjY1Ly9hSGk1dmV6ZGk1WVA0VDJONU5uSEE0QkkwTUJK?=
 =?utf-8?B?M1pSZmxEd1phc3dlU2F1STR3aWdLbzRCbU9rOC9YMTI2Q09pa1NvUStrdXhk?=
 =?utf-8?B?SlVIVGE4YllkWGROR0xQMm9ZRW9jbEc3V2xpeFp4N1lIL1pMYTFIOUk0bHM2?=
 =?utf-8?B?cngrQXF0bVJEcVVGWjQ1TjFEcFVZQXRpdlFGSmhhZGY1VnNkblFyd3hBYk8w?=
 =?utf-8?B?QnRsdEw3a2Y1MHJqaHNjNW9HY2Y4eVlCdVBRcEZ3T3JUSXVJeS9HK1V3TCtT?=
 =?utf-8?B?K1IzeS9oenc4RFV0RHJNM21ldFVKQXBDNGVDZGJhODhWQjlpekpDQ0lObU00?=
 =?utf-8?B?UFJpVkJDQ2dOanZoVU9ua0hreGhmeVVUZ0xOYlhYUDg3RWFNZnFXUElUUHN1?=
 =?utf-8?B?V2Z2ZFNxUlMrZ1FlMmp4ZDcxUzN2M3d3Y3FjTTdwWFJGTEZ3VnluNGVaRzc4?=
 =?utf-8?B?M0UzWUx5empJMkZzOEU4b215R3AzZUVXMDJYVTRTdU5iVmIrR2NBRzJaeFBQ?=
 =?utf-8?B?RXhUQUExdlk3L2xjRCtMWnBhUUsxL3NWY1VrUGhiT2k1SzhDMEx2RzF4eERi?=
 =?utf-8?B?WDNtU1VZMDFvUHllV3pYUjhsZE5nN1IxWnFZUjFBamorM3N6cVRVWm9sYVp1?=
 =?utf-8?B?dW9MN2NaR2kraWIzV21zcmtROW9OZFhEcHRXLzl3amVTZHpUUUNkRUFYbHpP?=
 =?utf-8?B?eE02TGo2cE9WT3BUMTNXZHl0c0d3K3B1T3lFODRFSG5LeTdMNFJmWTZDRnN0?=
 =?utf-8?B?OWpjb3RVMDZKbFk4ZFNLRkVTRE0vMVQ1cEZlRzc3NHcwNVJXZGJ1VFhDU3FH?=
 =?utf-8?B?WkltWlBaZDMzTUFEb0VxdzdPMjdtSEJ4U09Hbmlkb2c4VHk3cjIvSXhpN3Br?=
 =?utf-8?Q?QEQE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUJhRWxsZUNFOVlQYjhGSkdoV0tWYVN3ZlBqUnI5cjhjZi9uUERlWnprYklU?=
 =?utf-8?B?UklzV1B4UHhuUFcvQmNzcW55OFZHR3FRd0xVNWl6SHU4aGswUGptcUxTU2JI?=
 =?utf-8?B?OCtvdVh0UmgzWnA5WUdIa000WXpJb2Vsd3k5WFhQeksrbDhtTzhVZm9hN1lU?=
 =?utf-8?B?U1hDclEzRTkzZFpBZVRCMnJudXp1cEU0RHBSRlNaVlBqeHJ1UDdub3NrNWgr?=
 =?utf-8?B?MFFPd1g4dlI2azJSM3Y1TVNNN21sc0RmSWlHUVFVRDN3S1d3bXZ2bUZjVms0?=
 =?utf-8?B?RTFlTWZFK3habmpHQ2w3bzllSVRmbllTQlhNbVBnT0p0TzRLUDZZNXV0RHRV?=
 =?utf-8?B?eDhTZ3lnb0VtclUxbko2OGpENUdLK3ZCQzNQM09NNDdHUldiWHMrd1U3V3J1?=
 =?utf-8?B?cC96SGlDTWFuL0JGRmJMR1UzbWdDaFhvaUZXTnR4a0RVNEErQXMvZVMzdEFI?=
 =?utf-8?B?THBka1lOY1NaVzFpbG5kQTg5cWlkQk81eFUrTnZRSkdOWTFIemxMRmlBSGl6?=
 =?utf-8?B?NmM4S2daMHU3OEpTQzhaVDhXbFlad0RqZ2tJK1ExRDZaVWJKV1l0MFRubkxo?=
 =?utf-8?B?eWFPU0JLazVTbzIvMkVkZGZwNmZEbjRFYkY5YmpCQm1XdGlDQVhkUFhvUldR?=
 =?utf-8?B?ajlZb3ZSUUJHZ0gyOHBqU2NYdWxHVjl4WG52RS9pdjU0UnVmaUh4eDk1R1VL?=
 =?utf-8?B?RXZMQjVjeWd1RkwrYXlOeENYNStWcy94eXd5ZW5TNFhCZUo1QTJYZ1VlQ2I5?=
 =?utf-8?B?TXpldUxrenVmcVZ3OTdLZjlQTkY5VWdtN1NWejNMSTJHMU10RUtwaDlxNFZi?=
 =?utf-8?B?aHdnYktrY0p1ZGNUMFNXdUE1dDVTMnpScncydlRtVE5YZ3kweEFvWEZaTFRi?=
 =?utf-8?B?UHgvTEZRbHFqMURseEcwcklqZTdHNUhXWEFCUUlCNFNaK1lOSW5mRm4zOVgx?=
 =?utf-8?B?ditrbTBZTDU5c0Q5QWt0RWZ3bStSeE5zb2F5aUlrV1pGT1oxalJZcGhnU2xn?=
 =?utf-8?B?SGJZZW1SWnFhUEFWUXpGdXZMV0ZIejhzUlBweG0vcC9FTDJOWEdMUmR6cGRL?=
 =?utf-8?B?Rlc4eWdZSloyV3QwRG1HbWRsOEdLUW1TRVYwdVVVWlNsK3NjT1VPQVNUa0xu?=
 =?utf-8?B?UWxDQkcxWFdzbHhNZnRvZ1Bsd25HZTQxZHNiSTdCLzFFWUtFVmt3RGl2VGJp?=
 =?utf-8?B?S3hKVGw5OEkyL05CYVRLczhsN0RLOE5UdXRJL3BUT2FxcUVEbldUUE1uQUt1?=
 =?utf-8?B?bGtFTHBVeXZteDBYbG5VcGxQZnQrSTV0NXRFQnNxWHBpUUx1QTZkRnFxQVRE?=
 =?utf-8?B?NTEyTmF0RFNsd01FVEYxQXFRd0tubDF2RzBHQmJFcjNZVkJ1ZHB0YThKMUVl?=
 =?utf-8?B?am5Ma1JscEdnREQybDErcis0aTNCYnZJN05QS3ZnTmRxcTc2THdFQ2d5TEVn?=
 =?utf-8?B?QzBqUXNiZjl4dVpSY2lzTkRSemxFdDdJVmV3bnh6Nnp0U2cyUkMrc2lUdXc1?=
 =?utf-8?B?OGQ2K0VsLzh1Q1cxVWRXbnZ0dWZHSVJQMWJNcC9sYkFueG1JQnl0ODFEc0x0?=
 =?utf-8?B?RTdFUStNSG1ZWi8rR2ZVeER0aHZwcjNmNnBxeWlEZ25RYmdPL29PMmNsSmpM?=
 =?utf-8?B?RC80QTJBb3ByZkt4b1c5aFFocmRQR245bzh0bGI3TytlREk0SXVYU09QcWk0?=
 =?utf-8?B?VmJMWlp1S3pES1F2OWJtT21yUzJSSkorUWJ4NW1YVkdUL1Juekl0Z2hubVNF?=
 =?utf-8?B?MVdDMGF1TFZsUEhUcjY3ZGVwbm5rWi9TTjYrODRpZ05TRUlyMk9Ba0ZQalg5?=
 =?utf-8?B?R29ZWnd1NmlhWTY2RWY1ell1MWRYb0g1dVplVjVUV2pnWWQxYVZsR21CTnlV?=
 =?utf-8?B?bHBpMFRsSjllQnRxdkNiVDdBdXVxRHlucEs5Z0l0U0c1YldlTGhGaU1XaWE1?=
 =?utf-8?B?dzVWemdrbmg1Mld4Sitsc21TU0V6aUJaRUpzM0NmVWxYektsL2xrUXcvTkV0?=
 =?utf-8?B?ZERkOXNTZ0FzSit1QUNkRURTOGgzSkNPcDhiRUFiN081L0dua1VSZVlmNlF3?=
 =?utf-8?B?UHNUZm9IbFdnNG8vd0J4d0NsWlV1N0hXZTNuSGRtdmpEK3Z4TmNpakpFMGhS?=
 =?utf-8?B?VXdpcVo3eUt0UDU3V2ZBa2pUV0Z1ekdIUjZ1dTJkQXEzTmlQQk4rSFlROU8v?=
 =?utf-8?B?VHo3M2ZKR2RUR3JnRmZtMDlxQW8wS0xDTnFsZXo2bHNRM2FMUjNVbEhPeklh?=
 =?utf-8?B?MERVMEtVSDZGczhYMGN5Mis4d0RFZkNNYUFOb21Nb1FpTy9jNFFsVTBZS2V4?=
 =?utf-8?B?S2QxYkg3cndTVENGWnFOQVVTWjlXWnVoaDJRQlNTenZpNTk4OVNUZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b88d0b2c-c818-49d9-0f65-08de575bc514
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 13:07:59.3943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LzUdR4tw5bWJ8dD7WXtWQvCvvkHoFB8fEu01gS3xiy8i9x2U+JujLcb37b/Mf5IVuqfGWeJyqZE+Ds+MbeDvgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6164

On Mon Jan 19, 2026 at 12:29 PM GMT, Andreas Hindborg wrote:
> "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
>
>> HrTimer::expires() previously read node.expires via a volatile load, whi=
ch
>> can race with C-side updates. Rework the API so it is only callable with
>> exclusive access or from the callback context.
>>
>> Introduce raw_expires() with an explicit safety contract, switch
>> HrTimer::expires() to Pin<&mut Self>, add
>> HrTimerCallbackContext::expires(), and route the read through
>> hrtimer_get_expires() via a Rust helper.
>>
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> Patch looks good to me, but I just want to check with Lyude about their
> use case in the rvkms driver. I think that is why we did the racy
> implementation originally. In C we have stuff like this:
>
>
>     /**
>     * drm_crtc_vblank_get_vblank_timeout - Returns the vblank timeout
>     * @crtc: The CRTC
>     * @vblank_time: Returns the next vblank timestamp
>     *
>     * The helper drm_crtc_vblank_get_vblank_timeout() returns the next vb=
lank
>     * timestamp of the CRTC's vblank timer according to the timer's expir=
y
>     * time.
>     */
>     void drm_crtc_vblank_get_vblank_timeout(struct drm_crtc *crtc, ktime_=
t *vblank_time)
>     {
>       struct drm_vblank_crtc *vblank =3D drm_crtc_vblank_crtc(crtc);
>       struct drm_vblank_crtc_timer *vtimer =3D &vblank->vblank_timer;
>       u64 cur_count;
>       ktime_t cur_time;
>
>       if (!READ_ONCE(vblank->enabled)) {
>         *vblank_time =3D ktime_get();
>         return;
>       }
>
>       /*
>       * A concurrent vblank timeout could update the expires field before
>       * we compare it with the vblank time. Hence we'd compare the old
>       * expiry time to the new vblank time; deducing the timer had alread=
y
>       * expired. Reread until we get consistent values from both fields.
>       */
>       do {
>         cur_count =3D drm_crtc_vblank_count_and_time(crtc, &cur_time);
>         *vblank_time =3D READ_ONCE(vtimer->timer.node.expires);
>       } while (cur_count !=3D drm_crtc_vblank_count_and_time(crtc, &cur_t=
ime));
>
>       if (drm_WARN_ON(crtc->dev, !ktime_compare(*vblank_time, cur_time)))
>         return; /* Already expired */
>
>       /*
>       * To prevent races we roll the hrtimer forward before we do any
>       * interrupt processing - this is how real hw works (the interrupt
>       * is only generated after all the vblank registers are updated)
>       * and what the vblank core expects. Therefore we need to always
>       * correct the timestamp by one frame.
>       */
>       *vblank_time =3D ktime_sub(*vblank_time, vtimer->interval);
>     }
>     EXPORT_SYMBOL(drm_crtc_vblank_get_vblank_timeout);
>
>
> Also, we got some new docs for `read_volatile` that allow us to read
> memory outside Rust of any allocation that are not "valid for read" [1],
> meaning racy reads are OK as far as I understand. So the original
> implementation might actually be OK, although the number might not be
> correct always.

The wording is for MMIO and should not be relied on if the accessed memory =
is
C memory. Also, `HrTimer` is going to be a Rust allocation.

Even if we don't treat it Rust allocation, it's also only "fine" in a sense=
 that
you don't get UB for doing it. But the value you read can still be complete=
ly
meaningless if the updater is not atomic (it would be valid compiler
implementation to, say, turn a non-atomic write into a write of a garbage v=
alue
and then an overwrite of the actual data).

I think the usage you quoted is just wrong, as on 32-bit platforms this cou=
ld
well read a teared value.

Best,
Gary
