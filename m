Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010038.outbound.protection.outlook.com [52.101.46.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BDA32AAA6
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Dec 2025 12:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766148599; cv=fail; b=d4t3lJwQMGlqhdf4KZ2F+N9C1T75636/lX+YZD4xhxKybgD+LwlwxR3zLGyjWRCWOi/WXN++UgkRAk1wsCZZ067M1pkERNWf5vRAvvbnYWZoDc6Ue/U9RIwXQ4lnHnGLjB29T4Hw+om5P2baCAm0tz95mclMo/WtH7ROiVEUMhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766148599; c=relaxed/simple;
	bh=2biJBScc1FnuWkrbjKkTMR3B3gevGQyfjkz5tsCr0t4=;
	h=Content-Type:Date:Message-Id:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=lW9lbZdbOZhSdG9l1hu+v2PPKW75SpUxdUAk30BHjZ4mN2E4m7j32BhkQ8iIszH7gvAe8lhvmJ+Vh+Q4QbSSRFSVQ42eq6dC3QIOtYUl7roELLqMrR3jTZDzh0t91AI6QalAHYcsyvQ8OzSsarByKK/w7b5AgfunFMbhrTaoRz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mJCqAvYn; arc=fail smtp.client-ip=52.101.46.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mJCqAvYn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LQE2xMRgJZC7wvIfpdroITSHNKPJCBlTIC5oe+UTntqvC6LVEcWkor1nJsS40LaxK1EhPrpNy8WZjwpEgN8HDcgNuDt+/JB0yI8sLEOaSdpoamLuePHwWmQ4qHUladjIbWanVSJSnJr2yYc85QErIQeM4R/DRodM3uCEMNF7GNnX9gXmbi4Y6qY2LdZQp2B8WjfjGDI/uaw3LFq980BtANRCks7yQ+6I6NJVeRUAS1UN4WnYZejViXBaZGmW2TwErGBspaQ1f5IwYpMU5A67AUEY9qSCo1pau5fyj8JjV5LfS+Ail4UCCUI0zTLi2D7lauuNlHMd2xpKewT92pR1ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/cLzQ6wZfjjH/RsSvoo07LSebHX/nGVMbGEZS+eMQ0=;
 b=AmwoZthheYyDUmbdycfe957AeRprQGWTKegN0sJjBkrHPRsmTvrAfDdgvn8BWyCZm56J+47mEAnHKoYL3lLg3LQNkxJgzOyLaJ/18VEHODcQbWAXaVxM3DQg7yQoNBYxb4engepoVHIZZnUKuAY+bx732eWiFfFiYaWwicDRDZLIdkA+kuSoayppBVFh0NxB48JDjvbW+tLZqW6+t/bNqkcWSsVX4qEWKsPNLbdm4v1zZdtayLFkEknXuc3W5/FCADG8hmwgo+SlJD2C3r9H1ru2QvPR6GeMtfaQi+SzRRPw9jIwJY2ib/fEDDA0zzhesD9WXozhpx1y0faJpHXEoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/cLzQ6wZfjjH/RsSvoo07LSebHX/nGVMbGEZS+eMQ0=;
 b=mJCqAvYncgZPkqLvhKlawxBPZrnz+nF2GztCkfVRN1WkLQy9EIbqL/AoWYlmYa+079SJSvyGYrnStdU/m/ULpcycrYtRv/tCguT+O3ekFHSXOXPF5vNMgkZBuvUi0lFcMkwZ7+V1L0Ei95xIaAhV6V2iMmmc1bln95s7bCXNXX/CEJjzOyG265/ymvJ7xYmjYAx+u0C2DfIujtlkUOY3k3thr+VVMZwzSuAouPVhn93ux47q3kOg1mZXZIT0896tFGGvAe1xIAYAS58/IWOeeVts6BwF+VTqIglNNPMIccvj6T5vtPHNbDw6tKx/JLKnmMz2Q9lgYHRH5ynA811kzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS4PR12MB9684.namprd12.prod.outlook.com (2603:10b6:8:281::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 12:49:50 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 12:49:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 21:49:34 +0900
Message-Id: <DF27F2ASAM9F.2PSJ996MB1AFX@nvidia.com>
Subject: Re: [PATCH v4 08/11] gpu: nova-core: add Falcon HAL method
 supports_dma()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251218032955.979623-1-ttabi@nvidia.com>
 <20251218032955.979623-9-ttabi@nvidia.com>
 <DF16DSHX4SV0.MI79333PZ8NE@nvidia.com>
In-Reply-To: <DF16DSHX4SV0.MI79333PZ8NE@nvidia.com>
X-ClientProxiedBy: TYCP286CA0314.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS4PR12MB9684:EE_
X-MS-Office365-Filtering-Correlation-Id: 18208f21-c628-462e-22db-08de3efd123f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VWU1M2tDdHh0MDVMdTdxekF6Tmx6U2txU0thOTRMN2svaXdqV1FISmhrTkFn?=
 =?utf-8?B?YUlPeDFqdktBK1pHWUl4Zk9ETUg2Qy9MUjNDdkpUZmQxQmM1SDVMUmFSazhE?=
 =?utf-8?B?b01lVk9zVGRlaHExRmtmSUJGSnJ2Wm5ZMG9YdFRxVG4xdkZSSjV2N0RLbnIv?=
 =?utf-8?B?eGQyM3g5MldpNFIzOVQzQ29PcVhGYTZKWk03bjE0WFdKOXQyU0hwRSsvV2h0?=
 =?utf-8?B?M1BET1djWnBqRDdqT2dKNjN2NVFLUnBJTHlMSzNhVWFFSTFNbytEUHJ2OEhO?=
 =?utf-8?B?dkRFbkhpQVVyWEo2VTIwNWJTSHRBek5QaDl3QjRMN3RMT3VJZ0xKSnlhL3Rm?=
 =?utf-8?B?Q0NkTExaN3hnM04yemZvOVRPNXBRdllheisxSGFiTzBSdG1iK012Q29RRVNF?=
 =?utf-8?B?dHlXbVFSbHFqTVp2YllwcXFXR1JzeWlPQzFEa0JYbzE1SHZMQW40YVp1OEZm?=
 =?utf-8?B?RUdZZGFzN0NXNFp0YUhsLzg0TzFOUmVPV3VMd0daQ2F0cVBRVHYrVmpPMjUv?=
 =?utf-8?B?ejRNWW1UT0ZRdFVmSnp5QjdtUkJQZGE3YnJGMTJZZVk0aFlTbEt4MDNZRHdZ?=
 =?utf-8?B?eDhiRm5YdzNNbjY2K3JtejRuY3ZtcjRMbU9qTDF1V1h5bEV2UzdiOUR2T2xM?=
 =?utf-8?B?NW9SbGlqYm1DYUhpeHdYQnQrSVRNUDA4Z2Z6U255aWNha3NRQitaWkQ4REhF?=
 =?utf-8?B?OUtTdlUxMDFtV2dwM1RXRzhmTXdUQzE5NklSVkhXOXV0SXpXdUFYc1JyTjNC?=
 =?utf-8?B?eHNOWFp4a2xVcGhST3VWWnhDaGc5NzJnaXZjTE8rd3p5MzN1eFIrQWptVXc1?=
 =?utf-8?B?MEdvekZXUTFqdzlRQlpOSTdnbllibGFydmNvM1JKS1ZBdlBzMHB6YW8waVlm?=
 =?utf-8?B?c1grdVlZQUhjV3FpZW9NUVpQNVdNQmpVNnVvQmxzZitMSElEdHFEdGU0RnJM?=
 =?utf-8?B?amFvWU9UcTEvWVNWUnZYQk5vRWJrRFBvZUFBRXpHcmJaclVkLzhFTkxPb1NM?=
 =?utf-8?B?cFBNTUZQem1aemRVaWJSK0xVemhXd3lwck1KdmM4dUpQeWxRNzVRYm5LQ0tK?=
 =?utf-8?B?RGp5S0tiTG5YTHhpWTEzMm9JNzF6VWcxM0FEQTV4eC9aRGlYa2dlUVhGT2dk?=
 =?utf-8?B?TGMyV2ZoQ3VPZmcxcGVUWE5DK2todisrVzFWU3EydG1RUnpTT2E3S0Y4Uk9Z?=
 =?utf-8?B?MXk4aDB4REw3aVdUQkQ2K3RNM09wQmZaWjc0Q3k2QWk4QnhUS01la1ZZUVRN?=
 =?utf-8?B?aU4vWllGKzJCcXRGS3hOTFNpUktPQ2RzUjAyWDRsV3ZXMUgzY3BCblFLdS9Y?=
 =?utf-8?B?TDM4RlNNSkhWbGN3TUNMdU80dzErZ3N3YmRYMUhaSjB6dWtEL2NrYlFzRTJO?=
 =?utf-8?B?UWdKU0lNZVZEYS9uazV0RjBpTk85d2VOTFJVQXJKOW0zd3Q3VHdERU9PakI2?=
 =?utf-8?B?UzlzNFBGRk5rVTg1aitvaGg1RmNISElHUk9hNVdKdE1FalVaQ3E0aUMrWXkv?=
 =?utf-8?B?bWhVRHRaNldDU2E4Zk84bVltRFBMbmFBUWNHbEh5ZVhoYy9qOGQ1a3hTU1hu?=
 =?utf-8?B?WkpSRHA3ZVZwVVcwdlNhUEVpM0FsVmlDTDduK1c3RDRhdTNkM2tlTUdlUXdO?=
 =?utf-8?B?NnpNRm01Y2dkaVNVVCtJdW5tY3hPMW01aE9JZGZtWnlMRTRHUTVKMFl1RlI1?=
 =?utf-8?B?aXhzemRQRGpNR0VlYXozSkdYMG1OZUZ5YUpsSHFvYS9CaHBkY28ybkdBdGpQ?=
 =?utf-8?B?aGtHZG1ESGlPenhPVHB4NzR1NmRpYUhVb3l2SUJrVGhIU09JcHRXa2VmZlRm?=
 =?utf-8?B?dzBFM2dZenRiTTdKMnllOUR3V1pwK3F4NDAvSi9NZkZuak1BZUZQcVg3cUtW?=
 =?utf-8?B?ZmZZanVLSDljNHFaVURFbHRDSHZBUnRVWWpXTEZQVGFxdEV6ajNtNC9meGJK?=
 =?utf-8?Q?U6ztEoIr/c94AcLWbmstoBt8+MHOWY12?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVo2cEQxSzhjQkhKVndFdlUyaVpacVdqSXpXOWtTSEsrSUpnLzlHLzNDcnUw?=
 =?utf-8?B?Mjh0SmF1aUZyTHNPTVJMSm0wOEVueXcwVHNrVEVlRUJvWm1oaGpBbFV5a1ls?=
 =?utf-8?B?bWNTUy9jWUpNKzMvMDZFQ1ptRzdpenB4NFY4dDdiZzhFWmlBaDdLYitnUnI0?=
 =?utf-8?B?c3hsUDJ4dDFNdTNCWUx4aUVYWGFnTHNBYXBkeHduT2tvWVFoZjNlYVBBOUha?=
 =?utf-8?B?VHF3V3d1RzFZaEt0V3c0dnpDenkwVGppK0l5WUpDeUlBQVZDK1ZReWFrZDNl?=
 =?utf-8?B?VUhEc3BvQTVTZWN3ZFljaWg5NDg1K3ZjTTlhM29rdlJyM1BoMFg1K1NwRjAv?=
 =?utf-8?B?c1VEaUd5YzhjRXEyUTBqN2daYzJLNVlxTm9BKzJuOXJJajNQcmdQbUxKaXVD?=
 =?utf-8?B?dVhyVHk2aEdieUUya1RUUWxUbzBKajhQZktxaWFVMTBPTHdwWldHcFRyUytD?=
 =?utf-8?B?VjVnZjNjbkpVWjl2c281d3pJaE9CNFBJTEpudVQ2MU54M3FxL1AwS1p6T3JZ?=
 =?utf-8?B?blYwNHRha21HMzRMVVV4Z0ttUlc5d2EzNzNnem45MU91Y2lCbkdNdXRYcHlt?=
 =?utf-8?B?emRuMzBPWVpPWEZLN1g4NmJHeDNyUEMxNFRxakdObjNXMkhHZ0IwVDZyeUxq?=
 =?utf-8?B?MWNtYUVseGZZZHl6NUFCM1B1a3dtNUIxWElqMWcwY1A2SXFMNmxNeWVXd2tW?=
 =?utf-8?B?SlhZYjJiaTl3c28zNWI3d3FTSXdDQkhqRmRySUJGK2JxbkIrdnFERkVCR3hn?=
 =?utf-8?B?NzlORVlFb0xzMTlpdHlad0E0K3VIeFljU2tucDA2cVp1cS9nc2phVm1nM1pW?=
 =?utf-8?B?b2xjZ2FsVFVkZ0Q5bjErTE1LTXlKUFJtdWFvOWFwUCtxcHh6TXJ1a2w2Ylh5?=
 =?utf-8?B?TFJqU3F6Mk9oZlUxZnFOK2lnSUl5QkE5Q21yZ2lzTVUvalc0ZzBzU3E5eFl5?=
 =?utf-8?B?NDV1TE5EdzUrc21MaExCTUZTN3RrelZZT2hNa2Z1YTRueCt6VDVtN040OVlw?=
 =?utf-8?B?UERVM3BNNUlwYUE1RTlTZmxQamlET3gzaVZoMDh0QVl1V2RtSFZlT1FEeDFi?=
 =?utf-8?B?ZnZtRW9BZ05ncWZWNDE3eWlTamRqaVBlVFUxSkNEdWFzV2JEamxvOU5WU0VN?=
 =?utf-8?B?L1lRdG9odWE5Y1pndGI2TmJkN0EzQ0xvaU9VeGJIN3R4dEhIazVBa2x4MzFr?=
 =?utf-8?B?K2JqMnNIRjVFSkp3d2toKzk0SnpsSG1BWTJ4SlEwUGpFb2xyNGw2TktkekEr?=
 =?utf-8?B?N0pBZXpyWHRkRmFJUE45dno4SXloYmNWR3l1RzNDT1VZcTRyL2JOS1RIUTho?=
 =?utf-8?B?TmVkWUZOUW5ERzRZZjFYWTNCNm5yT04rdTdTVEN1RUlrTWVVa1dvSkNXemlz?=
 =?utf-8?B?RGJSMUd4UWhKZGE1cmliczN3UzVVWXF6R1NoVkdieWpOU0JsWWhzZ1VPRFB5?=
 =?utf-8?B?SjcxYzQySTl3UFZLMWNaNitvUy9QWkY2YW1Ec1lNM0QxcitONnMrYzd2RlAv?=
 =?utf-8?B?TjhhL1ZTL1h3TmFjTEgvdzRZU0d6QXpNNFNsZzNsdEpSU2RubzRvcjB5TGgy?=
 =?utf-8?B?YTdtVnZCQWE4dWVTcUk0cjhiZ1BSZm5qVVVXQURZQnVaY2F5bU9td3RpZUtH?=
 =?utf-8?B?WEg3VjRoWEJQNXJhMVFwN1Bsc2phd1ZDRTBRNXZhbE83RkhDVkh3eGp5ZHBu?=
 =?utf-8?B?YWRDeFFtbmgxTjNnWk1JelN5SG9FemJxS1B1UmxxV29JdTBXclNieXk2UXZs?=
 =?utf-8?B?eExuQi9iSVhZdGRCQ2h0TnpLWGc0S1EyTXNGa1pUcitVa05YT3dISnpRMmg0?=
 =?utf-8?B?OW02cWlpekpON2pBYWgzQUhyZjc2UlZyMm1UMk80b01vSFBLNTVTRzFacHNw?=
 =?utf-8?B?cnRvRGRxMkRzK0ZBVGhqMi9NS1BEaGl5SWZVL0E4ZW42VWNScUZpdlBSUnVJ?=
 =?utf-8?B?dWY1UldCTU9PTkdmSnFUVTIveEJDTHQyOENTaElsck5YbkRWWHh3eG9KTTZw?=
 =?utf-8?B?VVNlMkl2MjFuUURxZXdEMmZ6K2wrQVVKMWplOEY4ZEN4aVZ5Z3I5eUMrcHVu?=
 =?utf-8?B?bEsxUW1OakFLWUF5MmkxRjJpempUU0JRa0FxRXJOeitYcWNORXBtaXg0N3JD?=
 =?utf-8?B?U3daZFBOYVNGOE9hNEJKN3BYWkRsMU1OazlVenFUVzBnTTIwRG9nSGo3MVFl?=
 =?utf-8?Q?U/fkDSyfq4IUawlzPimY8PizMjMuT+gsKNgIWK3lrXwT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18208f21-c628-462e-22db-08de3efd123f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 12:49:50.2923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9iOKpmORW7RsRx+0xRjc4SkL7SDvdaHVLf4NjyYM0m+UEEYHh+t05+OF2W0yX/pkEUP8u2qPzNf8DOz+kejRsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9684

On Thu Dec 18, 2025 at 4:48 PM JST, Alexandre Courbot wrote:
> On Thu Dec 18, 2025 at 12:29 PM JST, Timur Tabi wrote:
>> Some GPUs do not support using DMA to transfer code/data from system
>> memory to Falcon memory, and instead must use programmed I/O (PIO).
>> Add a function to the Falcon HAL to indicate whether a given GPU's
>> Falcons support DMA for this purpose.
>>
>> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/falcon.rs           | 7 +++++++
>>  drivers/gpu/nova-core/falcon/hal.rs       | 3 +++
>>  drivers/gpu/nova-core/falcon/hal/ga102.rs | 4 ++++
>>  drivers/gpu/nova-core/falcon/hal/tu102.rs | 4 ++++
>>  4 files changed, 18 insertions(+)
>>
>> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/fal=
con.rs
>> index 6b54c0ca458a..50c87dadf2ea 100644
>> --- a/drivers/gpu/nova-core/falcon.rs
>> +++ b/drivers/gpu/nova-core/falcon.rs
>> @@ -630,6 +630,13 @@ pub(crate) fn is_riscv_active(&self, bar: &Bar0) ->=
 bool {
>>          self.hal.is_riscv_active(bar)
>>      }
>> =20
>> +    /// Check if this Falcon supports DMA for loading firmware.
>> +    ///
>> +    /// Returns `true` if DMA is supported, `false` if PIO must be used=
 instead.
>> +    pub(crate) fn supports_dma(&self) -> bool {
>> +        self.hal.supports_dma()
>> +    }
>
> Rather than this, we should make the selection of the loading method
> transparent to the caller. Right now `boot.rs` needs to calls
> `supports_dma` itself and choose the right method, which leaves room for
> error.
>
> I'd suggest the following:
>
> - A `fn load(bar, fw) -> Result` method in the Falcon HAL that redirects
>   to either `load_dma` or `load_pio`.

My suggestion won't work because `load` takes a generic parameter, and a
virtual function cannot be generic.

I see two possible workarounds:

1. The HAL `load` method takes a `&dyn FalconFirmware`. I think
   `FalconFirmware` can be turned into a trait object, so that should
   work.

2. We do something that is a mix of your initial proposal and mine: The
   new `Falcon::load` method calls a HAL method that returns the kind of
   load operation supported (please use an enum instead of a boolean for
   clarity and future-proofing), and dispatches accordingly to either
   `pio_load` or `dma_load`.

In both cases, `dma_load` and `pio_load` still become private methods of
`Falcon`.

I would tend to favor 2. because the trait object looks a bit laborious,
and it will call back into `dma_load` or `pio_load` which are still
generic (this will work, but defeats the purpose of having them generic
in the first place). Also it is probably simpler to implement as it is
closer to your original idea.
