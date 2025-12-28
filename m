Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013048.outbound.protection.outlook.com [40.93.196.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427E328A1D5;
	Sun, 28 Dec 2025 07:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766908388; cv=fail; b=DCS+n6bP6JfKTkzEItMrSFLD8KONBkHrA/9mjRmMc0UrIClDUzQMD5mCIInzY/CJgQKNnCcqV8inB65Eqx+aN/UXL38Mim64cGBJR8SYihjX2STsEqLnnwwUvKH3HLRJtCTwWDtHg2UuKfpqwuPafoY+300V5e5N18jjc1ad39w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766908388; c=relaxed/simple;
	bh=f+9I9EIFerQrTVXais3w9vfsOVjMcNOvR2ViXG4oK1M=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=L051+RIowbldXHcgg/4U6IWuExdS/tEFAjTRP+pPTS216kXVExxaWChdPOgImAmRb9JpAaXpbHQojAo+c+t6GOon11zJrrwnKftP3cFwt7Hi3COKrCcnW8xaK5PmZzVhnnhTMr71WyvrYNbICqkIU9rjMl18sNKqF7PSiAky/Jg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=I0TVaXA7; arc=fail smtp.client-ip=40.93.196.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="I0TVaXA7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lE41GcMKqMZOn5xQSGwHjulu65+RQONerOqaAvNp05ciWYy4HWkQdCH2gCB5wi/YBtZIXp6istnuraM5QfnDJ5ZteX+0VWb/sVjS/2IPn+8OrLAA2v/SWnzhZVM7j8haDZmEi1wZqsZH9bgPSz/iEddZIdyRUzJW4IdStccsnNB3joClCFccX774YbilIEB9zq5vIO9pRBiQwjzo4dO0tcEbeIJ4S+i3zrnwd6OxZUesQYb4xcTUUl6/QOizmqXHIzmZQHTuepqIlcXRQl2kQy5twwmfAWiZ6SV5MlRhgaigwmhZjWeKDrflqWU5j+ebCso305zZG3BPagHg2qtiiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+9I9EIFerQrTVXais3w9vfsOVjMcNOvR2ViXG4oK1M=;
 b=YGSMLRNTdYSH+vCAHqpmRU6zQJfo3Jzfp5S6fbNPbqXxzkfBe/06hs7lSJJLijZaih6knOdj/5cP/hB9zsZ5fUzxBByAVx+9hk9xrc3CX5AM4/gf5d0umX24lUcnYNN6aWZeiNJF73GErOdyWUcp79h9xjv7TVURzs6CPfNqGJTXfyDXmig4tKoUg1RETcRvk6pr1/MRVxDMROdN4psRTPz2nOHqOex1bJQlBQ477Qgj8IMZi0j4TfQFOKIgg5OBW9zJAB3Tqn1drdyl3ybfuiDT4ErbErdmA2VKDo8SW+m9cQR3pvaRLeqY3ahzf7oGC5bmvOxFAzdZnJ1QcdThLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+9I9EIFerQrTVXais3w9vfsOVjMcNOvR2ViXG4oK1M=;
 b=I0TVaXA75jE5TYaWpK0BmYGNvSK9bcv4OOu6wspqpVRZNReotmdTqf2VELs3PctqHGMbPC0htPjFcHqDhmOhV5LXk7Tnd486/MQERqgGqns7PQcqIDtuSScmyeazj2Ry4AmETuQKldORQMSJNVQm8AT83VeuRqwsPiSFRZBi6XtmO7CvIm96t9wYWJgiYs+/KOaTwNHM6E3eNN6/swxnQZFOxwLweyJKyv0ogkhU0xjglU+qrB310xN4X9wcQQTXxHy2iIcF0QlJTkcPD7nVPXvZ9N4h8xZtV/P05pMjmUzZYHbpLCXF8IuU1qlO6WGkybx9eRvVKJvWAsTDrvQxlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB7782.namprd12.prod.outlook.com (2603:10b6:806:31c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Sun, 28 Dec
 2025 07:53:01 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9456.008; Sun, 28 Dec 2025
 07:53:01 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 28 Dec 2025 16:53:03 +0900
Message-Id: <DF9OQXGP8PJ4.V4WNMK9JM2BP@nvidia.com>
Subject: Re: [PATCH] rust: debugfs: use "kernel vertical" style for imports
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <ojeda@kernel.org>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <mmaurer@google.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251218165626.450264-1-dakr@kernel.org>
 <DF9OQ9N1SCN4.H1FXRSR3FU5E@nvidia.com>
In-Reply-To: <DF9OQ9N1SCN4.H1FXRSR3FU5E@nvidia.com>
X-ClientProxiedBy: PAZP264CA0090.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1fa::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB7782:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ecae723-8a1a-40a1-133b-08de45e61fe8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cC9ReTZ5SlhzbDZhK281MUdqWC9YWXBPVWZSTWtPcXI0cmdFZk5udnZOSW1I?=
 =?utf-8?B?bEhod0JGb1JISW5rZEZCZUVoQzk1MU1OSExncjZRRG1TY1gvOWFnTCt1NHZJ?=
 =?utf-8?B?S0txaVZMNXR6WDZaR1AySWpGVk5WZDNqMUZ1akYyRDVNcVJaa25VNDFuOHh2?=
 =?utf-8?B?S3VndHlKZXNjaUQrY3lTRmJHaG1qOU5qS3J4MDk2blVITDJCc2Vjd0pwTHpk?=
 =?utf-8?B?Nm43eG5rOHhTVW5NOVVKd29mOGRpTzRORzFrM2pxOEF3Sk9jL2Z3OC8rOWZq?=
 =?utf-8?B?eVduaGR4NmR0Tko0Zmd0V3J4b1pZaUtRK3h5ckdKSHZHQTl4S1lLdVJNYWNh?=
 =?utf-8?B?ZWdweHhuczVySSt2SUhoWXg3L3BwQVF4NmhybUZkYzVXN3dnUWx2RWVPYytN?=
 =?utf-8?B?TENacWxVNXlQMEpGSUVoZ3RWWWlSeHZiVUNTdnMrTzN6RCtEbjlGVXlXRmxx?=
 =?utf-8?B?ZkhQTS9LSjEzckE2Q0tIOHJCR096Z3Z0em9KMkcvVk92V0tuZmJzOFMvdC9Z?=
 =?utf-8?B?ODllbVVoQktqdkxsY2VSOWtqZms5clZnMHVibU9GdVFmd01ZdXVSTFZDN0tO?=
 =?utf-8?B?VmNOSXJVQkd2MjcwOHdkSFhFL3lUOTB3bnhreEJvZUxINlFsY1hlbGxuVGh2?=
 =?utf-8?B?bEVpWnhTUEROSXZoYVpiN2Q0Y2RBWndpbWFmQVBDZTRzemc1S012V1AvQVMx?=
 =?utf-8?B?T1pvbDh0elRtbldNQlljMkdxRlNsUjR4YzJjaS9BZGpKZ3VsTCtxWWczQStu?=
 =?utf-8?B?YXRPNURNVUlVNjVHY3cwK2c2MEJOL0MxeVk3RTFzUWpoWDV6UmMzMGFheUlx?=
 =?utf-8?B?T3ZBTis5d2hQU0hMQnB6ZzBpUnB6RUxBVktCS0ZPM1czR0NRSjFUVy9leHpZ?=
 =?utf-8?B?bFNyaEFRbTMvZC9ubFRNalhkQzdIV3pFWlVVQTkyZS9DMXBCOE5QKzZsWmJO?=
 =?utf-8?B?Y1JBUDhua3NOcXdxZ2oxTHl4U2oxVEdBRk1BNVhoS3p6aHQwTXdMcnoyRklQ?=
 =?utf-8?B?Zyt6M3ZsdGUyd09pMGkvYkQ0b0ljTS9HaFg2RTA0ZjYxYndCV1pSZGpTV0da?=
 =?utf-8?B?WHRlWHlKRzFkcTcrY0ZOUEtGMGdRWmJCR2dxa2hURjVhQmo3N3hlaXFTbmJi?=
 =?utf-8?B?d1g2RGNvaXlGRkliTE5iYUNCblQxMzRmWWszRWl5dDhIaHVTSUR1K2lUSXFE?=
 =?utf-8?B?MzYvK08zL3FQckgxUlhCclNCbm15QlI4SHhNZ2M2VyswY2pEb2NGdHJBekc3?=
 =?utf-8?B?MGttTENwd2VvZ3lQcldhb3E3Z3NqNTllR2ZJZlFadEJFYnZMSVRHYVZwem5E?=
 =?utf-8?B?WXNnaFA3bnJoaTVEeG4ycWFkdHhkMVFBTktLU0ptSFU1bVlsYjQxM3F0bzhm?=
 =?utf-8?B?UjhvWmFBUXJUc3M2T3JlVkg0KzN0dktYalhvZVMyQUZCaHU2M3JqVGhqNHhw?=
 =?utf-8?B?MkViK1gyS2ViUEVKSWVRekxONnVuUWphdWRYcDJOZmFjRS9Ga09VRVZoNmtV?=
 =?utf-8?B?ZmZURURvaXZTSHpQZ2hoL2tDZTZKaGxWdWlUdkZ0UXhYR1RRYmVoeDMxc1Zi?=
 =?utf-8?B?ZmZENzc2NGZQOWl4dHNNSDE3dG1HemN3MDl6K2R0K0xoSEJId2R2VEI0WElv?=
 =?utf-8?B?cmk5ZkpRUGhNVGdDWXlNay9RdjgvOGs4aWZ1WTZ0VzhROVRER0lnZHhocFJo?=
 =?utf-8?B?QXdQSzJ3TjdLRFQyN3QwRGx5YW5TclZvaHd3dTZXYlVmelBWSmVLUUI3SE1R?=
 =?utf-8?B?TDNPWHBqRTF4dCtLZmlFdjBjVEpkUVZaMWl5U2FMU1MyZm51YnMrbndCSzVH?=
 =?utf-8?B?NkxMcXJsWk50L2tEUnhoaWpjRnFUQldRNllHcit3S094TkJIT09DY2pBZ1Ju?=
 =?utf-8?B?V29rNXBTUzNuQ21sZ3Z4NE9tUHV5dWQ3emZ6dlY4dG9EWkpBU1c4MUdOYXlq?=
 =?utf-8?B?MThDRG5tZ1F1NU9DZVI2bm4yRzZiZ0FtNTRCZE1PcFlSNVNVV0RWU2tuMFRU?=
 =?utf-8?Q?gNtIgCmhP/1CT/sCQ56kw9f7YrsLGA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUd4eC8yS2tteDYxdUR5U0Y2QzJqTUxBak5WM3h2QmcxSDdPQU8waUgxSE9p?=
 =?utf-8?B?OUl0ZDNHbHAwZW9jNjhVTXBCVWo4QXVjMStKK1B0ZitkUHRObHVYT1BGZHRh?=
 =?utf-8?B?V0FyYTZaWFoxK3YzT2xndTN3ZjdqTHlxaUhzSE81eGxDdnhUbXJSKzJoYk9p?=
 =?utf-8?B?aEYzVmhIZVJhdWIzTEQyYUhucDZWS3BnRXIwRVRESUROSjVkSmtLVjlseTho?=
 =?utf-8?B?dnI0ZVY4NEwzV29aNFN3dmVETjZBN2NTVCthSytvbzdOWklydXBiYk1yTzg3?=
 =?utf-8?B?cjdLaUJyWjhsVHhRbGVWL2gvL09KSTR4K2grelpybk9zQzR5L0pBUkhPTlhI?=
 =?utf-8?B?bk1FQ3BwWHo5VWVKREhtUnFOcUhxdURsOTNURldWekZIQXhGSHVZWEU4R0l5?=
 =?utf-8?B?ZG5GdkJkK3lkeEdiWVFJRDJrTGRxcWY2d1VpSlcweGdUNXlWazFuOE1SaXVT?=
 =?utf-8?B?clB3V3BQQ21GQzNUakwzWkVvMHM2dmtSRDlIWEg5SXJXOUI0R0JIM1NDd0xT?=
 =?utf-8?B?dXhKRFZsZDhzZGNjK1hXa292U2Vpb0hRUisxTVJDZmlZV2xUbm4zKzVPTzYy?=
 =?utf-8?B?UGFwSTErUVZCOUlYWFByUU9adlVPTERSNmIwbC9lWDZnU3NUTk4rQS9zcE5t?=
 =?utf-8?B?cHMwa0NSYSszOEhwNzNIQnJ3TUlZWGN5UkQvZXJQSFdKNmYvdm1kaEhOcmw4?=
 =?utf-8?B?TmtYSVlyYWprK3ZnSmF0cXBTMTBZb2JrYzA1ZithSlFTQVd0aStWU3RDU0M4?=
 =?utf-8?B?N0I2cWY3QmF2VlJiV0h0SFVKNDl4V2s0WGx5SUJaVHFXYk1mSzJFTjBwc0Y5?=
 =?utf-8?B?MDBQYUF5MzF4WGV0R3lxZ0NNY2ZSRXhqNEo5STJyaG1KWmFwWHZIWlAzaFBn?=
 =?utf-8?B?R0hqeWtsUUh3NjFsRzZKZ2xGV2wyemtucXdwa0poN1Y0M3EwdUNoN2grbG9C?=
 =?utf-8?B?cGUrMjRGKzZlaDQyZndYSmNQM2txdkVPNE5pTUJTN2dPL2loL1dUV1hZVUpu?=
 =?utf-8?B?SEVYMmkwZ3U4cTdjMzZnNENObjhscE13RzI0SEJaNVpBR2pMZ0p4akJFS0NG?=
 =?utf-8?B?MVNOd3hTbGhQOTd5MTZZL2NCaDFhK1cyUUpMM0JhNEM2eUtZc1pHZ05hYUJ2?=
 =?utf-8?B?MHoyRVpuM0RQRm9ISTZtQThwWktsZ2l0WHZCNmRHMjFTNFRJK0RSc29mMkIy?=
 =?utf-8?B?L1ljVEVlN3M4Nm1YOENUVDFyUXE5b3RDM0ZzMmQrSjlTOTcwSnBUVnNIdUVC?=
 =?utf-8?B?d1VScFBudWRGZ3Zla0R2LzJLSDk0Q0pjM2FyRFVNK0xyOVkxdDZmUm1HaHFq?=
 =?utf-8?B?bmVPNm9LRTlOcFlNUzN5WUQ3amtmVUJHNUNTRDdNZ3g1eFk5ZXRjamNQOTRE?=
 =?utf-8?B?WHdZd1lRanpBYkZSSUN4VW9UemV5aHdUcHNvNEN3MFY4NTRqKzF1cHBvOG8w?=
 =?utf-8?B?dzJYOE5UaTZkakNCa2FXQzNYZk1haUgzajRmRWRqcGQyRzlkeFVYTnF5N2Vu?=
 =?utf-8?B?NHdNWkhRUjdiTExMWkcyMWl6VUJGS3l1Z1R2NGpRVmptK3ZNTm4xQTNyS0pW?=
 =?utf-8?B?bFgrU296Z2ZVMEhvNUJFbXFNc3A0K3BER2FBYVJxdG1yd3dqSkRJM2hoVHNo?=
 =?utf-8?B?TFAyT01XQjJvUk9xQVNNdkdhZWFYR2ZDMVJyb0d1dWR4VXBISTl0NEdWQ21B?=
 =?utf-8?B?bVoxclhOTmpJejhLYTMwVHRkUmd4OWNMb3FvZTZCU0hRbHo1Z0VXZDE1OU9U?=
 =?utf-8?B?MUVZWTVCUGhMR2FKYkZhTW1UN3E5L3NQWkQ1WE1BMDdnMjhXWDRqcEdZWkJm?=
 =?utf-8?B?VmRncUFoSk9sQlI3SXIxcmd4NWNzUEVKUllhdGZkN3luVGpPNVNYcEo0UCtT?=
 =?utf-8?B?ajBZbkpJejZSdDk5YWpYbU9CYWVTSWNjUTYvTW5tQ1ZldFA5OERmdjVTVzdr?=
 =?utf-8?B?OUMwTERtTjluQ01EYWdPV1ZEZ3lKejNyK1VNYzNQeHJ6Z1V5cXh2N1c3K2NM?=
 =?utf-8?B?Z0ZiYmRqMmZQN0NDR0REbG9iaXVGSlFkN2tmNStQZ25LdHpVdlp1Qzh0OE5H?=
 =?utf-8?B?TVdSSGFFbEJjeVlEeVBqYkZMNFJNLzk0TGVTM2hvL1NXbUxQS1VkL3E4UUxI?=
 =?utf-8?B?YlJtbnJNT2FLa3RFQktxTlZVQTNldFFOVjE1bU1YTEJ6endFSnZBSEpLcTkz?=
 =?utf-8?B?ai9Xck9OSGpjZGJ4eEYyL1pnRmwzd2QwL2FGUlMwYVpWNkZpM2o0MUM0THk4?=
 =?utf-8?B?VjhXMVNJSkFBaVZTbnBsWlg4Qi92VU8vTzNzU2ZWdld5RUJ6TXFKcEFyTEJ4?=
 =?utf-8?B?VkhQbTgxVmI2REpNYzdXTVF5SDlYcWordGMycnZxV0JOekZrRmJ6QT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ecae723-8a1a-40a1-133b-08de45e61fe8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2025 07:53:01.4307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: exJYz8OncuR61dCWHwqvDlLvfz6P8SlmYxvRtImmRHpFBhAXMCYRI3+1+Ka7B678f7DzNuORVQ0Rla+cBGpwHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7782

On Sun Dec 28, 2025 at 4:52 PM JST, Alexandre Courbot wrote:
> On Fri Dec 19, 2025 at 1:56 AM JST, Danilo Krummrich wrote:
>> Convert all imports in the debugfs Rust module to use "kernel vertical"
>> style.
>>
>> With this subsequent patches neither introduce unrelated changes nor
>> leave an inconsistent import pattern.
>>
>> While at it, drop unnecessary imports covered by prelude::*.
>>
>> Link: https://docs.kernel.org/rust/coding-guidelines.html#imports
>> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Argh sorry, missed that this has already been applied. Please ignore. ^_^;
