Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794044924;
	b=dsvsnqV15Vho6x3EyxCg/EmHn+k9XCKuJCehGYbFzkSL/HnEGm49Kfn+XOacHeCq5964
	 ivjQ/kd320ryCo27pw+Tn6MDwMCHOlFjPSBNrPbUzyD+OwhBJ0KIPvJmX2RI6M2JP0oCs
	 mzcCgS9Okcx1yePNd4Jxlavrx4uR0onKLmzXF3LcITWtk7gdbnRA9obJ1lHsgTY/JX9In
	 dBKBYrgT+Q9HwJZcnXcwnK/tni3+AIrbxxuyRpea9/qLys/Y70QypCze/Mgpvwa0w48AX
	 HJmqacNXXCIRyO5xcdCJhOH77L+KGqU4QERUJkO91cr3d1j4b9txGSmaxi6RY+C45iw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794044924;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=UEbG1O0NaslduNXaV0vzRaRXCJ31dlCff/6NhoZJlVo=;
	b=vcpY1M/kflxEZ1SUvjRPI/lpU1J8BM+pOG+5PIYP38YNZxGZqjddfcFG4yDNsLm0Jp55
	 yiYTPupmKIigjdDuyxSkFfPRx1vRmo0tohybINxeJrjWeFMC7eWWg4kzoMVT239a5g04E
	 2LKdVZd/bDkO3Im22NeAHMSU8xsl0C25k+ZZT7yhd0ifP4NcZKD3UTPdIXfSUCX9zdRX0
	 J7kKW7CVfefGjqw/dmzUcDAtzn9+w4Ac/NsnU0Iya3wpAVUV8DG39yAxQBaROoCciJ0w/
	 ZHkbhR1ZgdbmT5eNdWmRtw0n1N/J0bJSdRGiRCWuobK2syZUIfE5d/PQCK/p4j7kztw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FZ+U4GCv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.3
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011003.outbound.protection.outlook.com [40.93.194.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCC0606A335;
	Sat,  7 Nov 2026 09:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFCC0606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FZ+U4GCv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LGTV0b9oKizu+e2Egqpsf1X+IPNZBXa3I1OB/2y220hr0h9OzhT/dA6rzb7JlFgI80okkAS5nCeyiF2NrGC2h78ZSJ2Ii3pmZMCyPH1517cFDBOJJh8KgL7p0hapi3bYeAJIfCPQKb59u97tPeXnjvLlPbkPY0kFjOZHVd1dOpuPBnxRIMtgCI2NNboNvl36pVecHrDVdRg7nU8EWvdmScpvxQmft3IH/eQeGE/9EBFhiII1rydBq/U2MZakA5omrXeMz/DSclZoCLDoL1Hw5tEt0byEEUah3mjJzzxuh3HDRYOzUavGHeLEFWbEUorwyoxg4whWJ2MpU/tY4hGWpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEbG1O0NaslduNXaV0vzRaRXCJ31dlCff/6NhoZJlVo=;
 b=UMFmmb89JzVQtofZwu9HaJ23hoJIZX1BjFTdb9BDY+UnjT695jYKM5KENgfNEOR5e4UVYr4jHE0n//6ab7Ka9w0fQXb+49geCMP1sHIL/7gHG6e7Yho2LVui9B303gUjUEHCRCzwAkQ60I+2WRtWEIkLV4vJd7AyMdMDFxXRBqOVeVvpBTFemm62W/mW1DVY+dUJjIJRjv/hfxEXvFrRMgxI7SOf4kOcLCHNB2hQiKZbrKfF6XvEA5brrgeS0ltrVaFqKmuHfAn2Px+oYgerXuh1+wayDcNDqppQNvo6jdGOe9ghSLi8gfVLq7N2pZkutNu/Y/diZIpDujkvv5ERZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEbG1O0NaslduNXaV0vzRaRXCJ31dlCff/6NhoZJlVo=;
 b=FZ+U4GCvRYsm9U8s69MHr2+guFVUrXLd9wOSNQK11GOt93y4KsJuC7/0DAcBaRzNElqIoOaMqxe7qDz/lil07otES9Eitu6ymV+yc6Rg/ByLP0L6U/ECHOOjHPJXn+1c8F1RWJYlkKVKe9dzZ7zyxdTlBOF4ACDgKiSV6o2pPjWYO50MTKoxzXoLpgp3tvT1BDfJeAlDwUBqZyw77GnZNIV3u/XvPHWIU2q559bcWhDotDmFOffwMvZ04oZZgC7cD6ySA3l0O02lNpOR3cdt2tcwwQEt/hpwLZCkmlSNSqBQm/CpPuvQS5q+NzhYSTXChArgWor0j7q9i9nImkkuNw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS0PR12MB8269.namprd12.prod.outlook.com (2603:10b6:8:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 09:48:38 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Sat, 7 Nov 2026
 09:48:38 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 07 Nov 2026 18:48:02 +0900
Subject: [PATCH v2 06/12] rust: io: register: implement Copy and Clone for
 RegisterArrayLoc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-r000-fw-v2-6-fb37cc5b20cd@nvidia.com>
References: <20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com>
In-Reply-To: <20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP286CA0221.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::7) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS0PR12MB8269:EE_
X-MS-Office365-Filtering-Correlation-Id: 179cc065-95ab-4146-3042-08df3cb44c6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|23010399003|18002099003|22082099003|10067099003|261022105027099003|11063799006|261026140227099003|261028144727099003|261102123227099003|56012099006|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	i3iFcCrrKxmoMKrsvS22RBEoD+SRtCR5x3M8q7C/WS4nqNsRaoitkTssZLUdU5+xIZ9ffSCquz4HD8+UYmue5ZGAWEuqt7AribUs/caTCgMsCWCu237Asa299etuYlFjmoVhiUDXaWaXG7WyWcgNtvCbQaErryrQlEMJH6K/fBQ3MEkpUl5dueCrXPIOMSeFLTf1HMBagEqeMA6vAOaCwmzV7Poq/IYKXk/BxWkNQKubAI+zLt+sKT0aU/UyUxPzBWhpCP7UUO39aqVL9jrN+1NRAiPGakpav/HRzEic/4/s6al2PfpDFTPYJCA6W3WTXRcstbd7pTtSt4vqJ41a1n+B1KfParUaJtOBfr6MN1GtAhBTbnAkSF61g+6wlz1EWUtJoDnkaRsoJg7xn5U+BH4NI1HFssTMUmpJavsMaNadvfb1Ya5u/MPnfEJabtY4nW0+Qrj2wZVikszBUo8MizDgQ5zBR5nZs5erjdzSx9JqpVbgHkFQEurUHDjc+O0buR4zA6fO6RfynDV2XvGg2M3AnV3Dih16Z2wytOPVsvdmwLHJd6UjDfZYhEo0pdpJ17A+uO5GSfnfs9WkwTdSC38aF2XKzqVwBXbpP2TKhyhaQ+yN0zYzNbYHYEwb6bMox/BrWBuBDyvj71LkBZ7wLjy7Ug6UrrsLrxWyizsQP1g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(261022105027099003)(11063799006)(261026140227099003)(261028144727099003)(261102123227099003)(56012099006)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWptYTJzMTFZdGpzb0N6QlpRSUJnbkw1dHZIYk1BOHBMMDU5b3NmR1lFdnA5?=
 =?utf-8?B?NkFXK2JYc3VSUGl2S3paQm5raXVqR2wxaHFxNjRuemd1WCtFQlNteEFUQ2Mv?=
 =?utf-8?B?cHdlQ3ZYMmpGWTFvUUxvcWNXVzVaN0o1TmVGWUJibGNQdVlmRWc5SjNzMWps?=
 =?utf-8?B?cGI5cmlOL1B0NXlwQzkrOE1KVHVzQk80ZmJZUGZzRk15dzF1T3ZrbHF4dFo0?=
 =?utf-8?B?VEs3R2IySDZSVWVHcEticGlrZGp6eHQ3aDkrbHlnU3hteTlQdHFSMkpFS3pN?=
 =?utf-8?B?UjVJVHhDamczaUdoeEpETWh2QnE4NnJqekNXUW5TUGRrVVhLdzFRY2R1RUdY?=
 =?utf-8?B?THMzNmV6cGRsckdqSkRhVXhnLzlJbmlqeHk0U2hMdXpydmFzcUlLc3A1NWRW?=
 =?utf-8?B?UHMraDhvdG1GK1dycWRxZjJZU0pqWHliYVEvUXJ0ZTFiWVhBb0FoK1FoRXBv?=
 =?utf-8?B?YTJzejREZW5QdVhOcmQvREhQSnVaeXIvYm1RV0dZd3NncFJKY0xaREJxVzln?=
 =?utf-8?B?SnZxMHdjWjVvbmMzL3p3aC9WaXE2bGRMTVJMSzRJU0owQlh3OXVINlo5T0tp?=
 =?utf-8?B?bkllUHRNMW51QWtpOUhZTE8wOTBzTTl0a3FVZWp2V1B5ejVBQlpWK29QT3Jn?=
 =?utf-8?B?bDYrTytiRk5SZU9yOTVBWkRwYytFSWtZbnh2bmJlb3RicE1yRlBJQW82Z0hl?=
 =?utf-8?B?NE81RFVOR3A0QmkyaXhwUTlnd1RBZU02S0VKdHVobzhUQTZrZ1BOVFMyTVo3?=
 =?utf-8?B?cW1zeEJINUFoNlRYb3JEUXNzYUFJMFZTMkVuN1oxa3FFVm1MNUZsK1ptZVZX?=
 =?utf-8?B?MzZsZFNrZzM3NU96dWJEVjdpUGVCdy9qcndSc2RzVjVQSDRPcy9ZNlFvVUxF?=
 =?utf-8?B?bysvbXp6cjhJT1VINkljY0tjZXI2QUxyM21KazN0eVVVWTRMcXlsOGZRL3FH?=
 =?utf-8?B?RGlWV0tkZDh0NUJOMjVXN3NBU1ZjRzI1RnNkU0tobmg0TVJVQWZ5UThqbkhl?=
 =?utf-8?B?TGs1MjdibDdCM25wRElkNEQ5ODJTa2FSVFQxL043NU9ZL1NPSnhHZkF1YVJw?=
 =?utf-8?B?M0xRb2hsbmkraG1MZ1VFTW55K056NlZpcDBscS9mbjFyZUY0dDRhSkxqM3Iw?=
 =?utf-8?B?dEEzSnlYbVVzcG9WUmpqZkZkTXE5eG5GS01qZFhmSDhMeUc4ZW8rUW9JNnpH?=
 =?utf-8?B?NkU0cFh3UTYvNUJpa1R3REtISGJlbkFSZS8vdTJGaU1qdlpwN0diNWhXd2x0?=
 =?utf-8?B?TVVqR0EyVkZ5VzdDSGplN2M0NEZ0VVBxOXJTTjJMV1VFcDdVdFZGR003VDJq?=
 =?utf-8?B?akwydjVCZVBEdHJhOEJpd1dISVo5MkNCczFETGJkdmVJNFZ2SjFKKzZ4N1Fv?=
 =?utf-8?B?azZiVDI1U3Y2d2M5d2FReU5tSDVYVnF4OXBiRzFVQzlBaDhvTmZPNWV3NkZx?=
 =?utf-8?B?alp5UlhHK1dZRXd3RFVDOFk0aWhEQkowdkJKaTg5ZDBqQXp4RzArTXpnRTNG?=
 =?utf-8?B?VHBlUFAzRExvUHR5bVlSeE16WDBYNEUvaURtM3dQazZKbVEwMG1adWxGd1E5?=
 =?utf-8?B?anF5dUV3NGlpZ3E3MVRUdkpyWDYwN0d2YnBHV1ZmQ1VuQUw4ZDVoaWRzeS9q?=
 =?utf-8?B?anl6dis2R1hFWTN2YWtoUmRsOWVZTlZwVS9JVitIODVQQkFEbjMybGdPcC9F?=
 =?utf-8?B?S0xqYjhncWJSQkdsL04vbWRTcmNNVE9reDZ1eHFrRzZxMEIzL3ZGMGVnRHcy?=
 =?utf-8?B?OGs0VWhVanplRHIrbmRiclppWDRCTlp5a0dFR3NsMkVDSnRDR3N4TjhrSXhC?=
 =?utf-8?B?UU5EOHdSbnU1YWRHMEMweUZOUFRlTFpXQlMxaVkzcW1ZODlmWDdjRlpBdzRt?=
 =?utf-8?B?NXhQNU5JZnIyY1gvRUNNeWlWMDI5d0hhMXcvRDhMcEtEYkZubExGZnNIOWVF?=
 =?utf-8?B?WlVWMnhRMkxhbzBzVk9KQ1A3R253T0ROTWdPWFVtVUloMzNCUHVDOEFVS1ox?=
 =?utf-8?B?dWdjUXUxcGFNdVNyZFhjVTIrRXRCbmd3OWhBRjZ0ZTZBTy9wSHRrN3FOeHRn?=
 =?utf-8?B?a1VSMERCM2NDV2prbWV3ZzR5empiYjVhUXBYZm1kMHB4dGpyNmxKdnVadnBD?=
 =?utf-8?B?OUZxM1dWMkwycktmK241aUFUQ1VoaUpSblV6TGE1dWR4REFwbHdVWTdnMWJW?=
 =?utf-8?B?ckxNY211U3NyYVVXSUcyRFdJQ1cxZzhoSmNQRlRudkRSUWNhZ3c1aDhKWmRT?=
 =?utf-8?B?ai9ueXMxSlZ5cnE1Nk1BSFNkZUlKc3pMaWVrdm5HWllvYUdzeGk4V3FqR2tw?=
 =?utf-8?B?RHBVdlFHMjE4d3cxQ3FlZlQ2NUYvY3IvUGo2ZlNYK3RlbkF2djJVRXBWRDR3?=
 =?utf-8?Q?r4emjtQ4mYRjU+ScC5nZ0MyCIvZQ1BanrzbxTDudO9nLS?=
X-MS-Exchange-AntiSpam-MessageData-1: dw7WK9mxijoVWg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 179cc065-95ab-4146-3042-08df3cb44c6c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 09:48:38.4749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v1Pp/ja7JEj25VcgvptsiJmk7WIFrpWAWoLLBnD/cz09gStEJHBQGNaCNxW/ej+EtqJy4tOekgQ4fiNb80es+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8269

Register array locations are small values that are cheap to copy, but
obtaining one can fail. Making them implement `Copy` lets the same
location be checked once and used for several accesses.

Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Gary Guo <gary@garyguo.net>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/io/register.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/io/register.rs b/rust/kernel/io/register.rs
index b6513fa0f412..9e31e68d02cd 100644
--- a/rust/kernel/io/register.rs
+++ b/rust/kernel/io/register.rs
@@ -194,6 +194,14 @@ pub fn try_new(idx: usize) -> Option<Self> {
     }
 }
 
+impl<T: RegisterArray> Clone for RegisterArrayLoc<T> {
+    fn clone(&self) -> Self {
+        *self
+    }
+}
+
+impl<T: RegisterArray> Copy for RegisterArrayLoc<T> {}
+
 impl<Base: ?Sized, T> IoLoc<Base, T> for RegisterArrayLoc<T>
 where
     T: RegisterArray<Base = Base>,

-- 
2.56.0

