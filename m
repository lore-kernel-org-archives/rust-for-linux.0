Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022108.outbound.protection.outlook.com [52.101.96.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6202035B135
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 12:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768824545; cv=fail; b=N9VmLGS+HOkVjEr206PPYSmy6z/q4Cx/uCgfuJ8vgcMGyMbyUcZeQXDrCcxL/1iR09+rdcipmlqMCU33MD5RNZNLHYQUeCJP05S61pxrD+qof6ddfET+b1flxlNiMBIRlc8yqv7AAm9IVn985z54Q3PzYCRcpdK0VpmWzak3gL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768824545; c=relaxed/simple;
	bh=es9YlkJcjI7bCbz8IIxrMtQMtC792Vky8kkYFnECnwM=;
	h=Content-Type:Date:Message-Id:From:To:Subject:References:
	 In-Reply-To:MIME-Version; b=mvqvGkFmEFsfDbkFhzUP0LmP6jc0606DZkb4eeP86kUxZEVDzY+pGnL1zqh5EqMmNeY77BhsD8+Po33Tsh9ZDNRjGrZl9RtetI/60Om3ghjyqUOVl6NnOyxy0cLJtfzaDZv9Y+777EQzxq0pmxZUwr8LpOqGmoC/+jxPbIm3f+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=s4b4iQ2y; arc=fail smtp.client-ip=52.101.96.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="s4b4iQ2y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HfLTAh2I5T4HLTVfDqe7q/7OGWUcykKBdtgygwccYr7XSfthxMGGX3jTI2nvQbJhLYWXOGO8PYOjqtbwA8U4PduDgq7fh2w0TLfSx8IyiDpqfuXtrlEBU4unywJ1OlOuVCaJ0cmuFQJfSXatjL5DCrti73vi3Xq8CjQy85ngZGYMZgYn9cmqvDW0LBXY+SWB8eNTAvu6tb56GUi6gUzmjNIC0RGL194jzx9CQL/AUJi/tnUZXc4m1wVb+Aer1um7k15OY7f3BhwXhv5+Zj7fMz5RzCCLPRg5pM/G0nUdQgko89qQ5QfCD13j+QyfaW0tD/0QMTcr9y9zqFs8Djb+Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kBwQBjMA9D4dJxKzhW6/vRhnNw0iRNb4t34pgGSsu6Y=;
 b=GZiWFRA/+20A/Cw0CA9MpXiMwOBbFHI2l0z6AgmE8YriPZNbvQoWcBjgxG+irXjqDhMFXx4ym6tE2OWzn2Zq9Y973hXIbxBEnotpfetLSucthdFFedxdBB1zDVb8PCWjfqDnbVx/JljKA4NTrJMn23SYZODEZVGKTOtrealmwQgi3M8QdF/A9qJm1ZTDmMvh1fNxXwFO1NWzBaCnMiO3WY+DhRsNBrKgdGw1qUiL4pWUVF7/47uaY91hvLPgn3/24fS39bgYvvJZdLtaOv8bfjKIJnxpF9HRy5PVWEYsjbOd26tsAQesXlVynccqnlJqUThTaqaajIiSn8AJLa+GyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kBwQBjMA9D4dJxKzhW6/vRhnNw0iRNb4t34pgGSsu6Y=;
 b=s4b4iQ2yGkeTB7ozTmbCVWiMe28fFePZRgrTSND6E83sIAW9OaUx+am92TtQK5UQI3sSdcQFmhZ/9GsgLMsyQE6fcDMqispVJ9lWC+gGvWuEljjBmIHpdbr88oiB/cX6PRDSVc7j7y6MOlcWOD6IPDes+NdZnQQpRIbSoNRvdok=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB3104.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:167::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 12:08:56 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 12:08:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 12:08:55 +0000
Message-Id: <DFSJYTR1K2QC.T5L4R7HUAL70@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Timur Tabi" <ttabi@nvidia.com>, "Matthew Maurer" <mmaurer@google.com>,
 "Danilo Krummrich" <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>, "John
 Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v5 2/8] rust: debugfs: add Dir::empty() for conditional
 debugfs usage
X-Mailer: aerc 0.21.0
References: <20260116214959.641032-1-ttabi@nvidia.com>
 <20260116214959.641032-3-ttabi@nvidia.com>
In-Reply-To: <20260116214959.641032-3-ttabi@nvidia.com>
X-ClientProxiedBy: LO3P265CA0030.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB3104:EE_
X-MS-Office365-Filtering-Correlation-Id: 0792dd99-78b4-4d25-d96c-08de57538513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eEd2b0lBb0laRURCemgxbjhGZTg4S1FIQmFlNHJBc0hpbkJFSG1rWjYxYmhL?=
 =?utf-8?B?aDRlcGMyUldLZFVDbGRpZXhhRnhEMlZORHRWZFg2RWhBc0p0OERtRnIzY2lE?=
 =?utf-8?B?enpjekpZSFpIbXZSOU9LMVI5UzM2TmgwaEVuSGRaZ1p0M3dxcllQNmNtNy9O?=
 =?utf-8?B?V04zcFlickF0SzBWVkZ2YXNVTUFleFlIMWg1bmFqZEM0cFdjMDcyZ2JrYU5I?=
 =?utf-8?B?amlJSWE1UEg5anJuMTgveVFGdU15Y1hLRXNUaDg4a1RhdU5pRThTK2Y3S2hn?=
 =?utf-8?B?YjJpSHViR29HOTVCeHl0SmZrek1yYlIzaEYrRVZOeTd4R2ZVK0NDZTA1ajJz?=
 =?utf-8?B?WE95c3RHZnVOdnVwNnJWWjFjSW10WmZQSXR0RzhBalFZMEc4WFN2RkxLMUt5?=
 =?utf-8?B?NlFJMHp6V1hjNU5qTXJUL0N4ZE9lckQ4aWRoMUhFVXliZWpoMDZubHNOK1M2?=
 =?utf-8?B?UXNNczJmNnFweGxpa1JHVEZUK1BWZ09neDc5Rm8vcWYyRWdXRVNkdk5rbXFi?=
 =?utf-8?B?ZzZQSi9EUHVpeDhsZzNLN29tNWV5c3RKdytWS0dkVlkzblovK1Q1RTdhNG9v?=
 =?utf-8?B?ZnRLTTNkRHR6eFdLektGNEJXUFIzb2JiOUpaZ3pRVENQSmtubDNIdFBWdTcx?=
 =?utf-8?B?YjVZaVBCSUxpa3hGbWdXL1VYZUhIUjRVek5mcmRTTllFc2NRVmFBTnNramtW?=
 =?utf-8?B?NU5ZWHhwZnp4RjFxRmtGZmFuS1dpRzIvY1RIc3hLWThOSHRoemdxWHNSSk55?=
 =?utf-8?B?V05LY2N3RVFoY3hiaktoOExabjZna0lKK25lVDFWRnEwQklNT3I2cU5rNnhq?=
 =?utf-8?B?cjkvby95TTkyc1JDNVFKdHRvYk9aRlkxWGdVSFMvVElUdUVNb1ppT0MvUU9q?=
 =?utf-8?B?Qm04ZWVDRTluOU5OcmhCNkI1TVRsa2VmWEcxVENSdXY5MFpWZHlqemRpWHNh?=
 =?utf-8?B?Z1hBdXFLTVhOOWNobk5aMzBQSm5YYnlncnBWS3Y1aStRaVFNQVhialB2NDRs?=
 =?utf-8?B?bjFqNjBsNXpXamJoOVU0MEh5eUtJSGRFVWdYYVh4SUhyTERzK2J0T3UvTmNE?=
 =?utf-8?B?TFMyWEtPWCt5c2NBSTR4RWc1R3hQZmlNSFBUdGRyOC9EMkZpdFFMWFpEOFhy?=
 =?utf-8?B?Lzd3RkpQR0hQNjN0NmtSUTZhRC9zSVU2d2xUS1M3ejM0djVYeXE2TXhQbmVO?=
 =?utf-8?B?a3V6YVRHTTdwSko4UHBUSmVYeTc0bmxDVm56Uk5DR3U3MEQyR0RNOGxoQXps?=
 =?utf-8?B?eDZaaCtwY3hJb0N0UFp1SXQ1T2diUXd4SVNzSkUvUzVCNFJiN05uYThBUTlO?=
 =?utf-8?B?ckVnbzMwQTVhNFRIczh3U2FyUU5pTGJoVnQ5QU1iWmcvbTdMeVhCZDRMSENT?=
 =?utf-8?B?R1p5TFhTT21lNU5rOVQ4cll1Q01HOXFBS1pzNXBXQlh0UmJwOUs5WEp4QTRV?=
 =?utf-8?B?Vjcrakp4dEVnNEw5Y1owYnFhUWl0YWUzSExkQzF5QVEzc2JCZHFzNGFYcm5C?=
 =?utf-8?B?cGwxbFlFNEZFbjhqbWN5anBRR2R4VFJQZm5RTjhzcXlDZFViOC9BbW83dEVO?=
 =?utf-8?B?TVZOTkhCQi8rSUY1OVJ4dXNqSXllcDEzZURXVG5yT2drbTFkN2NqdVRWSUFq?=
 =?utf-8?B?Ym9abTZ2MzVCVlNNSVlLcVh2Z3FSc2VLRS9aYUszM3FDWExDb3JsTFZZaU5x?=
 =?utf-8?B?YnFVRXRjTEZSRXBBU3RFdnhQUFdqYzhOMXBPTHFqcWg5UThMSXJ0dlBnT3Z3?=
 =?utf-8?B?OVNQZVV0ZXJ1aVQxamppQjR6MVRzdUhkVTZBNHg5Z2RoVnI1SlRWY200bHdl?=
 =?utf-8?B?ZnlrUlBRNlB5ZHA3OWUyZjhDVXVBNXRnMmNRenJRK3E1dFlSaGtFZVdtaEo4?=
 =?utf-8?B?V1BaUVliYlVNSER2R1FFU2VaQzArZTNmUUpVbzlETS9LN1VGTkhMbjlVeDFz?=
 =?utf-8?B?Ums1WUtQeU13NEFmdnhwSDd2VWNMMmpjQXJ3aUsxb1ZNNTRqa2JORzlhc0h5?=
 =?utf-8?B?R001UWJhaEJIWnlTc3NDVURhVHJxU2NjOG5RZ0NFNHlyK3M2T3NwVkNPN0d0?=
 =?utf-8?B?NFRBSFJSTTZOdlhNdmhQaHIxT1duR0lmWXhaSGVDUkpjK3Rhek5jUndCUmF2?=
 =?utf-8?Q?1yp4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VW9ZblFBQmgvS2tzZkxQYnVDSU1KZzRwTU04djJyNDdXeXcxTGZwNGRPK3ZK?=
 =?utf-8?B?VVYzN29sS2JERU4wRDB6ZmRlRE9TSnE1ejg0M2ZjZjJxMFpMejNwbDgyUCsv?=
 =?utf-8?B?aE9KN0hkdWg0WFhEelVmcnpucUVoYTJxdHNuMzVBYkRobi90MVkvME81NVAx?=
 =?utf-8?B?M0pkcEZHaXVWVDV0cklVM3JwOFMyV3kyVldsRHp1ZzByNHY5RVVqNjUzMlZO?=
 =?utf-8?B?MGpEd1dTRmRxUVM1bjRNL3BYdFkyNWV0bEVlSGNzeklPZ25sNTdIWjRJTFlq?=
 =?utf-8?B?MzhIMm5vVnl3RHZUUzJDT0xGMHkydkNSRHpqMXlCa3NoaVp1QnM3RWpGTVFV?=
 =?utf-8?B?Q254UExabEZRaTlPSkpQdFF4blJIZ05tbm9oZ0hFaEw5TUtkZ1Fqa1NWVmMr?=
 =?utf-8?B?TEFTV0t2NUxKcDVJLzE3djNoSVVaaDNnNGVrQnVrYjBnNVZoNU5DR3BsRzFo?=
 =?utf-8?B?YU8rU0w3SWdtVVBkUXBWa3RXZy84cDdmNTZHTVFuanlQOWRXMlVNaUVuY1pB?=
 =?utf-8?B?dHA3U3RxSjNoV1BtZTZFQUFodXVMaFcvRW9hMXlVbTExT0FOK3VDZk9QY1Bn?=
 =?utf-8?B?KzJVbk03VHZnZTNiZmw3Q05QWmJSRDU0Vm9GS283NzJrdldyUWVjTVhLTy9Q?=
 =?utf-8?B?Wmc1UGROQzJwWDZxTlhSR21FM3Z0V01qbXNnRUxreXVMNHZsNUw0d0pQSVVm?=
 =?utf-8?B?VFBFYmViTzdFaGxxd1RJTGpvK3VuWkFlZFFLK3dJTzVxcFV1Q0RIY2xSY2lt?=
 =?utf-8?B?VU9zYXh3OTlqeDN5eE5qZlVxTkZLaWtLMWxSZGdkY0RpblU0V3R0dTVHcG1S?=
 =?utf-8?B?OG8wVXIvbWY5dE83SHZiNTJJMnl2eUJhelF5bW04YlJ3MVE3bjZoM3luMFN4?=
 =?utf-8?B?UXpRbHZLUlFGNDFqK1dXQVh5a1VBNk1Cb01hZnFtS1ZqTUg2d1ZIbWhDdXM4?=
 =?utf-8?B?UEtHVCszV1JZSDdVVElMc3dWVVA5WUJYRFExcldWWDh1M3F0MDRVV1lla210?=
 =?utf-8?B?T3laR3ZBUkJ3VDVXamthMkNONlBqR3Q3d2ZZengydkk5cC9rbWVDTUpKQnJ6?=
 =?utf-8?B?WXhnZWk2RndSMlV5b25ZS2JFZXF3Q0d3eXREMkhyajFsU1Irb2hiY1dEZjYv?=
 =?utf-8?B?QWpURHlTcjMzVE94U3o0MDVVRjBZUzZSZUNvQnQzZDA2OE5QM2pIY3JTV0Va?=
 =?utf-8?B?SUNnWFNLU0tIOS81OElpYXRWU1ZVNFpFR0FFaFhQS0lQUDAvQmlkekZSUHlo?=
 =?utf-8?B?WUpHK3ZWWFQ2L2xNajI3R2RLdzhuSGhUcGV0aEFrYjFJdkhQbnNJSCt3QUpy?=
 =?utf-8?B?RVc0VGtUS0hxakVrSUlVTnlsVW1saFAvYmNYNFJLQ3RHUVJvQ0hpL20zSEgv?=
 =?utf-8?B?RENNdzUvZURhc1ZwQkNKdURxdVRLUGQ1T3RGbjIzZW56T2YrRlplUE5zZmNY?=
 =?utf-8?B?Tm5lUjRzV1BkSmlvZWQvWFZKLzZUZ2ZCNnZ4eHlraTNTUmZMV3dSRnpJT2Ir?=
 =?utf-8?B?S2ZnSVNhbWRFQ3UrZUp4R0liTEQvVkhrd2dscVlFQndjVm10OUlBb3lxajB1?=
 =?utf-8?B?bThFT3B6eS9jNUlpT0tzRkNmZVdCQ05rQ09DaTQ3L25wNDZKRWJDaUJUY0FS?=
 =?utf-8?B?UVV6WUl3THc3QW9VcHlpaHV2MmszRkdKOGZwaGF0NTB5V05OYUs3WVpoY0Yy?=
 =?utf-8?B?aXRneGZ1UzdTMk5Ib3RRaVlFVGtEWHJkNkR5YmtoTkVhcklrOG5McUJiZEVQ?=
 =?utf-8?B?SEJDRjlRMzduRGhGb00xanlWdWJ2ckJ4QTQ1aEhYbTA2Zkt2Zzh4eEc0ZHVU?=
 =?utf-8?B?TStGbUFQNGJpNFg4VnZNL3BMRDh2SmZjMW1TNFk4LzcvNXk3RjRIb0NnL0Iy?=
 =?utf-8?B?QTFHZURURld5THJINkVkeStJVm9SZFV1czVHMEdkS1JZdmZna1YxMlBWejJL?=
 =?utf-8?B?alR3c09ZeUZ6TjlJUlRsKzZIUXE2eEhUWkYxblg4VDNHRGVHWFZpM0tSdDFC?=
 =?utf-8?B?dkVNK0lxcWhURDhjTFBTcklKdGMreGhuYnRESUJHWEZVWldnMjd1WXZTb09y?=
 =?utf-8?B?SUZkNzZvZ2RnTWpRUXF1UGZzS0dWVW9Va1BFOC9XcTI3eWFUSzBWRStoSVdq?=
 =?utf-8?B?SXd5RnlzckJxMVAyK0hWa29pdXVzam5IN3c4RDN3aHl1WDh4TVBkaTN4bE5X?=
 =?utf-8?B?Vm9EWXhsNzVsVU5GNTVReGRsYzR4c2hZN3FsRUk0YmxudU5jUVV1Ukd1Q2RG?=
 =?utf-8?B?bzBXKzhuMzZJL2JSalNaT2lQWGVOYUNvN0lBbW8wRllwUEs5YzFPV1FZUVM2?=
 =?utf-8?B?YmtVZkZOdDc1V0FzMkZvN21qVzQ4TTd2TkQ2Vi9qMzAvUklMR3FxUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0792dd99-78b4-4d25-d96c-08de57538513
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 12:08:56.0697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RQb5aHngxbt+IrnIwG6D7T6u2QVVMXRZA8Yr4CnIrkUlNqQqASb572bkmx9r1yr6T/2KfWVMOWDzUaa+Ses0sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3104

On Fri Jan 16, 2026 at 9:49 PM GMT, Timur Tabi wrote:
> Add Dir::empty() which returns a &'static reference to a no-op Dir.
> All file and subdirectory operations on this directory silently succeed
> without creating actual filesystem entries.
>
> This enables callers to use a single code path regardless of whether
> debugfs is available at runtime. For example:
>
>     let dir =3D optional_debugfs_root.unwrap_or_else(|| Dir::empty());
>     dir.scope(data, name, |d, s| { ... })
>
> The returned reference has 'static lifetime, allowing initializers
> returned by scope() to be used outside the immediate scope where the
> Dir reference was obtained.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  rust/kernel/debugfs.rs | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
> index facad81e8290..44ff2b37786a 100644
> --- a/rust/kernel/debugfs.rs
> +++ b/rust/kernel/debugfs.rs
> @@ -110,6 +110,24 @@ pub fn new(name: &CStr) -> Self {
>          Dir::create(name, None)
>      }
> =20
> +    /// Returns a reference to a static no-op directory that doesn't cre=
ate any debugfs entries.
> +    ///
> +    /// All file and subdirectory creation operations on this directory =
will silently succeed
> +    /// without creating actual filesystem entries. This is useful when =
you want to conditionally
> +    /// enable debugfs but use the same code path regardless.
> +    pub fn empty() -> &'static Self {
> +        #[cfg(CONFIG_DEBUG_FS)]
> +        {
> +            static EMPTY: Dir =3D Dir(None);
> +            &EMPTY
> +        }
> +        #[cfg(not(CONFIG_DEBUG_FS))]
> +        {
> +            static EMPTY: Dir =3D Dir();
> +            &EMPTY
> +        }

You can apply `#[cfg]` on the static item. The `&EMPTY` part doesn't need t=
o be
inside cfg.

Best,
Gary

> +    }
> +
>      /// Creates a subdirectory within this directory.
>      ///
>      /// # Examples

