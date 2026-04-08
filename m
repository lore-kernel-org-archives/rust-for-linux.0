Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021122.outbound.protection.outlook.com [52.101.100.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1AC26CE2C;
	Wed,  8 Apr 2026 11:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775647954; cv=fail; b=jqYZqTCststu+VH/dcLf/M9kKHiBfPrg4aibB/T7vZrMUCfvgccYOwfrr+/L5GgVt8AWTAHdLGhhMLT9NPN26iBnWr/lQEkoKoifdMzKOaOPSVBX6md5NHYTKde7CSmTcPjsUYviODHALC0ZKfbpBqBX9WX2j6bgH/DeHMDPVvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775647954; c=relaxed/simple;
	bh=fyquusEXW1Dt4yZV0v+6VGUdWMNL3eB6w9tssbCiAHs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Vx5MYn2Rj4p5S5C1GAzr683ejeL/vvfy4bJLGrv68Jd9VwVZg6W2csh9cdqRHMXlsZ/sBSsvMEDYFoOvptinMqQOflpDoD/fiaqAtRiaUjSUf+hs91NcHr5RH2Hp6SlusRDWyzXYAjSb0mYiH7jBA/QvozkYmuLxrPMxIkN4JRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=TAooBN6V; arc=fail smtp.client-ip=52.101.100.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="TAooBN6V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nns0uh8M3q9XZIqy02GdbQDLpMPM4/52Lns4PAqorNFwm2/54G8AcFLW7IJTTSzRrq8hDEKgNNKOcmPkCTv83p8aT1y/Z5WorZmt0HJX0HBWRM6JinhblFdRmeyXxQv3HVzViVUKkplE/SOOgtGrfGW0Q+ul1qsAWnyXkl37UPcnocULU6lLSNVM6uI5r3Y44hIFfznCnjMrWkDKhiC247xRT+uXEoxByG5L9HUXPdkLtnYLmAIaWYtMseTb8d6sQjml7VX3XSrwrmKS9/D+KrFJumtGjHHOj7E9KTPXnhREXzH8eRD3itu6WO4GHHSqApD4DZDFvWq1G6v3y4GrMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRRly1CxweQcBajLidb4Cud2LW7WPJaZs3l8vk53mG0=;
 b=VAu2rkRdjs9RkdaRypAozJ9tcRBHAGObsHIIaq4M7Xqtp+WL7lzzLurzAoRmLe+/8mLDLW0G85iaITQsSXTmWUoYorjg2U8/OKgxzk06nrCLu1VruEBf+pbUtYErhccnXWeyVbGE5+WIUQm1+7Ll+0hqn22EN2KuF+DPsTIcVaVcScXC/ipb62QVjK7hnnqbCkw12eNH3qQ5bge50btOzvhR3ng+ocDHPKof8I8CORaIDYUmpwZ3zQ8jhjW4WlFdzKtVprs8ujW3puFYCph5O3G7/2AWOcvf2X4jX7PP7x1WCJ4U+4PJwYQ1GS/mg0RSq12XLEa86J5Y2eCtFJs01Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRRly1CxweQcBajLidb4Cud2LW7WPJaZs3l8vk53mG0=;
 b=TAooBN6VP6KMl2Kikm36omZ2FU/ZFhem5psorbCpvuwYQPkd75P87A3pv4Fjac5uyc3GyZaqzrGX4CYiQ2W2chdumYPaJDO9OrhiBrnsDkGuXl0sRpGjsX+3EqeMLcOvrsu0fj1T33ec/PgzGt40LOQtudi5I21inpuPaKXR5uE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOAP265MB9175.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:498::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 11:32:30 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 11:32:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 12:32:30 +0100
Message-Id: <DHNQNZ3L4B3Q.2MUD8JBT90ESN@garyguo.net>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 2/4] docs/zh_CN: update rust/coding-guidelines.rst
 translation
From: "Gary Guo" <gary@garyguo.net>
To: "Ben Guo" <ben.guo@openatom.club>, "Alex Shi" <alexs@kernel.org>,
 "Yanteng Si" <si.yanteng@linux.dev>, "Dongliang Mu" <dzm91@hust.edu.cn>,
 "Jonathan Corbet" <corbet@lwn.net>
X-Mailer: aerc 0.21.0
References: <cover.1775619061.git.ben.guo@openatom.club>
 <83b72c91f7ba2a9ca2ae73ab42fd94fcc369220a.1775619061.git.ben.guo@openatom.club>
In-Reply-To: <83b72c91f7ba2a9ca2ae73ab42fd94fcc369220a.1775619061.git.ben.guo@openatom.club>
X-ClientProxiedBy: LO2P123CA0085.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOAP265MB9175:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e4edbd0-0d74-44eb-7e47-08de95628513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|376014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Pp/75wXy4+w5LLCGDTZiYtNvq5JzAJ2b9wQZ3IwxsOclv/eAci3ZoQZ2eUlnnb4ZhjFOrMjYTGRtutBnwYYkS8D/Y4SGCpL4PPwx8X8vZG3Pw38XE20vBRdcsX5pW/FeG1ML5qVM/atsMCXp4mcmzvaBjKue/SwDSJxpsGAlE2pTe8yI421N26KBCP7tk9JXl5IqI++lLG8e4lRPid8xsJMJdfPFpwnqY7QBG6zPzuWCuxK/jlf2rl/pqDkEXldZEmyH1sYL2VggDt3VtkcchgLBXvD0Ll2Nmkr7NYI3PY2xEhP9byJ+/naBkXKuuXZDoSiWaKFxVy2GSLQgfu0ThC/d1Wve42bUUH0IzkfRjgADgdNJQM3qKfE1tBs8uNkAeDkbw1jrQ9X3/R+ZohkL7Ou3ssCQhZSEE2ja0KNQ5UPTgjaZHHA5PzlFXCYHGGplviUbK7P+Ruki4GFhBm0zPUgMGmVNn9XKkvxfzZDfMR3jm12UC24CTSsZsF8jC5DjDdWpGLiyVig3ltMJKZWrUy5J20yoDyAv6AmGTQVsBTm5OmnH34kbPCGcCK0mwCWsO/8jgSu5LuXOY/HLPf/30mPAfP3qX8g4OhCtFcseZRduGkqQ9+1FIYuryIK0M+fvv8KiMKlE7sf0VtUqSnT65kQd3nSAttwO4aXV2PZUBhzPWRhdemXYEBmjFCMe4HEkS9wx787clpe/pc/BjoluLjRx8fin6u1lC3f/jQAOX6Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDIybHFrZldjalNzY0JsUXVGR2F3a2pQS1hJa0FnZkNqMUZPWTR4d1JWYjRM?=
 =?utf-8?B?a2wvbDVaYXpqYnJ5T2NzQXVDc2lPbXZER2JPa2J6Z1loQ2xnTjVMV1cxLzN0?=
 =?utf-8?B?RDNXMFI0RHpUYlNTSjMybnN1UmlZdTRxQTJjUWJBb2MyUXpGS3I3VXZIY1Yy?=
 =?utf-8?B?MlhPUTNSTWExaUNtR3BLejZmdlF5Ukw2VTJUN0pWNUtESnlZRVRqdFNVL29q?=
 =?utf-8?B?SlIyREQ2Uy92QnY0aVJjZmU3aEMzakRzYmU4bVhkdFV5TlN1ZEREdmJOdWJX?=
 =?utf-8?B?RUdBQTFua2ZOYmYrM21uQjcrSG9ic1JWRzBxMSt1Rnl1NnJXRitnOThqTWh4?=
 =?utf-8?B?OTV1bnYzelhlc0hRZVhKc1BSTSswVjdnOXlhMTViaXhESDc5aHlLM0J6ZFBL?=
 =?utf-8?B?RHlGeEVGaFdmaUV1MVFBZ3Jmd3JCdk9BRjBBU0Vocm03dUw5c214Q2JLcm4x?=
 =?utf-8?B?UjBkdmhBNi94Sk9uRTU4MmRUREhGLzJuc08yOGNiczk1RTU1eGdOTEVlY3Zv?=
 =?utf-8?B?OVFXWStqb0VTd2MyTUxhWEhBNjJ2cTZnQnQrL1Frd2htRDl3NnZYK0Q3N0lR?=
 =?utf-8?B?eXdtUXZ6b1M0aEF2QnVUWjhzb0ZYaUFCcnpQSjZPcjhmSTg4RWZsYmhLUXc4?=
 =?utf-8?B?OUU1RVdsUERNMzJoRzQ3TVVpL2UrNEZ5dElOaU5aNkNCYmMzQjd3MncvYmRC?=
 =?utf-8?B?Z0dFalpHdlRlVFhRUmE4QTRRRURuLzFOTWNCYzBzQXJRZnVXWStQMWRoUWND?=
 =?utf-8?B?Q1poY3JIWW9BNk9PRHFOWGFSKzRSK0dxVThhTnlVUDRZc1hXbE9KSTh0QnZn?=
 =?utf-8?B?TFJCWXJsSTdyNm5UWUo2aDFlVysxS0NBZGhlZ3h1MU1mWUFLQlcrbi84Q0Nu?=
 =?utf-8?B?MnAySEpyL1dDcktyQ3FEMmRFKzhDeWVsRnVaRVYrenNKR3RWVlBoeFJkeklh?=
 =?utf-8?B?WGR0WGpsUGxFSkY0SGIrb3JhQTVzU3hhZVZOZkV6eWhoS2ROM3V2VC8vemRV?=
 =?utf-8?B?Q2hOWXMzK2pMdlFwTkdwWmd5a0ZrSXpuSHNWeUhMdWRBWU53RlZxWXlHNW5P?=
 =?utf-8?B?MXQwTVFkY3dUMG9NUVNwTFdEYkIxM0hKRmEwWVRwL0Q1N1p1Z1NUamJ0VUlZ?=
 =?utf-8?B?eU91SEs5bmx3ZGFwSWQvYlZZamVXY04wM2tCeEZQZGpGNHo2YVc5cnh2blpv?=
 =?utf-8?B?WU1PTjQxdXBUZzdTc0FPZ3NFM1JjdTBPekFyaTd0MURqckFmSy9xL2R3eElC?=
 =?utf-8?B?bkV4NjdCK2dha2FDK1FWUmFjZkNJYU5MM3lsYU12TWllTEs2aHRDSGZNMTVC?=
 =?utf-8?B?b3FmNC9hRFcrRTBReGZKR08yOEpWS2lnTS8wVit6U3o0Mmk3T1JyNk1IZmNS?=
 =?utf-8?B?T3AzZm1VcDhVbGVCOXYrbnNSSGgzQVZvV3B4d0xXeHY4Rm9LUmdKUWM4ajIv?=
 =?utf-8?B?bmxwUzlDRXRyelp5Yk1ON1U4T1VHcUxlclNaMHE3SFRuM0l5bnV6SzhNdUd5?=
 =?utf-8?B?QXhtUTEyT3NEMkc1bGNObTlSVVZsSmNmN3Q1T0l0bDRUeG9ZTkt6VkFjdFNM?=
 =?utf-8?B?ZjRoeGxxSmwrWnFwT3VyOXVSbzlUcW5PTHRrY2RDaC9zdm5Bei9QT2hXVVo4?=
 =?utf-8?B?THE3eEp1NGUyWlo4cWErOG5FZTFuMURueEwwNGhjN2hnaGFZUG1QRVZjUW1N?=
 =?utf-8?B?UXB0enJCTXVPWjNVT0g5dDNaNFovbUpHbTFIdFZYRWJheStTSlZwWERmZ3FS?=
 =?utf-8?B?U3F5a2ltRGFqWkRQSUZmbEQyVjB3VEdvMmVEdzZIYjd0d241K2p0ckYzTmdY?=
 =?utf-8?B?eEk2ZitGWWlGMmowNUJDS0lJSkloWFNtUUZCZHh1cEhhTU1LaGJHdzZXZnlv?=
 =?utf-8?B?OHFvNGVzUFdPWjFZOEF3Ry9rUnNJbUVwYjg2ekZLOHRVb3FhMXJJZGM0UDRi?=
 =?utf-8?B?bVlkMkNabFc1c2RpY1UyRWZlT2x5dUVMT1V3d2FPaHVYSWJLanJKSFZUQkZT?=
 =?utf-8?B?K2htYXZoRXJwb2dqL1hLOE1NSXlwMzYyQ0pMUnJTTFNMZXdGS1VuUWtweE01?=
 =?utf-8?B?bVMxTUYxb2JDMTZiemJCSDR5M0tjRFBRMzF1RU9xK0FWY2l2R0JLZ2l6OXRZ?=
 =?utf-8?B?NmwyaE5JbTVWeXk5azRjS29WbEtNS05iTTJOMEhKQTNxbkh1alp2QlBMbzBF?=
 =?utf-8?B?c0l2N2g3RFJoaGJuelJScnpYQVNocUg0b0UzcnFheWx4N3BGWGZ1cGs1cXA1?=
 =?utf-8?B?UlhKWWNpUXVpR2kxNFBmQTloRVNyNUJkSUlxQ2NHc1BIN3FOTVh0amYrell1?=
 =?utf-8?B?TnkyWDZlNm1IUXA2SjVpdFlsSTZpZm04QmxoZUphRnNxMTJlMjlGUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4edbd0-0d74-44eb-7e47-08de95628513
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 11:32:30.5971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EVYOA6NdORboDcFrOo/EqcwUnuwWf7rqAfuvToHWWY05vnZjnxv0QliAYyY13HtkL4a66cbTQNzrRArxDxzRXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOAP265MB9175

On Wed Apr 8, 2026 at 6:05 AM BST, Ben Guo wrote:
> Update the translation of .../rust/coding-guidelines.rst into Chinese.
>=20
> Update the translation through commit 4a9cb2eecc78
> ("docs: rust: add section on imports formatting")
>=20
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> Signed-off-by: Ben Guo <ben.guo@openatom.club>
> ---
>  .../zh_CN/rust/coding-guidelines.rst          | 262 +++++++++++++++++-
>  1 file changed, 248 insertions(+), 14 deletions(-)
>=20

Reviewed-by: Gary Guo <gary@garyguo.net>


