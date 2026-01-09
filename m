Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010031.outbound.protection.outlook.com [40.93.198.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4048299959
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Jan 2026 18:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767985179; cv=fail; b=ou0a0rI/BHuIu01z4YXR+fra6fk5r+Hsnjj0JEkOXXTuAvycqPp/KzyI8a0koD46g5pfja3/weSqya/LHhJdLj5TJiqSaqzMzyhbOmEOIPWuQfjr6zEZDl18Jy/7xoqoH7X455VGOwZdp8rU6De0ZZNeaas4gSW9AVpUcjUcCRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767985179; c=relaxed/simple;
	bh=DY0l2gGyHKd7W9Wh5/dgVbNIz+iIqduRm4O45kFNIxo=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jzI9OJVcdr7jg0GgqEeF9mvQ48PzKrmCWletQzQHeCCvh14QYTJp5hRQxsVX+GiDxuMdzCzYlTQrFyyLUuXOSepFPF6wpwWZhGsEC2ekPM8BQGtFv5gwQWFK9rlQSi4+fb6t2TYKiPDKiWCYCRTZZ7PRFJq+Cr2TClsX4EqcIF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fDXgUMJK; arc=fail smtp.client-ip=40.93.198.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fDXgUMJK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mZ/1rpvqjHv5WgvVS5bBdcfkw2MVDJ8E5687NzqmA7d3SykN0oc7AYyOc+xcw7E0IRNaJiQk9UAn1Vk2ec93J6cm3Acd7Wg/WRLa2xmt1DqOag6U87XT27XQ+klaWVwm80T8cR7YSN6cwFEkNiX9H2sk6kw2b4/qpZwuNuPIbBmcRt8diUATk/WZWWsjQ/xw3UawU02KAqtpbWRpQXC17lXGMhXWartJHj2JBFqFvqJrHTNCZA8wFLjkVYL1yrn71tnkh3ziqQDGN451MzrY8v69Les1+FY0kDjN4warRlC3eJX0Li8qOLW3Xb+qJKGdVcIi/xO8z6JmAPyzGTn5Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rvoivYLtQEV3dLdNXvVXxPKhI6XzMXxDPAQs3y4+ow=;
 b=VciuDxAl24XyNaVxhq/1fHfN9te/I3DV8fimapoTk/bFvKag6ymuf9TOm+so94nPWmgib6MYF7W7Bi14kByht6GYKh2tq4M9utT2YCOdvkzuLWf4Xl7dFV2RFWjWL8KknUyjKrBsWcftpdAX2Iygmwz3RxhoI90QsqqwDSLnk0sxxRdTXclfsW4A2MOBchRtQOs9g/EPt1N2YQWoa6ymX/jnDv7AVhEUVuFpg/3sUFEqYt4HXvoMzV1PZnpqXr0IO6qGOqmR9v3XiIVxF/h4pRNWc52474v2UZ1bdiaJKi/wJU2xUgDZwVSyOURSgutlYUfg4s2wkXhfJBSiJ/WVpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rvoivYLtQEV3dLdNXvVXxPKhI6XzMXxDPAQs3y4+ow=;
 b=fDXgUMJKzQ3MQamd4IeeVExNNfKLV+/iKtb4krczjvrTbxadU7RBULj0cMCB6aoqN1EbFANpMPYgNUjYsVxPua7E998M8gygThk4urVpRF1VrwGAH2/NPnq0DeTgxSooSyHVl2oO29dcIplrVITHY+YK/5XU+n5UI04XHOgq2sw7WznguLBwjHVGibrqezydnFeF6JpXeFQDmIAz3yRa8iWTXUfYpR6TKBfDjxb6QA1h2zQzm12IPTUwNHwYkm0D6VobKUZF0Bu6RbYOrQlv5Au1KbBrTwdgnAP/lPd2GdToWBmzY3CCcNE6aGEw18b2SLS9ghvscqLPABYqh6ConA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN2PR12MB4424.namprd12.prod.outlook.com (2603:10b6:208:26a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.5; Fri, 9 Jan 2026 18:59:32 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 18:59:32 +0000
Message-ID: <84b40c4d-ef8c-4b7e-b8f8-055e57516a55@nvidia.com>
Date: Fri, 9 Jan 2026 10:59:30 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/11] gpu: nova-core: add FalconUCodeDescV2 support
To: Timur Tabi <ttabi@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
References: <20260103045934.64521-1-ttabi@nvidia.com>
 <20260103045934.64521-10-ttabi@nvidia.com>
 <bf3bd88f-ba73-422f-b2e6-24512dd19ff3@nvidia.com>
 <d20159524cc52ceb266dc78faaae0d2e9ce15c2e.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <d20159524cc52ceb266dc78faaae0d2e9ce15c2e.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0205.namprd05.prod.outlook.com
 (2603:10b6:a03:330::30) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN2PR12MB4424:EE_
X-MS-Office365-Filtering-Correlation-Id: e7799204-0ae2-4763-95bf-08de4fb13911
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZEVkMVZSeDRPK3B1Snd6TkJjbXhEcm5kUWlCcVRTMGZNS0FuV2I2SzA5UFpq?=
 =?utf-8?B?TXFjakpaSHB1cS9WNVVmc0VyVTN4dHNkbUZxSlJHTjgzUTlLQVhNRHhaSi84?=
 =?utf-8?B?WjUzUG45RGVGYVdOVDlHQU90TjlFVEFkUUg5a3BGbnFvTUJldTNEY25PdzVG?=
 =?utf-8?B?ZEZoZlg5OXVkN1RHVzBPRTNzQ0ErWUVyOFNOSUNwejg3K2NZUmFmNmd4M2lz?=
 =?utf-8?B?d000U2dQRytlZHN5cUM5bzFRdTM3L2I0RFQyUmlnNXZBRzVSZ1UzeG5Yc3dV?=
 =?utf-8?B?NEozZC9sQm9oZVN1bmZXdmdtN3NaRy9tb0dOeFlLUFRVYi9iamJHMHRVQlZN?=
 =?utf-8?B?U3oveTI5TTQzd1BxditZZnZ4MnRoL3RDWXV6RGFCTWczbk95YWhIWStCbEw1?=
 =?utf-8?B?VUpzUk53QURkYmVGY2JRV3RDVlNjb3IrdGVCU0hiZDVYVUpuOEtPZlg3RnNp?=
 =?utf-8?B?Mk84MXE4Rno3dlgxV09VSmZaV3ZORG9BWitGRFF3TytxMzhaTW5Dalh1UThS?=
 =?utf-8?B?WFlYeFZBQXlHYXFaOFJLZHBZWUwvUk9nczVrdjB4LzhxWm1YdngvYk54NHp6?=
 =?utf-8?B?YkxlWUpoY1hzam9UaCtWWnY1bmFhNlAwalZHdkVGeldVdkFrNDN5OFRsRzlH?=
 =?utf-8?B?eG9haHlvK1doSzIvNC84V2ZLV29xVkwyRlY2c29WQzZiRk92UnNXK0lXbUsx?=
 =?utf-8?B?M3krb1gzNkhKeFRRckUrd1RlaHhaR3h1dHQvUkxwaXJIZ3BNeURIWk5VYjZa?=
 =?utf-8?B?a2tsNDdnRW1yMCtyRktJSS9BV20rdlM0VEZOKytqNy9oSFBYVTRXMU5DdFJK?=
 =?utf-8?B?anJFMFFXMGduanNta3pRUUdRL1daQXBwOWU5WjUyYlExTWliTGhNend1ZE4z?=
 =?utf-8?B?b2tXajJ0SDV1a3U4RXAwaWhaaFB0bE8zTlg5MzFZK1lLbStFSEh4SFV1dlZx?=
 =?utf-8?B?QVhOQ2xta0thY0lYQkhqRmVSWlF0V2NQb0RPZW13YXgzNWg5TmVPRi92R3h5?=
 =?utf-8?B?aU1tV0VSUitBM1I4eUFhYXBQa0R4OWEvS2FKLy9jZ1p3eFdhaW5Yb0oxZ1VP?=
 =?utf-8?B?ZFNsRzlRMDJUNnBmY2J4ak5rSXlvSys4dHdPQ09xejVWQnJsb1F0cU1QSEdi?=
 =?utf-8?B?eVlhbDRwSGtJa3NvOFUwRE05OXdoaHNvaDY3TVhkRXRBUmZQQmZFY05rM1Rr?=
 =?utf-8?B?eHlSc2lXVHlHMlhORDFXN1BWVnJPRzBoTkxoTVJhT3NCK3NJalFlK0srL2hM?=
 =?utf-8?B?UXV0MEdYNTVLa0c2TmxtWW5rSStBbE5rNlpDcFNCWnNvWW9CSXorRkdiT3N0?=
 =?utf-8?B?Zm8yWGNkQTBKV1ROd2lGak8xRDdLZCt0c0V6a1Q3cUtBYkdpaThkVDBEL1Y0?=
 =?utf-8?B?SHpkRlpLUWpHU1Z0MWh2Uy9yeitoaEdXKzdHMGpyMDNDZ3hYeGJoVWE3bVpQ?=
 =?utf-8?B?cmtzeHFraUxJbDBtN2ozSzhlVlRPM29ja3lsSEdkSThZUXc3cFcyR1dOam9v?=
 =?utf-8?B?blB4dXZwNFZkQ0tWSWE3ZHJSY3lWSHpaRHd3b1FIT1JORG92Mlg2VHZFY1RU?=
 =?utf-8?B?S2ZDQmhYQ0ZGbnB1Mk96Wk03SEFKeEU0SzB4Q2c5TGlRK3F6N0ZNT1kxUEdX?=
 =?utf-8?B?OFZnMitZT09PaXdBdW5EdDI3VkFTM2Q3L2h3QzFuRnFjclJxZ0RnS2hMVHR5?=
 =?utf-8?B?c3I0T2FSUDcybWZRZFJlNCtkZGtKdEY2SzNpT2UwdXYvL3RRQUgxSnh0TDl4?=
 =?utf-8?B?djZjRnBBdm1ubDZrUE03a0dsRTRwUWhmVWovUENDTVBFU29aR3VOZnYwSnRT?=
 =?utf-8?B?YytzS1QxRnZtOGtVRWpCNndkL1ZuVGE2TXR6aHJFQzRhY1dLSTN0MDJja0pp?=
 =?utf-8?B?V0hTZXpsUmZJWXRHcXRKZGN6OHBxSkl3RFVSMVRIWHd6MFZZUXpxUHloWHBE?=
 =?utf-8?Q?LOxFJZZFt3d6BZaV7k2ZyJAR5aNkiy2y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wi9pYWt4Vnd1QWlmMVlYemI3cmhRZUEwZXBybmltaFFPcVZHdXk5YWx3aWs5?=
 =?utf-8?B?TWc1QnhpaFhOY3IxWDk0dXZKNXNtRHgrUVlLazZsSVEyLzlhYmxmMDRuSmJl?=
 =?utf-8?B?OE92ZVZCYnRTMGl6ZGdkbTV3MFZsUFArb201WU1lcFg2aS9BSlF0YkVtMGxV?=
 =?utf-8?B?WFNxMnBoT3BmcE14VE9TYUJBdEY5Nk1TcnZiZEd5TklUcEZPTkNtNGVOejdJ?=
 =?utf-8?B?UG5EV2pJQVFaSWFnVGJ0WXdqelMvUGhER2FNeWJ0eTBxNFBubzJoN1ArL2Vt?=
 =?utf-8?B?ZVVEampkeC8xcUsxSXlzeWk5MERuRmZ4dks5cWFkSFRjUkk3Rk5vRGZCVkRo?=
 =?utf-8?B?cmhOTTZxWUNoNVRUMVZKWkxDRU0xU1g1d3RDeVZ1SUxsdWRNZHJmdjNpNVBn?=
 =?utf-8?B?dVBDRUJsNFRjQWpxeDA2WkJHRHpmSUtUK1dJYnNXRlpKMzRqOW82MGptWHFh?=
 =?utf-8?B?UTkxSnVnTk9iL21UWGRFc25NaEExUEVoNnZvYjdSaWNaS1VmQzN4azYzakdC?=
 =?utf-8?B?V295SVFMMEx1NS9EL0dhQXQycFlhcjl4QXJCSXZWVnBDQ1RIUnI5SndCWktH?=
 =?utf-8?B?cUVFOGNIYU5TN2VXcHZ1RE1vZGJUaVdzWDRFazRRSGFJU3F1UEVBSTZJRGhX?=
 =?utf-8?B?QWpOTDZ6MXIxQzZNWVlwY09VNldYSlJMdEYyZlJ3WGFYS3kxZit6bEwxaWVa?=
 =?utf-8?B?RE4vYjJTSVNsVXJCdXU3NnhOWWVLaFJJMmJDcGRVUkhtWjFKTXp5eHFEUmk2?=
 =?utf-8?B?YzBhUW92Z1drZ0NhUXpySXA0WitDSWcycHlRRE1tcGwwQTZhY1JQNlpXZGRZ?=
 =?utf-8?B?ajMxQkt1UldYUk5EZUFWRWpqdFBPNnp1ckZ1NGlLRk1yMTRvMnhoMWRpV2wy?=
 =?utf-8?B?bXR2Z0tnbTVpNDVJR0RCNVgxeVhNVVp1bDg4K1YzUGV2bzQ5ZWYwcE5OeEd4?=
 =?utf-8?B?OTFBbTlsTXhtNUdXNjI5VHhsakF4SzI2NGJJNkZ6TFhJdW05S2YrcU5lY2tN?=
 =?utf-8?B?RytJK05mb3NhdllGZ0U5TlZyZTlhZ1lxNnQyQmpFSGRwWE55NWFaNE5laUFH?=
 =?utf-8?B?RHRrZFlwVGQ0OVhOVk5xaFFPNGZOYllZNVlQcFVhWjBlTWdnVVRmWjFlNmg2?=
 =?utf-8?B?aWhTYTFTdzRrR050d3VaeW45bFpyQnY0TTRtcTZVZjJYWVU5YTRnMnljTWNX?=
 =?utf-8?B?UlVpUEVMazAwLy9UUXErODQ3UURNSDVJN204WWNhNjNTaDB6RjZDV3pDblJ1?=
 =?utf-8?B?bThLaFRBV0hILzNweStEdjhyZWUrclR4ZUMyUEpNN1E5bkRwM3BPSGhhbDRv?=
 =?utf-8?B?WFRURXpRUzV0c0ZRWTRMbk0zY1FRVXcvclpQMmdGMjVJakpZVGlZWWY3OW1x?=
 =?utf-8?B?YndmVUNlWUtKWWxqa2crNTVwTFk5TzdabGVGY1c1NjJDMTIzdWl3aE9pQ28z?=
 =?utf-8?B?Zm4vVTFQTEhDQmoxVHJ4OFlNRjk0bkRQQlZ5VWZGNGtXeVRWZmpqVHFnRTZB?=
 =?utf-8?B?Q1luUUNlc0syblkwZjg4Yktwa3lrdGhIc3NlaXJqd21qK0NNZWVLNWpvcTNX?=
 =?utf-8?B?T2c4Rmo1MVpNL0x0di9KNkxJQVpPZWRYaTJpU2pxdnhVaGdiZVh2aDBMcWN4?=
 =?utf-8?B?ZHFPOUV1VDhJcHVETjY2dFhHcktZR2VhQ1RNcjhxR2xTRDJzRGpYQmcrTlpl?=
 =?utf-8?B?aHg1cnY5WWdxa2t2ODdwbHJPTFAzSERqME0yTURUNEFMczBVdEVTS3FsODZV?=
 =?utf-8?B?QnlkT2NuQmY2dTdpMmVKQnhmYkpET2JzWGNCVURIY2VuTEZkQ2FyaFpZT1Yx?=
 =?utf-8?B?TGxKRXF3YWhoVGI5RmRLd0RQSzVyeEJKYW9DSWd4WDlVbzZoRElDQlp5UnFZ?=
 =?utf-8?B?TlF1QTZKd0REb3pxdmdNMjJnMzBoUlZ0M0VxK0RySEgzdnRPYmVqNVNNbHZZ?=
 =?utf-8?B?ZWR2Rk1VVjAxS280Qnh1T3lhejJMS2drQWg1NU00MWFMSUVwRURtOWJMSnFK?=
 =?utf-8?B?SVlxVXhnZHVsN3Y5K3ZMbmd3WGlJRWJxMHZUMmRlbmFZbjgybHhsNGVUbktn?=
 =?utf-8?B?eVVVWTdUMzFwTlc0RGY5WG9FT1FFSlNUVmFtLzlOWWwwMXlCMkZnNCtNYzZP?=
 =?utf-8?B?VGxpemZ4dVNXVG5pdGdkWENOYm5sNWxPZFU1aG5TYXE3dit1V3lhNUF4c3Z2?=
 =?utf-8?B?YnZvWG42VVdTNmF3VTZFWHppeGx5RjBURW5SRDBNUVFRZGZMeFd0WE5XcGd1?=
 =?utf-8?B?UGdCc2ZGSFNtNmhVeGx4VVFyTlhYVWsrbDJMd1U3OGNMNTl4VkIwVDUzYStU?=
 =?utf-8?B?TkhzMjByOXRUT0hST0xqOXN6RUo2UHRnQUd1dFhEQVdvK25aa2VDY3dSOWwx?=
 =?utf-8?Q?zi3tGgj8t8jnsGcY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7799204-0ae2-4763-95bf-08de4fb13911
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 18:59:32.0604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ffc3o4iWIFDkAPhiGPC3bJqk+F1VttfIEDejU9RyVf/81COMVXtXEOs5DqSEI0xJfKW4+ICUFqlc+zDMmWAUNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4424

On 1/9/26 10:11 AM, Timur Tabi wrote:
> On Thu, 2026-01-08 at 18:53 -0800, John Hubbard wrote:
>> It may have its own imperfections, but this is *approximately* what I'd
>> prefer (below). I believe that it strikes the right balance between
>> simplicity and Rust idiomatic code--and it's not any larger than what
>> you started with.
>>
>> And it won't cost you any time to implement, since this already works:
> 
> Do you realize that this is almost identical to my V1 of this patchset?  We've come full circle.
> 

I hope I didn't review that one in detail. This is really pretty funny. :)

thanks,
-- 
John Hubbard

