Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FF823D2B4
	for <rust-for-linux@vger.kernel.org>; Tue,  5 Aug 2025 12:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754396120; cv=fail; b=BEhg89xNYItepb1ijAXfMk9VUlROQWR4w5gd6AUWFTpdWVJQpCMtKd2r+cISRLaEA0u7EybM5a58zK8b5HEQKFHHqDS2DdrP/PFIrkZGTlC12Tx3M+Nj0pfR6EGRLlTwxUrTSQygxIZKFDvCu+0MIXUnHh9ou2kx4Y1ibVK8oHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754396120; c=relaxed/simple;
	bh=MmSXm0Km7n0zUZJcjyj5pBwrilP1CIKo/jC2D3RdTxE=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=oXxZMtPSGm0sYYzscq4ViGZjyYSdKDTBQXuMh4OvhQjkwrZmF5oTr3O8NIB1DMrgWE2ixPclBRXhgP5nuBEMfWGsIFgznwoGE0RfxvZSqcEwBMAUufb0CAOB9OYR4Pfyznuv89AWMLiLeM/vSCg/0vCaTzFxpuy6iPkgw/qwO+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=P+3KmuSz; arc=fail smtp.client-ip=40.107.92.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="P+3KmuSz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f0BACgt6CrL1OLHA1D7pUxg84Nx5Q5KFLar0rSbzH2QA/rYYe6a931fzn6nChf5nlrftDrpVQ7B8fexEXSOKdls2xfeHvA56v2m6VvqF9Bowq0KIadPYAq0XxILb96YxNHOmSdddqUV0gMzohGbGvhgg+R3ijTIeb5cFZhOkuaRj8OPuPDkqbGNfUgFLY+8Nnt50Ik9LbYsETcJgIAeYUhUmudc1V519DAx7aX3cdpJDOaKoNIrbqt0qkSnHbpgHSz+pSwwhlmtxuP6hXKQDwe5QcP+oOUyLMaxokzuqXYupxOhWM2Y7fM8tIK6Tf3sPHnnMgxZxqOdmwxON/5IckQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MmSXm0Km7n0zUZJcjyj5pBwrilP1CIKo/jC2D3RdTxE=;
 b=t87TZLEkQqrifW/pM1jpkEnATd1QUB6AwimSmTqCu0tvH2AbH/O/H5utcNAWIMcSuu0V3JaMM6VdyZsPSHsl/N9Vg1DCE7TJ/9dq0V0zERDPUdvB6pJJaeTbpW1Q8FLyN6qZjpB7JLF5HaLbhfNjfl/zvBAewbYrzAbOSlicF+7W9LCkkM0H94BhlJ8Je+QuvRszRaHYpAUjVEQJK99s5mNRtfC81cYA4Rr1d/aF2Stw11hgYl46efJZKKYi6IFlruVQl9LQTgIEOuSzhnLvPyNiUufHUP7zkErpXzSD7zFXsBo6BVUQIe9+xhdvpXGv/Rl0Lb1N1g27G4JT+thjVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmSXm0Km7n0zUZJcjyj5pBwrilP1CIKo/jC2D3RdTxE=;
 b=P+3KmuSzgTQYvJIBibWFKG8SYDPAyuW+mKr5k4XUP0U0bCFYQ9CxPDfeKlNSSeeaP3H3GX1eYW0eORk1471CEpSDeinBQFStPuxLMVbjChDaocVi5JQ11BQ8jdOUQq8UcvhqN3UPdtFH/s42TaAphmsDiHVj/umh7r5R9Sy/XYwkacJGDRQzG6mrwj3COejWBCDmFMC9tuC9uzsqxrNJqsMpvw54fPJk8b+NiJ3am7kJiS0ftvW4cGjqEgyFZysWIyUZU0c7Gme8jn+gdjcPJZY8hOhfgeou5w6s8QC7MGd0sm9fQh56KgIcokK4og64LhwQ9x1XP3AA/8SWBslQKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW4PR12MB6707.namprd12.prod.outlook.com (2603:10b6:303:1ee::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Tue, 5 Aug
 2025 12:15:14 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 12:15:14 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Aug 2025 21:15:10 +0900
Message-Id: <DBUHIMP0I1TB.1DYCBGC1EXU2R@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <abdiel.janulgue@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: page: implement BorrowedPage
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250804195023.150399-1-dakr@kernel.org>
In-Reply-To: <20250804195023.150399-1-dakr@kernel.org>
X-ClientProxiedBy: TYCPR01CA0062.jpnprd01.prod.outlook.com
 (2603:1096:405:2::26) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW4PR12MB6707:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b4dc796-1d5d-4e15-6d54-08ddd419bb37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U2QzcXd3a2FKVFdacVNDdUFlRUJ1THV1WFlJYTRFME4wZlVUODRmTkNsRHlX?=
 =?utf-8?B?VVIvc0NPdFhpMEhFK1BIT1M3L0t6c3d1WjBJL2pOclRjdkNoMkpkbGJYUnI3?=
 =?utf-8?B?cW1NeEthdW10ZjdCaUo5VG1TTUFZVHRybzExTGRUN2NJNGlSa0RZZ3N1TW5a?=
 =?utf-8?B?M0hxU1l3b3MxVHRHY3o2QmRtdjlOZG9ra2V1ZkJBQ24zc3I1NnFvQ2pXSzBv?=
 =?utf-8?B?ZUVYRGxPdU1vZ2tJWGthU1BFYXE4VHBXRE41bTJpTmo3SlFOMnY4a3h4WFJp?=
 =?utf-8?B?eUVmMmFrREJoUW9oZy93VkQ0ZUZGQXMraVBWeDV5UUlkaThiSTZXY1YzcVU2?=
 =?utf-8?B?Ui9NeGMwQW94Ym9neUNtenREUGJjRGtiV0RkNEVnNHhRRGNrL0o0aFMxU293?=
 =?utf-8?B?UkprWUpiVnl6MkdUUmRoMkpDNENGMzZEemhnWEZXMytPQmtjZytYcHU4dHdj?=
 =?utf-8?B?ZVlNc1R4OGY0anMyMVBjQ1Y5Q3FoMloyYjhEOVV0YS9nVjEySHpXV01LYnFM?=
 =?utf-8?B?ZTlyNk1WNXMwT05sK1IrK3Z0aTgrdkJtRTBPNFFEaXhuYnZ4NStRTTA4bTFx?=
 =?utf-8?B?NTRwMGVSWWlvamNKa21NNXpnVFBubDQxUng0SnlNTjVteERaVHR6Yk91MU9E?=
 =?utf-8?B?eXNJQWtxTGVNVG9FUzNZSTd4Yy8xV0NrdUtmNkRtdnhQalBSdXlCK0ZnUnQy?=
 =?utf-8?B?VGliUjBhb0diMDk5QkJ1RmYxTWFja2MrQnJTQ2pKcEEwb1g5MkpSMlBCMW9C?=
 =?utf-8?B?b3I1c0NUTGYxcUo2OFp1bjllQVlZUWFnMWN0ajlLTDZRTnhyNlhGL3BVRFA2?=
 =?utf-8?B?aDhGQWtDOWtzTjRibTJNRGNFTWlydWxZZkJIaCtmN0JZVUE2TlUra2RPVGdG?=
 =?utf-8?B?dDQ1bE8zOFNxMEdZSStja0pEMTdWbndJU2k0LzQ2V2RwMzZBR216ZzNickRI?=
 =?utf-8?B?cEdqeHZlWC9PQ2l3dHJ5a3M5b2liU3JkOVFOQktVR00vTkxWeitWOHFjVnV2?=
 =?utf-8?B?WC8xZHIvOFVVdTlocDRYSkRib2czR2hBdWJJS3dFdHczSGwwTDlzS3pRNFQ3?=
 =?utf-8?B?YjUzSkRCQStDK1c1elk0enNOL2JraUR1Uy9PTmEyVmI3c2FMUzBNU2pCbXRo?=
 =?utf-8?B?cFpvRzlWb2IrOG9MMCtPL3A4dnl4cHErSGw2QlplVHdUaFhXTjJJbi9DOWw5?=
 =?utf-8?B?TEY4bFJuUWlVbXhFMkJZV0hUWHNLa01pMlJ1S0JQTWFnQzg5MTc3SXcwWVdx?=
 =?utf-8?B?eWlRcndTbzkzQ01jV2k0cUw2aGFweGNZNUlQcFlFRXpMYldCTThSOHRVTi9y?=
 =?utf-8?B?RS9LVk82WWRKajRhTEZlb1p4UXJiUmtUcCtrWVhnczU3VitZZmRHSnFTR1A5?=
 =?utf-8?B?RktMclBqb1V4NG5LeG94dVRIbXhPWEVqR3RnRUFRa3FFdXJhcVdGOXhhenFI?=
 =?utf-8?B?WHloTVQ3Q0o5eFg3WE1KK0ZVdjl3NmhkY2RjNkFVckZoanFHaFkvMksvejU0?=
 =?utf-8?B?c21kaWhCS1B4S0FTd05DdCtrQ2duTk45bXpFSVZTSnBWWVNncVc3dWpqR1p5?=
 =?utf-8?B?blpDbXd3c3gzTDlVTEpWT3lBQVlVTHVXeTNEd1NTTDhhOWxXbTRiRUJ3YXJL?=
 =?utf-8?B?SXVWVDg3OHgyMjUxMUdiMmFQaWJhb1lGMERoR2hUVldDa1VwcWhrcUxKS252?=
 =?utf-8?B?NTVCeGVZMktpRnMwdjlPK2Z1MVc5RTFoOUxNcjBtRDFLVXZyV3VHRmJSWTNN?=
 =?utf-8?B?Q2hCaTNXQWpTc0NtU3RMOU9lTUdLY0J0T2RpdXNxRDN3K3JSNnAzMjUvek9u?=
 =?utf-8?B?SEI2NFR5QVcxaHZUNEdWckI1cE9wS0F4M096bEg4TDJvU3Y3NU9ocStlaVo4?=
 =?utf-8?B?YXlQeXc1RnpKMnVjL1NVYzZybGJjTjhuV3IvL1Iycm4yM1oxNkFxSGM1am9C?=
 =?utf-8?B?NENnYWNmUmJDaTFBTGUzeUVQcG5qQkxpYVRkcDMwL09WdEMwUFZLZzZzSjAr?=
 =?utf-8?B?YWRxclhyS1Z3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXZHczV3VTA2QkFEUEx1eDhZKys0SkVLaU5MUUhIdUNlMk90bURXaDJNRGNo?=
 =?utf-8?B?alEwSUVGK04rclYrVDl6b00relNzRVBjdm02MC9WVUJlNVNxQldNVUVNaFlo?=
 =?utf-8?B?RVBDRHBYLzR4ZWJYak16UHZva3A2a0FLREpMb3AxdDEvTDlPTDJlOXFOTmIx?=
 =?utf-8?B?UUMxcGNUd2Y4U2Jzc0xhYnV3b3FrcXR5NFdLL21aRDl4K3Z3cmJUN2NqRFpU?=
 =?utf-8?B?Y242WHFmMWkxbFZTcCtsMDYrSGtHWjhuQ1dpL3NtblpGVTVma3B4VVQ0N2ht?=
 =?utf-8?B?NGpnZHZNSGVYTVFyNnhWYVdZSzkxRVkvalVLZ3RzNEdGcWZkUitmaW5ldG5G?=
 =?utf-8?B?dnc2N2hRQmtQajhmUC94MGVaNjVOUTkydlpYaFlhN2NoTU82SDRiUXY3T3po?=
 =?utf-8?B?dWcvUkcra2doMXhWNTN6Y0l2eEM0Y3M1aytSVjRkSjJuWmt0eDVzYlByYloy?=
 =?utf-8?B?OG1PdEpoWHlINmUvTjVmU3ZoV3dkUzJVa2VRV3NhWnNpckNPUkdyN2VSNUV6?=
 =?utf-8?B?bEY0bzUxMXlLeHppMEZ4RUFhZGJSSFdBTTVnZHNqVEx2bGp0VzRLSFJ1bWJk?=
 =?utf-8?B?M0tsMjVaWkZXeTNOckx4TlJvT21Pcjc0bUxheXVpOVAyWVQ3anRJWVdxM0hs?=
 =?utf-8?B?YnAvWlhSU3JsVld6Zy9oVHFRdFNWOG5tb3M5ZWtoZlZXTERUbStML04xdW8x?=
 =?utf-8?B?clVrcGN2TGJIWlE0U0xFZWprWThrL1M4aXFHcmJWalpqSGFaUkJFeVJhdUJB?=
 =?utf-8?B?NHVYQkNzS3EzMVRxNjduclVaakdra1dKVVJXN0hRSkJPRmN5eVhLcFN6REl6?=
 =?utf-8?B?ajJWNFJ5SHFsMXNpclpFWEhVTHYydlBObWN3eGpYcldTT0xmdFRhSWZvOE9P?=
 =?utf-8?B?RlZ3RVNLMFh3ODNNcTgvVjFraWlGa2xYNVlpUWdySkg0cWxudUhHNnoyWDVN?=
 =?utf-8?B?NDZWOFBTVjZvM1ZiZGE0RTNUam82d0NkWDZsZTdQL1M4NHBWUStBYThEa0wy?=
 =?utf-8?B?Vzhhd3R3RlBWNUY5ZGY1QUpFSUJyaGhwUkxPTStqZzNYRUIwbGhxYkdDdlBM?=
 =?utf-8?B?L1Mrb1VPejJWazhLUDVRNEtZWFQ1c0hVTDhvYlMrQkxNbTR2MUM3OHMxeFFZ?=
 =?utf-8?B?Ymh2RkJOZGdUdm1XNjFtVE1CODFKYkM3eVpOc09RNHNIWlFsc0Q3SGozaFpC?=
 =?utf-8?B?allneVg1RnpacjAwdWdFRWgzd3FDOUVKK2cvN01renpFMldhVk40TTJXM2sy?=
 =?utf-8?B?R3JJdWxFczc3c0JXT2RZNnc5U1BhNG1rRFlMQ2VYUm1ncmEyOVZvZnY0S2xY?=
 =?utf-8?B?WTN0QlNDWTF1QklvNWZzQVhhMTA3am10S1p6NkxZbnpWQit6Yy9vWjhWakph?=
 =?utf-8?B?U3ZLQURCMjlLMytFbVJRWmkzbU1OT0hEOUpQRG53cGd1WDRNQ04rdmRRaDgz?=
 =?utf-8?B?dHVQMTEzdVMrVEsrOXcvbGM0Y2lHRlRLaUYyWkRDUm9RRTZvSU44ZFREclJx?=
 =?utf-8?B?dzE4NUZpalhKRFVTMXIrNFVOWGVzaHhqRWVMZEszck9rODBZbk5sUW13dnBT?=
 =?utf-8?B?UmlEOUpScVlOZE8wVFVtejBHSStGK0pYRG5qYzU2NnN2cUpuc2tDU3BrV3d6?=
 =?utf-8?B?eTVCaHE1dlNRY2tmQVc4elVhcUZmZytMRnNSZzFSaFpYK3JRRGp3YWVhekow?=
 =?utf-8?B?azJ6SnU5YXdacnpHQ0dlS1ZHOHhLbXgrNGUzZ20va1haNEl6Y1I0VzVtdVpK?=
 =?utf-8?B?dmdWbjlramlRUXVIZWg1UkZrT00zTnVvRHZ2ZVJ6N010NXhXR2RuOGFkQTVF?=
 =?utf-8?B?ZXZ1S0lndHprTEZkaUFmK2J5b05BSnh2c3RqVkUxWXRwUUo1d3NzYysySXY3?=
 =?utf-8?B?Mk1uaHBZVVJYbGZ6NVVzOWxlWXJVZVdUVEVDZkRGVDR2NVZybVpTZkxva1oy?=
 =?utf-8?B?MFdLMVVxakp4aXlCbEhadGhxb1dDczNlQ0ltRHN1Ymx6ZkFsQVdXVkRoSEJv?=
 =?utf-8?B?d1VtRDFXUjlhdHFBb21wYjdJZkJPYUExR0kyU3A5eWM2NG5MSmt6b0YxOUl5?=
 =?utf-8?B?Q0xBcVNPRkplRk5MNDVXbEZqdXhDL2I5QjIwM3gveGd0YUdUeS9VblBMRVFM?=
 =?utf-8?B?VHJQV1dZZzNRWDdnNStKaGVtUDN1OXgrcmYrM3g3Y3JiSWpIUjdLTjBqbVI0?=
 =?utf-8?Q?8t9QX/xjLeIJQ8hmVaKvdIbUf7g3KUaJ4skXO7t6Avm+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b4dc796-1d5d-4e15-6d54-08ddd419bb37
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 12:15:14.0171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q22WBqNt5iN5cofZCSFvZFkLgwdstaTkdBFtAwwDRXECu4OBYjup37mPxQhsEUaf7wwP75R91ejibHSjNY4Fcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6707

On Tue Aug 5, 2025 at 4:50 AM JST, Danilo Krummrich wrote:
> Currently, a Page always owns the underlying struct page.
>
> However, sometimes a struct page may be owned by some other entity, e.g.
> a vmalloc allocation.
>
> Hence, introduce BorrowedPage to support such cases, until the Ownable
> solution lands.
>
> This is required by the scatterlist abstractions.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Thanks, this fills quite a gap for the scatterlist patchset!

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

