Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012001.outbound.protection.outlook.com [40.93.195.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4EA76026;
	Tue, 16 Dec 2025 14:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765894642; cv=fail; b=THeqsyqDUviB48O/U0OQSttf/xQv0/KGFLWpztS2E1SW/GoHhXw8Au2dwozAKkmxp/sdjHcPUHA7mcaAOjr6pLHRdDq+ZU8PcFeUXAOVCbO/y7B4ZRILdwEYgcdB2hN9UyQeObxQ6d0fVBxHCkf/caw8ifAihs9oCs+RLJCr1sg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765894642; c=relaxed/simple;
	bh=6fR8chQ/cF4eJ/muYXM0FakwdgMxezXrFSbLzZcfuEA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=F9IXJvLaX/oNVOcg6ZfazrfMAuNdx/hO4Absg53D/Y7U4mOQEJyUterxnFl6CbFW/RW9DQLmdZpVgy/7IUMvkr+U7Ubg/E7e6l7undwEkNT1QU/K37EvlYG95J5sTYN6SbV87RUCyDbNsE8PkvoazA9res32a+1KRDr6aNM6ZkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NtCRFXvN; arc=fail smtp.client-ip=40.93.195.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NtCRFXvN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V911zmC9ZmpMP7EPCMMicYkoVr6SlgfPoE1D0sobW7/jwVZHZ5yTTNaMygLfzo8y5F7qu3l/5seGyPE7ejBvB5nnAQ5EZZsryL3uxLwLiN8SNzT9/LzfUJ1XZiRZIO/uolLfoncqV6laNwrp3rBSp+ya7FNVYkdRo3xhFzgQQxMlYu2Jljd18BFCL7mbkpxUBfyDr6vNGQg30XGiRmy2ByokBljYNR53d3kGgl0zGDJtWRVEeuN8uuNe9tPbsdCwV3oeqqPI/Da570dQtUdil5MFJTwW2YmjIo6uCCV6y9457E12u4qVxliTTCM7NmsNUNPRSVaCxAB4tKpatD9DRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IyleaSW2Btmsou5VUnxOCxWX6MaSR3m8kPm2RwTGLjk=;
 b=StXw3lJEO2lFbPBWBfOMsPI3gy2zQbdMtLfH/CzSYmbvgRs6xVgahi2JslXgw0MZ1LGk4PwEJztB9wckl4XsvDHdpRCvaeuA9AXcOcSyQGMlaTQz//kk0WYBT/x1/fEkLu0AepBpNAElY4Rznqyenqozo9ocAAsKF7nLNjJBMcJhqJDB3i8ymx8JuMLC2W9+v/pE/6ZoljEcNLPm9xDRDXXLiCHkaIkX1n44u3q6IPtpSbcCuqkKPdikLTBO0WYPa4N2CkjcL8wtm2kNEQA18DzUsZKePMPNIBCjSN6y+2o4nYrqkoCmnf/1p9nDD5i4GSfsulYlaIqRmH6XOhVlyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IyleaSW2Btmsou5VUnxOCxWX6MaSR3m8kPm2RwTGLjk=;
 b=NtCRFXvN9PvJx+6pO1dMd7R8ZBWv6iV/GO0TSBlkenKHBJJPGSx3mYSk8IM8bBS9f8/gDf9AEP0gJtrqkfSsK2v9sGpyX0um/o/wHQgFlE75BCeGitAs47tYNbhjIOkAOs77DhbdaXd/gqrBlgApp8jj60G43PhueliXLmalprHU62NqeVTnjFH27DG5kce8RaV1f4+8idKil+p9BWrVq3AFprbTUcxj01jMRKoRD+cyihFgYCqmztOUSCdy9o9Hrz1TTIQ/fwwsAnEqjIpqn8LhHNRq9cpGsBreRuUID0RlLw+GS5wj1tUlnYt8Yh4c/jAPmIIf3uozfuHOSr+LaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB6711.namprd12.prod.outlook.com (2603:10b6:a03:44d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 14:17:17 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 14:17:17 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Dec 2025 23:17:13 +0900
Message-Id: <DEZPEJAWOP1T.1VHFQ3Q69SCF@nvidia.com>
Cc: "Yury Norov" <yury.norov@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: num: fix typos in Bounded documentation
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Nakamura Shuta" <nakamura.shuta@gmail.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251204024336.246587-1-nakamura.shuta@gmail.com>
In-Reply-To: <20251204024336.246587-1-nakamura.shuta@gmail.com>
X-ClientProxiedBy: TY4P301CA0065.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB6711:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d63b968-b8e7-499c-9deb-08de3cadd113
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|376014|366016|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z1RwZTE5Q00zZU51cUp0RkJnSTRoV2hQY0RrMStPUFpxV2JLOHhRaTVLWE1t?=
 =?utf-8?B?MWM2elVlbiszT1VnTk1lSWhiQjY2dmdUUGo1aWpBK1lZYTBiZUtRaDA3NjFP?=
 =?utf-8?B?WHR2aDdwZm84dk9ZRzg2OHg1aUI0TVVMOFFpbWtNb3Fma1Q4QWNNMHcxa0Jt?=
 =?utf-8?B?NmRndXdSSHpsaUVFU2JFaTZhdHJKVjZpem1JZXFuZlFwcmZvZkYxYUthSXRv?=
 =?utf-8?B?R0dWQ2htUlNqa0VFcEdzSUsyYitXVVNidFJOWUxyY1NzOHFqaEh4NklqeW1h?=
 =?utf-8?B?WEFTSzh3TjkxYTNSLzQvSWl1UFhnZG1hRm93NGNQeXVTaVBEYW9BS0RueWZW?=
 =?utf-8?B?emxUUGl0eEpEMXV4dU83WU1JWUJUdzZCajFBWXJYZzEvS09BaTF0QlpRMG9o?=
 =?utf-8?B?NHI3cVdPMk5FQTBuT3RLdGpkd29OOVVGWll2MUk5S1V6N3hEajNSZmd6bXU2?=
 =?utf-8?B?UjZOWjY1TzdIVjVlZlUyYjZhaWxiOTArbktwd3RyYy9TTUFWTFhoZy9OdDUr?=
 =?utf-8?B?aTVIYkNlMmlkeFpRMXllRWxpK3Jib0U2K29tUk9TcFJBRnVKSzJtanN0eFd6?=
 =?utf-8?B?VzJOR3lSUnVVRGF6ZFNuYUZMVnpISkljMHFJRzQ3TnlOdVBRSWZJKzZ1cm82?=
 =?utf-8?B?WUhmT2JHRjZ4dHRGZ0FUMUhhMHgyL2xwNnFEOURCZWNPRVN1NXU4cG1hWlkw?=
 =?utf-8?B?OUJvcmZadnprTnBpOUc0Y0x0QWJZTzUzWm1xSmlUMWFoVDBvOXVBSEFqbE9H?=
 =?utf-8?B?WmlmT1Y5eDA2VmY3K0thaWYvdnpzYnFBYlRNRUJPSi9Wb3UyY0V0Q1AyVldR?=
 =?utf-8?B?MU9QdFJURGpHWVVBN2NTd2NDNVdhcWpjZ3pBOGtHdStLMzFJOUhtYWJPalFl?=
 =?utf-8?B?WlpqZkdDdEN1ak5YVGxDL01iK1Avb3FsT04rMUlLMlR3V3BFZWIrRWN5SDhO?=
 =?utf-8?B?OEJHL0IxV0xUVkxEQ1pTVHROOXRxTUFyOWNLWUowMjlzaWY2bHZLUm50d1R3?=
 =?utf-8?B?Umx1ZHordEJ4d21zaUYybXZOZUdFeXlVdDh3QndIVmd6dk92WnZrOVFFSW52?=
 =?utf-8?B?TXpXZmQrR0gxeXRmOEhNQ202N3ZyajFQVkxlWGlUTWFpcGY0cG91RnVoWDM1?=
 =?utf-8?B?enZpTW1Hc2hrQ1hVMDNETVRtZEhJNGZiOStJZnJyV0VXbFhqenB2MEN3OU5x?=
 =?utf-8?B?YlpSeGE3NEFZVU8rdkZDbnVvdHJlVzZiYUhQNnRrZTBna2I1emJ0V2Jqa1p3?=
 =?utf-8?B?aUR1dFUrQlVKQWZ5YTFlU2s3c2o3WEc5QXNQdmF5OW5NbUxuK0trb1JseHNu?=
 =?utf-8?B?YTlhOUFvMUh1bjZnRE9MVWtqdFhhazJlZGp3S0hUQy9zV013OW42alhrSnFO?=
 =?utf-8?B?REpNbmFhQlNJZEthVlkrYUlGZFNDNkkzVU1jNU50SEtqbElmaW1mOEQzUmIw?=
 =?utf-8?B?ekhDOU5ISEV3K2orZXZvUUczUWJaa1Z5ZUw0dVhvbCtPYXVLTWhZUXB4VXRO?=
 =?utf-8?B?N3ZkT1lDaUJFQ3BCTTUvenpUWml3eVNidCt4bE5MZ1IreFJOZTBUY2pVS01t?=
 =?utf-8?B?SHhoVHBsMXJuUFliQjY0R2gvOVR0Y1FSQkpzNmEwcFZBTlQ4VVpJWDlOenM2?=
 =?utf-8?B?bThQczZOa0pYUUtFZkxiZjJVYjNCS0VtcGcrSVlPQjlUR1NnQ05uNzJCSlpO?=
 =?utf-8?B?SkdBMUJPdE1xZU8xOWNXVWN4dDZOcWJoR0FHU0xoa0dueFVmaElEaWQyQTVl?=
 =?utf-8?B?Z01ySE94RVNLWmJzRGlMemtXUU10ZGowcVVJb0RGN1ZRaUhKdko4UVZVMWw5?=
 =?utf-8?B?RjdDMm5MLy9oMHZDSk95b1FOUi9xRXNSS0IwVkdkV05VblYvS2VjWTkva3NI?=
 =?utf-8?B?WnNXb0tpV1U5bjVaOXE5R0VJYkVyU25LdHRFNk1qbzlpN2U1dkFneXBHd0lL?=
 =?utf-8?B?RFNSdzBSRTJIV1F3d3J1ZEM1a3FyZWFFa2RCeXIvMStiTU9SZ0VURzVBaXlQ?=
 =?utf-8?B?Z1gxQUhoOW53PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEdFb0l1ZmZrYlFlQTltak5qZnZKZ1ErSTgyaWJCMXRMU29zNTI3dGw0Z2ZF?=
 =?utf-8?B?TUEwYmhGNXd6dzlRQ2p2NWEydTFhVmY0ajlHdXl4c2llWjhCNzdkbUl6a1lY?=
 =?utf-8?B?YTlWSTRSN0VyU1pERFU4UDlDNHFKM2p2N1BkNXYrTTBualRreW1FaFJtNDMx?=
 =?utf-8?B?NXlpSm1hRXcwY0c0TDZFR3NsN1BzL1ROdUFCK29GY25KZngrMEdCNXAzTURq?=
 =?utf-8?B?dXlMWW5NWHhKalhiaW9CZUkyd1p3Q2UrblVROXI3N2pOTzRxd3lWdjhqYnlC?=
 =?utf-8?B?emc4b0d0SWFOQWZzd1NZN1dXdHpxZWF0K2RMSWtBRThKdjF0a2o0bFU1TkI5?=
 =?utf-8?B?cVlYdDVEd3orYWJFZlNySnVQTXVJb0I0YUtCSG11SEdlN3dXby81bWs3L2d2?=
 =?utf-8?B?UnU4Z01zM0VBZTRJUloxWHBWYUV2TDBFNCtXZlhVUUVZRjRaMGxwZ2VZTldW?=
 =?utf-8?B?THRxcUg4eTJWUjM3eVlxdzRFOVhLSnpuQUlnRDhER09yZFFrZkV3YjNVZUVQ?=
 =?utf-8?B?cGhma1J5WWNyLzhIUWdhVXhUVURMT2RzcGhhZGNrTWxvRkVUcWYxa3NQdEVq?=
 =?utf-8?B?bVVPajA2ck94bE5BUWZZenI2bzdqcmtTNFZRSEVtUERQYk8rK3g4cDFOODVy?=
 =?utf-8?B?U2tMeGs0Zmp0SHAxbnhzOHF0YW5NbER3ZEhYU3RKZ2VNT3NMbHVGblcyUmh4?=
 =?utf-8?B?MGVSWmNzTERCZzdBUHIzNkcyNzhuNldrYnlQbVpTSVZ3R0ErZEI3anJoMVRJ?=
 =?utf-8?B?VUlBWmF6bWVMK0F0dHhsUHpiVSswanpKRUV1cGJOTzl3WE5ZdUEzelZDUk5n?=
 =?utf-8?B?T0VPL0VPM1VsMEgrUW1sRm9tbzJjamFSZ0hVdTc5cXNKN0hTTlJmbDJwYXg2?=
 =?utf-8?B?SHJkWWZxQUdsTjJ4UHRuSVg5YVNkcUNJVkZJbnhYblZqbDVLUjQ0NDRJUGts?=
 =?utf-8?B?eWpvMHFub1R6VE9GMWlRVHNybUpiQ2NxZUpidzg2L1N1RzhrWExCdE9nanhL?=
 =?utf-8?B?UmtNNWhza01VRCthcGp4KzQ4VXpOVTZvYWFWYUc4dHM4V1krUGI4cU9oWkhz?=
 =?utf-8?B?eXhubDBRSVZtczRCbkxKdm5Ta0ZGTHF5bnlPa2RhbG9lb1I3NWlvVkZlZ3hT?=
 =?utf-8?B?NjdpZzFkNXZOejMzajhJYTl2VEdsRXE2eFloSDU5YmVLL3p4Sk1GS2t3MDZG?=
 =?utf-8?B?UHVnMDFZTXE3M2xuTVUxQUpCSkZ0NTVra2FKMGJFclJOck1wYTRTTXlHMGZ4?=
 =?utf-8?B?bHZDNnRUNi9ObXF1amZlZlBIL01xS3RnQlFjc29NL0V0OG9TRGNBYVdmWmNK?=
 =?utf-8?B?Ty8zQTVUcHZLdXlvNTE1T0poTHF0RUdIVzdUOTVYSCtONGY5NFYzdkVremgy?=
 =?utf-8?B?akRCTGptM3RiRzJ0NStpSjZoMEN3TnA5MUVXVUxLem5qdTFwZko0VTI0U1pX?=
 =?utf-8?B?ZWlpNmFOMGRQL3IvM2lMNXVEY1JwZXJLQXVXd2pCeDVOVUZzRjZyMk9uVXBi?=
 =?utf-8?B?RXZwK3JXajB3eHBMOVdSbVRFV3J5NFlhZVVKdnRUdGY5V1dkUC8yQ1hqUjVl?=
 =?utf-8?B?KzZwd2xJS1hqSFFoUWo3QUJ2MC9JRHBUUmZVM05oQTZNWm5Xdm1rbWNNUGxq?=
 =?utf-8?B?TVJBS21uaDZPM3ArcmlkUDFVWTVNUHV3Tk9HK1d2TmtvQ3dRTUZoU25KeWxT?=
 =?utf-8?B?TENDSnMzTWRNZU1JWjBFQWtCcWx1SjNnbVphckwycWdWaWlDZWFhWHd4cG5Z?=
 =?utf-8?B?QmwxQ2pvaXNSaDRZcW9KM2s3eVBGSUtFVkpFeTRySGcwZDJ5UEhNd0J5MjM1?=
 =?utf-8?B?WTAwNThsTFY1MWVpSFRuR0Z0dmNiaUZhMStEYUlJQkkvSEU1Ulo5ZTdiMDBT?=
 =?utf-8?B?RnhPYWdmVGFlS1ZUVmIyaktnT1REbHJNdlRyTlVEQU9YTk9meTZzaDBrcldM?=
 =?utf-8?B?Q1ZUOHVvZkNVQ1ZwRi9leDhjbzFKWkQzQkZFdkw3blFtNnBRSS9zQ2NEYUNN?=
 =?utf-8?B?QlZld2hSNjNmQ0JqVWR6UjZMck5Dc0lvSkphck5HKzI2RHVEYUZkanpNcSti?=
 =?utf-8?B?Qk1PcndaR0U3RVZkU2c5MXBqc21FNkhsSUNmdmRmM0p5M1NnYy8rd0l0aSt4?=
 =?utf-8?B?UHpOOHVLaTdmL3dNd2JpZG5YdlFtOFErRXZhOElEZHpzR3JCaXJWWFpHa1Nu?=
 =?utf-8?Q?Q+vCoN+6vKu1IfxozWeranDSMrL4w4WspgUXAzMrZiz/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d63b968-b8e7-499c-9deb-08de3cadd113
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 14:17:16.9474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6baYHYDOhDIJNIkqjI9URz9lRa3xViUZ2SOb4Glj6d5AMFRNxA6UsAWNxvw7d2z5gJ8umLDQPXDSCROb8It+LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6711

On Thu Dec 4, 2025 at 11:43 AM JST, Nakamura Shuta wrote:
> Fix several typos and grammatical errors in the Bounded type documentatio=
n:
> - "less significant bits" -> "least significant bits"
> - "with in" -> "within"
> - "withheld" -> "upheld"
> - "//  This" -> "// This" (double space)
> - "doesn't fits" -> "doesn't fit" (2 occurrences)
>
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1210
> Link: https://github.com/Rust-for-Linux/linux/issues/1210
> Signed-off-by: Nakamura Shuta <nakamura.shuta@gmail.com>

Thanks!

Acked-by: Alexandre Courbot <acourbot@nvidia.com>

