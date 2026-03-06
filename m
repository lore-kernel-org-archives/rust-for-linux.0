Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010049.outbound.protection.outlook.com [52.101.46.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B616B311957;
	Fri,  6 Mar 2026 15:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772811371; cv=fail; b=pvsJeU6TZR4BiPj6w1I+4DJ+ICsilOO8WZhklsy/NgHQkm/1JRhnGNxpXnpdzny/PX6Dh4VEEXuDhkR9laDAwT0nMnGNEn2HbFGKCsgcjob2wq/QrDZ9WMylnA8YhprJRcNYtmxL+nBCM7hf/ZPyl8d9MIV+ezGPapQ4PDaLA9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772811371; c=relaxed/simple;
	bh=l4+p8x0cEIWevGci+K0SqjHPdgdyVjg10k95IQGqgZw=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=C8TU0MHtKsHJFe91NQlnyrnhX6eTDwS3BtVakAobndkAXa3oOity8FVHnajnHUbhqMQaHR/TQZ4yMjQziqC58QHDFDAPE1GP4zT/iNf3cHQ6gafr2zTuSPY33F0KAv2Vclqfgc4HLcDoF96CLfE9MIbIujRN5MfOWcUSKvHlU5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JozaD6Ts; arc=fail smtp.client-ip=52.101.46.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JozaD6Ts"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IL3x5CVdE7tQ3vJnnm/V6RlNqeEOp7NwwP+BZWzpOkBRa/z07fg27BSmBetbp7+NfIVBBw6KjhBpWvwMIoX1naxaGGCKWzEJh3/xjPdlfA1EI68n3wNz0ePUMraFMQ2zYfeJ+W2bYo9PM1umfmH9y61CvPHAIvhhAWCE6lNMD+hRCwrY3XgVqB+E2BfuvqCKz1F/lZNlax6kdyzhEVXRlOu4HF78aJXttQfghB565EAQz6Fy4Ce70ydAXt8RSrxabT120eE6ZSGhH/HCSCYoFV7QP29qj4YgSDO9OgvKskVWvXUdM860S0SBm5RYxHaXul9boIXQRAo6HCljS/z2Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nB4V8DQB1o+0PphnoyqmO2x522O2Rz683187+cwbzk=;
 b=opTkvwevRZhFjQGsrAPstxU2Xt5O9lXHGrAViqtWcHFcC4bDhOhWY2NfS9ispPr90Lqx1q4X7dZSHSU07QCqKnvuTsLc8C3O9MsfC+85HT0dgikN1WIpCnh7A3WyveSXLOhdYZEb0mgBNue6iL6Gp5Ty+PkQEA1U12mBeY+Jzy4Zgbl4bRNYpW/wT+rTlx0edm8AnYm5kD8TzC5sFY8XEBxoEkCT6d7IwdrcgykyD5MemIdeLyRb32IPdthpfZUpE5Ok51Mv/lBpfaVzqAjS/tlXvqTH9hIxCAQoyiWk9uk7LdL4mefiiUobfebveH6o5XPlMm+NcQQuUXPftMYBng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nB4V8DQB1o+0PphnoyqmO2x522O2Rz683187+cwbzk=;
 b=JozaD6Ts4Xz50VWzItv/ulItR9rd4ywNIRwL55sI6PTUat3CF2NNfuEG/qonda0DLh6Jlp27MFldJsQctjWBZHUIL2/TDyp4OrpQfqq68fJk9WOCTxNpBho8PmDoEZ8R3mc4SkIKukvhzqB7TvbyWxE7Bjpm4zGpMYcBbWcf8gvruX07gSeEiOHNgtGqgLT+oeYu7lx5D1rkzKhlOuFhZMRlI/vkoysCUykwnDfMyIjs09C6CIZIocV1GrkP7CminCQ8yBj/+7PM9H1uSfqoNcka5WMhNT6yJ+7fwiBbN5DUdpcB3HzpY5SV/Re1Jo5OECqwXOB7YF+6CgtENYKn9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV8PR12MB9690.namprd12.prod.outlook.com (2603:10b6:408:296::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.6; Fri, 6 Mar
 2026 15:36:02 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 15:35:57 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Mar 2026 00:35:53 +0900
Message-Id: <DGVT6CO48ODV.LBNNPQZ5PVV@nvidia.com>
Subject: Re: [PATCH v7 05/10] rust: io: add IoLoc and IoWrite types
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
 <20260224-register-v7-5-aad44f760f33@nvidia.com>
 <DGPXX0NEGDZ4.1PKJR9IWL2FS3@garyguo.net>
 <DGQ67S1NH3OA.2MS0YVO0UU2E2@nvidia.com>
 <DGRJJA3068FV.3CE7J7SKLTN8O@garyguo.net>
 <DGRWZVJNLLH0.39JYHZIIMC9XK@nvidia.com>
 <DGSB81ZE18O1.31CVVHMP38U2W@garyguo.net>
 <DGSBMKY53C5T.3BRV3QI7KOZTL@kernel.org>
 <DGSC6U50TCHF.9FKDO3AWL3Y1@garyguo.net>
 <DGSZWZCI0H7H.2EM8L04YH0YRP@nvidia.com>
 <DGT09KTYDCU8.3BBAZBGIYRGWV@nvidia.com>
 <DGT8FQ97BL8O.1VC1JEXIEBDRA@nvidia.com>
 <DGU4TLDMLFN8.1KKSL2WATFZ7G@kernel.org>
 <DGU7U81KKLCD.2LEPJ73BGLQU@garyguo.net>
 <DGU88IHVRYHD.9WP9Z40UAN37@garyguo.net>
 <DGU92W2W71JI.HBIFK6L78F9C@kernel.org>
 <DGU9AZ43QK6Y.115RDSK0M9JY5@garyguo.net>
 <DGUAC0GJRR0Q.34WBS7BIZ58WF@kernel.org>
 <DGUB44J4FNCA.32QOV1DYI7VBK@garyguo.net>
 <DGUBN1HP1F8I.2RZGSFCBO9FQS@kernel.org>
 <DGUCFC9NJG5B.Z7YUXK4NEE04@garyguo.net>
 <DGVGGGBSC9PI.1TJV2ZAIML0BI@nvidia.com>
 <DGVMXCZGEWV9.41R0TPTD22S1@garyguo.net>
 <DGVNJ8ANGP3Q.1RAGWU2HJGRIB@nvidia.com>
 <DGVO2O009306.GNU06PZ13VA6@garyguo.net>
 <DGVPNC2HE0JB.1HOBJZX8L8XMQ@nvidia.com>
 <DGVQAUVL2SZZ.2TINCJXUIDTCK@garyguo.net>
 <DGVRU6S7WUIU.1OL2CZU2ZUIUO@nvidia.com>
 <DGVSN2EFJMD9.16GG2818PR9Y2@nvidia.com>
In-Reply-To: <DGVSN2EFJMD9.16GG2818PR9Y2@nvidia.com>
X-ClientProxiedBy: TY4P301CA0104.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37b::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV8PR12MB9690:EE_
X-MS-Office365-Filtering-Correlation-Id: e211e332-1530-46c5-38f1-08de7b960ff2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	n3Kq50VSqlU3aQpSBKXCMDCzwIV4VEezF2IoJn0k5b9QRCZiTVW1IbW+j9QCxwRco6PEjbx/msbD6whLYjzLCReTgNgVKk0kRFOVKD2i1w9D/grlaoWN8bkbw7fbMELwleZuYs0b2HA9KC40wUz7DXEgqkwIqfmBYEaqveh17aD2O+Q7rZmsNYmuflpUXvEgS3mANm2XTzD6IaHu0vT2y62LClrQ41EQpyWytNModM6Od1VrOimm3mmEEBprLaESm8TYvhf34gB9gxH/A8WCOFGnSTYUds53iFjIHst4y1lGYUD2690SmptT6uDcPsZTE9LEzHAb3RiimuNm+jsXKq2/Jtzdt5uyQa0qr1roIHPEwT5AZIA0NQBmTOZil+T8uDWEUte2tTOd6Tq6NilI1LrBUqGk09QxjT9IQYMYGB3sIbmAAvi5rfqnso/2Jzmj1AwYAStdQdjrkT57S5GxsB7KxSPipSvlhV++QJw8NPQPzxQpNzJynKjLBMz3mbUIWOFYWOUmCWSF2PixX2svqEQb/AG/VyyerHgXJYcZuFlAfOOz1ddrpsdsAYpWYH4bKMX8naWaeQ9Jg9R8q1yp7FVPPF8rh5W9T04JWiqPm1By8vt84mOYbMcdMA0w5ih/tih9rlbj3Loli2ceoD8rSweJ7Ov7xtMH/GX7iMpYShfNiJ7qSBuX+HMZU1SsCf8FLioa9DG82v6seFDb03HUUtabfLHS/fDkaLFrIOoiC9I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTdmQVE0LzhUS1o4R0I3UDBrQlk0Tlp2MXBBSUViSExNd1MzaC85Uk43dGpV?=
 =?utf-8?B?ZjRyMytaLzAvaVZ4dHd4RlQvWDUvN084V1F3Z1RvYmdSN2d4bWJRWU9tMlJm?=
 =?utf-8?B?Y2gwR01uUkNLYjZ4VHUzSHVsZlhRSFRtV0FMSkFlT2FYWTVsa3RTYm5oMjFu?=
 =?utf-8?B?VkVUYkMwN1hlMXcxY1Qra2UrTmRKMnQyK01tUFZYZ2FxYU4vVW1NdlRuRXV6?=
 =?utf-8?B?UnNPZEQzdDFSeEVVWDBLd24rRXhtczAwQ2NVczFmTmpna0pzWEtGaStLQUM0?=
 =?utf-8?B?NWMyam5xbTdhRXZCS0VsRmpNeEMxbTNpZTFOQVgwZ242QVlzNG5lckpCKzd5?=
 =?utf-8?B?enVyTGVyZHBMcWhVL2pNbW4vTG5HMW5iL1E1L2RmeVJaL1ZMOG9NbThvb2Zq?=
 =?utf-8?B?MmxjMzdkQWdGdmptUnRMTlpRMHN6MnVlWmxqUjRGWE9MSThWSFlMYkFSLzRk?=
 =?utf-8?B?YzRLZDBTZHZ2eWFjL3phYXIwRlF5YmlueFR1OTFKVWlEWnVEZlc3eWlMb0xI?=
 =?utf-8?B?dE9WdHZaOVpnMWJjN2V3RzFmc1hCL0J6dzNTdm5vVkhhTW5tRVcrV0tVdEFU?=
 =?utf-8?B?bkZtVU13NzZpRnl1NkFWTVVwSUhvdER5Um80TWF3QUMwNG02Z1JCTXNZV0xG?=
 =?utf-8?B?YVVzdllNQ2tTRTNOVDhRdCsxYmJ6VmcrbTU4Ri9pa3ZhRzNObjZ3enhtYmFr?=
 =?utf-8?B?T3JsMGtSNWhrRnNDZTd3c0U5V3JOLytOM0JSbVpyM0czSFAzOUErSXZSSStm?=
 =?utf-8?B?U0d0M0hCT3NWcHJxdGozM0oxcW5sK2ZqWE56cXBkTzBvcjdWQ1VBUm1YSzU3?=
 =?utf-8?B?Z3JpNUV5QnJSUllmU0IyOEx1QmJiN0ZTcnIzRHNZbTFCbzdCZWF1OE5qRzVE?=
 =?utf-8?B?QyswaTVMWjhsMitFVGhHcElDMDFtcDg2VnFjWERoTUxsUzlDbVZuREN3RGRu?=
 =?utf-8?B?cXNaN29zZDQwYnc1SlVGVk1FWFVidnVZVE9LN25PemJCZDFhalJXcVEvbi9B?=
 =?utf-8?B?K0hNRWFZUnJEd3NkMUVYUXBsWDZjd0ZVbDRYTElyVFExaURyd2dzNkF0N2Nm?=
 =?utf-8?B?d0dBbUVOV1ZWaldDMjhOUnlWQnFGRkU5N2lSc3Mrc2IvSkNRMkRwekpGekly?=
 =?utf-8?B?bExSN0hVVGg2RWJPNWd6YmV1VkQ0Tzk4dkpZbjFVQ1JVdVNjZExRR01GeDBK?=
 =?utf-8?B?MlgxSmZwNCt2MDVMdEpHSStYVVZFa0xRSUo1SHNhOW0rYjV6RFhVbVpOUVBU?=
 =?utf-8?B?NWdaR2JWcTUvemh2N1hTcTcwc2NUWmpFTVdHTTI1bmNJVUVkeUE3MEtMYkVu?=
 =?utf-8?B?T0tEUytkbHZNVGVjcHhwdzg3TUZER1ZRbnBCamdyaUdUcXJlaHZqSDRZZ2VD?=
 =?utf-8?B?eUh3Y2d5U2FZeXJlTUtvZ2hRVVpPQjJDbEZDWlVzSDNrbVdzNHpRUW5UUlE1?=
 =?utf-8?B?eXAvTUI4R25BdUVlWDlXVlVLcTM1R0tBcDFVNlp3bEZlUXI0SDd3M3praEpL?=
 =?utf-8?B?cEFXbHNTallYQ0VpaGxrbDdFdmp5RnlCdzhwOEpaQTVVUlJYdGpjeTM1eExr?=
 =?utf-8?B?RDlTR3RHOVlmR054ZDdmOTZJeXpEa2tQbkQ1TnRvTHVYUzUreVA4V25Dd09T?=
 =?utf-8?B?eW5vSGpmYkdUVWV3QWZiOE1WTzMxVW9GK0FpbVRIb0g3Mk9TNmRJanZjYm84?=
 =?utf-8?B?YWVWTFVNY3U4TEs3MzNhTkJ4SlZOS2JYdlVrYUV6cXhSTlJRVVl0aU82VFdU?=
 =?utf-8?B?WGFxOHBiZ1ErdXlJSEkzb2ZpaHZhQmp6NHJURTg2UUU5Y1RJSmQrRWhQVVl1?=
 =?utf-8?B?c0ROWWJ1L2lvZUNDV1EvRkpFTnZub3duVkJFa1daU1pKaGo3UnZXK3lpWUl1?=
 =?utf-8?B?cWZzbkFSdnFlR0diR1dxWXdvZlpkNTlrU0NLbG9YY1loWG9JNXJVTzJaVUpN?=
 =?utf-8?B?YWtvcjVrOWQzc3I1L3VPRGhXbElHaGsxUTBLMGF3R1huUXA5ZWphcFJMazE0?=
 =?utf-8?B?N2JmTEk0cWZlM2krWUR1VXNDRURWZzg4L1cxaGg2VVZmMkJSczlhdGpSdEV3?=
 =?utf-8?B?Z0dLNGRRUVJZMkVNYTdseEVjcU5jOE1ScEdsNzI3aWhGMGVaUXM2RTRwR2RM?=
 =?utf-8?B?YVpoKy9zalBqTnlJMzI5bmlVc0oxb0d1VmhzVThFaXRrQXdKRitNNC9EM2JT?=
 =?utf-8?B?eXFLOUdmU1c3aHlVMlZtK0hzTWVaMkdJTTZMVjNhdG5JQk45UEN0YjNaUW44?=
 =?utf-8?B?cWZQb1h1VmEvMGRnTFlWQlZ6SFE5T2wvUWkwM0ttSUt3VDhEd1RxSDMrSml1?=
 =?utf-8?B?UnQrRFdyQXVzTVJNWWxPQzBWM0M3MEJ4RjAvRDVkN0d0cm5UUGZJU1JMKzBQ?=
 =?utf-8?Q?ebxluHHyNDOxVanZjI4VtFcTwxeENiqIPq0YKkJbDPPUx?=
X-MS-Exchange-AntiSpam-MessageData-1: HmpJKMfEGnOisg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e211e332-1530-46c5-38f1-08de7b960ff2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 15:35:57.8025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zkJbrNaI5pswcRKJgaiPmMD0AQnc4gH5iDeurAg7j1HSxR/J3hd3tNF2q0qxFaNSlcGg8ver+tDf14aC2Isolw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9690

On Sat Mar 7, 2026 at 12:10 AM JST, Alexandre Courbot wrote:
> On Fri Mar 6, 2026 at 11:32 PM JST, Alexandre Courbot wrote:
>>> `MyRegArray` here is a type name that is a bitfield and not an array. `=
foo` returns a
>>> single value and not an array. "at" here is saying that the register is=
 at a
>>> specific location and doesn't really indicate the array nature.
>>>
>>> This is why I insist that I would prefer an explicit location
>>>
>>>     bar.write(REG_ARRAY.at(10), Reg::foo())
>>>
>>> would have no ambiguity whatsoever about user's intent.
>>
>> IIUC `REG_ARRAY` would be a const ZST and `at` a method returning an
>> `AtArray(usize)`? I still have doubts that its generic type could be
>> inferred automatically but it's worth giving it a go.
>>
>> If that works, then I assume fixed register writes would look like
>>
>>     bar.write(FIXED, Reg::foo());
>>
>> Unless we have a specialized `write` variant for them.
>
> So, I tried this. It seemed to work really well - but then I realized
> there is a problem:
>
> The constructor of the `AtArray` needs to check that the index is in
> bounds for the register array. And to do that, it needs... the type of
> the register as a generic parameter. So we would be back to repeating
> the register's type in both arguments, unfortunately. :/

If we add the register type as a generic argument of `AtArray`, we end
up with exactly the already-existing `ArrayRegisterLoc` type, which
performs the bounds-checking and also implements `IoLoc`.

The last remaining question is whether it can be instanciated from a
2-arguments write without repeating the type, and yes it does! So that
part does work quite nicely at least.
