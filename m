Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010009.outbound.protection.outlook.com [52.101.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E40E26AA91;
	Mon, 16 Feb 2026 10:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771239170; cv=fail; b=PdlYRV9f4Q6eQGl7qVBFS6JFmSwXED6FO/Jp8Lt0lAYM38gr2ezlGBf/KSKw5vxtZLTomzVFFc6MXO98Yak5/31ScCocY8L3SyOyToMdrO/pJ6CKTC7If6XMJbGt9rcdYCcXniMJYb5H3uBwpQWeN08untUwkf3G073B3Y7z1Nk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771239170; c=relaxed/simple;
	bh=pOukPD+eqPpaZhcHLQipmQLUVQqrElvR9TGmfh0Oso8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=iMwzPNXYw7Mg4/wsT25jr/mofxqXB20RGG8bpu1qf3Y2R+by5nety3nSaZxOkF5LJTGn/ZNyqX5hPPM8bYq9Q4Pa6XIRTOJiR3WQdw6UJQYu2tPPw0+qlwp51dkq6yTLh9NKsEUlWLVa0O/e2sHqxWlUMmfmx3fqLV54SFLQ7jI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eG4m12Pe; arc=fail smtp.client-ip=52.101.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eG4m12Pe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=otP2TtZTLfz+Ksxlpavg6xiO4qXmZ+o1Mq6Ts/ko+m7MsmjgPk1XJkKMric2ykru/wCrDGphzALDsP1/yCd48aCXoPxi6C6h0U4Iwjt9vKQVxV6n7NKqla5oPYgUpwr6aSge42HDBZVBlpdmdurLjJrexCPWUUMDD0uO3XdjuHdrlIl6IMwwcGaBtEhIHPZgTjscbS0an4e235KAFfyUlG57xlDP00TgF16G2Gd+DPzEZ2htOZaiut+auqJBXn09LQzalDSU2RE6ck671X80/T4jyLoX6i3CDtIAsp/quriEf2tyBa9T1qiZ7oD6BzvHLb92/RsRbfZr6HikqnZY4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYXboJ5H6Es8PlMNi/cQGehRoB8Mam7obHK71GRNK9Q=;
 b=ZL9swqUkyCgTUoN/116gb4IbIrjI+ucFsU1xYU6cZlONfO+xbdkfptqhvVqk88jiXtK2EDHkoww56SFZpxNx9OTh8NDkIIEvyyBK3MxqECjpMFV+8vqKfrO8ZUqYP2fojcXCUmt+qE4fupw/B3W5RKv7PYy5aZ+y0Wg7/Gg7bYVioLfPV1i+XMBNIuQZEaDmo11OENq9BDfSa+sMALPLu62Es1oWDZ0RRABET4Ka6eTBI01UhoKe6C4il58W0nyVzV9HcjkEz7A8AYvs/aQdvFhBVg4Yysf6KAuGBL1q2YGyqNqVTfXg/LNwV2moUN0DZjjfyB2t3ywC6+31AKGMlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYXboJ5H6Es8PlMNi/cQGehRoB8Mam7obHK71GRNK9Q=;
 b=eG4m12PeiID8bQc5lH44Aqz9qhbgLtRmOR5SIGQP3OdhKsuyTmAWhg8MDKIQIlvv5G9MVfm6KTMSIJ0FDoTQCjQnTz2HHsDmPqu5w25mJl8B+BTUyrTZe8SRqXC1zpyjWYwXFME1WyirZ71Z5ocREeN8+pytzdHU7xSkgAOW9PCBaMjd0wfFUVRJeg6cGyqdklQzP7CbW4j+Y19G1f37eMw18KP68wYto93BX73tEJXDdMxjGuF/TMKbWTDXyB1gx0d0EFOzkOEgbJZmGXFOO20VPwTg2VfrzwUWuVA0D0nK54mSKZF/8HA5ZrokXrOD0T2Ysr1SCv9HHXVomyqbxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4105.namprd12.prod.outlook.com (2603:10b6:5:217::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 10:52:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 10:52:44 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Feb 2026 19:52:39 +0900
Message-Id: <DGGBVOL5XZ5B.NIXE0JCEBJC2@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 5/9] rust: io: add IoRef and IoWrite types
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alice Ryhl" <aliceryhl@google.com>
References: <20260216-register-v6-0-eec9a4de9e9e@nvidia.com>
 <20260216-register-v6-5-eec9a4de9e9e@nvidia.com>
 <aZLc0YMHd8C0bVD2@google.com> <DGGA9D0N19KQ.4LBXRAEGNMLX@nvidia.com>
 <aZLzBP_v6JlTR9WB@google.com>
In-Reply-To: <aZLzBP_v6JlTR9WB@google.com>
X-ClientProxiedBy: TYCP301CA0030.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::20) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4105:EE_
X-MS-Office365-Filtering-Correlation-Id: 087e0c91-2fbe-466d-ce43-08de6d498308
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L3hTaHlmZ1NYdEMwSUZjdENVN2E0czNCUm8rRWxxOUsrSTRUTlFpYVltbDVR?=
 =?utf-8?B?dG83ZjNLTllVcGE3MURxRS8raDlISGpKL2tzN3I5aGF1RHlaM2JQRWN5d2RN?=
 =?utf-8?B?L2JJS25USWJxckFhVnBOZVJPbkFsbWIyRzdoeFFpYWZPR1Q4WnF1UG5oVytV?=
 =?utf-8?B?eS9WNDh1WFoyQ0NPekFaakk0WUM4dm1HYmRUOFc4NkxqMlB3ZnNPeUI1RThG?=
 =?utf-8?B?RnF6dzV4WGg4eHVTTDFmU3VyVjJsNWZPaDNaRW5vQThIRVpWem5ubHc0KzZE?=
 =?utf-8?B?SDE2R0pLcFFGKzd0d1ljc3kvOG5hSHprS0RGR3NIeW9YSHRxSlZIMStvRGYy?=
 =?utf-8?B?dk1INXNMenZVWk1PM09ncWJ4dXpKLzhZNTNpVlJ5NjROaisySEs5MldMVTJU?=
 =?utf-8?B?QW9ha3hDZjNZd2Q1cWh0NFdKcWhadklNbVk5UVZ3Y3RuS0NRSmdwQTVOWldi?=
 =?utf-8?B?N3lrNFRmSG1uN1RjU2lSWjE0SlVadE1TdlhzbjVyY2F1T1gvN3VrYXJSY0x4?=
 =?utf-8?B?OHlnSmZjaThVVlZFYWNEOU5kby9aUFNVZjQzSkNERDhnV2tJTXppVzVuZ1pr?=
 =?utf-8?B?V2RFRWFUcGt2cHA1cWJmdDhZbndReU4wbHh6a2NTV01MMmVSWXpzMVBnSmhN?=
 =?utf-8?B?OEFYb2oxNGw2b1lXU1UxejVvSFZZeXdVUWlsZXFEQW8vd2k3SmRuZnRocHVi?=
 =?utf-8?B?RlI0L0xZb3Fjak1paGx4MmI1Smg2Q3gzbGZUWDdlZHZlOG1mVFczemNlWjRu?=
 =?utf-8?B?emNSb0xJMXJYRlBMMUxKNTJPRkNweE5vWDd0bG1kTUh2OGI5QkZFSHZncFAz?=
 =?utf-8?B?RENza1BnVS9ub3Q0NVM0c0xwTkdIdkh2MXRvamhpMml5VTN5Qmh0Nm5MU2Q5?=
 =?utf-8?B?MU50eEhRUUJhZlN4SFhlNDlDU0swWXdBZUJ2STBaNXBJVEoveE4ySGFLeWxZ?=
 =?utf-8?B?dktMOFkrYlN4eVBBL0xGMHpDMHluWS9MZVROQUpteHd2VWJGb2NQRk0rdjg2?=
 =?utf-8?B?OXNhSmF5ZW5vMDZ0M3dJampkaTRlT0FQZ25LMUh0S1VqZFArd1NwRUZHYjh4?=
 =?utf-8?B?aEx4TGFvZHdFaXdBdlFrQjVDdE81Y1h0SmlSc2lnTnVOY1hEVi93NkFBSlpm?=
 =?utf-8?B?OEhNeTRlazdkTHAzVFJDOEFJM0VVSzRsOU9zN01QV1dSWXlDZ2RSRHRoemYv?=
 =?utf-8?B?YWVqbkdmK1EvR1prMWpkRHVBV0JiNWd4OHlLZVMrMksxVUlXM0FmTTd1Z1NU?=
 =?utf-8?B?ZnAzNWhqWjdUUjNVL1JQUHN2Q3ZvWjFMQVN5UW1WR24zN3lzN1ovTm94OE1U?=
 =?utf-8?B?bnVwa2oySStHdFMrdS9WMjhMU2tiQ2J3dXlLRmkxbmdVT3IxcTdjQTRPVlZt?=
 =?utf-8?B?ZGk3c3RxUG5qNXppOC95Y0pFVkgwekVXaXY2bFppbHFYUWwwVFJubDFyckJJ?=
 =?utf-8?B?YXZJTEtabEh3YTh1R3R1VzcwNjUrY3N3eC9PMHBNdDE1d2dHdEIyVlc3V2NJ?=
 =?utf-8?B?NlBUdGFUYkkvaUhQR0RSRHNheEpXMG5CUTJjZTVJQTdWOTZhR2Y1SjIrMCtR?=
 =?utf-8?B?SVlzSldITkpqRWN0Qkx5U3d3b21uT3FNSlZKNTIrNlB6MW1zcDc5MWY2azhB?=
 =?utf-8?B?YVk2TnRXN3FtVTA4WlhjNjREVHR1WTkzWDZlMnZnbE40WHV6T0k4MFgrb1Fs?=
 =?utf-8?B?bEIzeEgySFROZXM4L2lVVUtTWmdneXdFMjN4WFI2NWhFWkxhU1hLVE9HQk5G?=
 =?utf-8?B?VjlTS0lqd1NYMmc1K0xRUEN2dzBURE01NlYyTUJienYwcXpCaEZyVXM3Tlor?=
 =?utf-8?B?ZlZ3VUNRK2EvcFBUenpGRnpZMkZZVnk2QitCUVNnL1ZnTVQ3Mi9iUUI5OGlV?=
 =?utf-8?B?V2pVaWt0L0NjdFNMUXRPbStZcmp4SmIwK0FRZHFJa2dTdmwvOVRtWXo2RmRW?=
 =?utf-8?B?NTFoMW80UFEvcEszT2l4MDNucDVsdUxPMVNkL1Bkald5SWMyQk5RdnNIUmFH?=
 =?utf-8?B?ajZ3d1orOHZ6aGxFc3d4dEluem5vVnZySEg1Y0hFdzlqamphaVhtdkZkWVll?=
 =?utf-8?B?Q1pUdHlaS3FHMkVzK0JUeU5jRkpyTzRWV2FBcmpSdjdCa2s1OVVkc00ySVpi?=
 =?utf-8?Q?PFwQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlhXS0MwUXVyQmhjVWZTWGs1aVZhUTM2V3Q2ZUp2YW5ZUFVCZDNWdWIydjM2?=
 =?utf-8?B?azRSUnA1d3hWa05KOVJ2UzAxenJaYVNmNmhNcDlBVXlNV0s1ejVtOFl3TzA1?=
 =?utf-8?B?UHR0MmZRTVRFVXRCTEJ3Y2ErWUpxbnJKbmRlUFdLVW9GWWhUQjFUdzcxUGYx?=
 =?utf-8?B?RmZOYURkdFdtWUV1QnNiaStqUlc4RDNmbXp0MkYrL09vU0FWZ1ZsNEkvMWxw?=
 =?utf-8?B?cmQvNHZuTi9uK0VkTDhsOXo1NWJMeGE5aHUvdGxFTk53b1ozM1JObFNzbUZr?=
 =?utf-8?B?dG5qZTZnRjZJdHU0cVZKdkwwMGVjWXUwZlhGUFJ2cnRicDRFQ1BVdnhSaGM4?=
 =?utf-8?B?TWVyUHlRQ2JnNFNPSjF3V0huZW5NemNWUzVNS001ZzRadkJubkZJdk5lNm9O?=
 =?utf-8?B?SFRaZ1pmNDQxcDBmNWFnT3pMT0tlUGJ2a0hPeHhtMTBtMnV5ekliblN0Rjhi?=
 =?utf-8?B?OXl0S0ZiV2dGUnM3UGp6b25jcmFBQTl4ZGo4RWM4NTR2Z3BrajFzQm54d0I2?=
 =?utf-8?B?cHFlQlpKVkdhNGVneFc5WUN3Nm93dFA1Sk8wLzFuNlBqRmx6REVDaUVJdy9E?=
 =?utf-8?B?TWJLaFAySVhkbzkwUmcyVlJiQzVVQ2hnUHRKbWJheVdIMnI0a2ttTm41SjdO?=
 =?utf-8?B?TFNuQU9DWHd0cFFQMmdnTVl5UWxTOTlrVk8yTXkxMUNKRWliM2NacHlBZk5y?=
 =?utf-8?B?VjY5VXZWbkZaTXZvOGZjaTI2ZjJxdjFIem1WalNPUi94cGNCZVVDMS9yYm1L?=
 =?utf-8?B?ajJrd1MzZkl2OFZhcXZndGxLVy9xSW0vYWdtSGJPMjlZRGp5em5RWVBQQndD?=
 =?utf-8?B?R2tTbkc1RUtYbGIrdHQvNHRJTmdJdW50VlZIM0hyQlEvVTlRbjZOQit3UVEr?=
 =?utf-8?B?TUFRQmNNdmJuSTVJeUdWZ1ptWUxOU21wcDZvK3ZKVEpVaThGZUp6elh2N0Y4?=
 =?utf-8?B?aXBML2s3a2hlbWttekJCMU13aVRsMk5pSXBHUW5JVVU4UmtTUzFIaDR3WUND?=
 =?utf-8?B?Z25UeUhPbzNsa1lkclpBMHAxRGtiZ3pnc1NxQWRXZElST3Rhd2tEd2NvblhN?=
 =?utf-8?B?eFU1Qk1ZTTFvVm5ycEZlOUw3MURhT0laUGo2akd6VHFuQWtUSTA2MWhKZXdo?=
 =?utf-8?B?Qzl4akw2RWsySTVKMjZGM1Q2cW1BYU5tSmVmOGJtc1BwYm1kd1N2WDFQMUNn?=
 =?utf-8?B?RkRXTzVtUlNnZ0pCWTk5NzI5N3MvaU8yOHRScm1GajJGbDFvUDhnK3ZFNGxY?=
 =?utf-8?B?VW1WRHJBbTVFbVI2V3FiSjE2Zk9lODdKU0NSakEvSXZtckdDM1VUMW5jdzdW?=
 =?utf-8?B?ZG1kMDNTZzRmdWNFekpQWVpKdkZWdWxRbVplL3puT1hZVitMQjFWR2J6clhh?=
 =?utf-8?B?TVFhNGhla0JuTStQekZKSUZoUUVXMms2WWdHMW05T3JjMVBSMStXVkhyUU9S?=
 =?utf-8?B?dndmdkIxRUJxTjJReHE4VnVtdTR0dUZMQnNZMjJFMUZRWlh6akJVVEZGeWRh?=
 =?utf-8?B?YnR2Wjc0dGJySEhXYVd3OHF5NU1WN2ZzMGx6TndlZUdLcjUvbHNwekdEOGdH?=
 =?utf-8?B?RW9LZ0R1QjZRdHViSlVYZ25qNmNEcmZiajZGTlVJaWRlbGkwQ0Z1bHpzaWNU?=
 =?utf-8?B?N1FyMFZnRWROWHFvaFUycXVTUHFLbDF2T2plQ1Y3Ni9UcXQvQ2ZRU0FjckJs?=
 =?utf-8?B?VE5mUkd5NDJtSitiYnU0bTd4L3k5OTE4bzIxb3NCdDllem9DMHBLU3pSbGRL?=
 =?utf-8?B?dnFZUmhuejFWek9aYmhLQ2IzQVp1ODgzSFVjc0cwVGdENjFmWHRrcG9KM05K?=
 =?utf-8?B?NFlhMjIwTUtSNE9ZUmR2VnZZTE9zRzg1N2JkQ2Y3MmZnZEFadHRVK3owWTJw?=
 =?utf-8?B?S05hcDZtRTRoUk5mcnN2NlFNVHdzYjlQdzFOQ3BvYmtPWXQ0a25HMUhTb2Zx?=
 =?utf-8?B?dkZheDFLNXVCbkswR1ZjYk9QdVZaTDJHaHA1YWlGd2pzZ1E1TmVCV2lhQStn?=
 =?utf-8?B?c055YkpVWks5SlZhRW1US0Iveml6RG9MQU9qdWRoUmdJM0lyWWN4Q3hjcGVr?=
 =?utf-8?B?WGNPdFd0WGc1NTFLckQzeE9sTDZFQ1FESXlNbUpjcVNyRUNoekNQU1d0WUtt?=
 =?utf-8?B?RHJjRmI5QkFIWEs2V1Z1d0JkRU02UWFHbjA2V1VwcG4veW9NOWxKMldiMHRF?=
 =?utf-8?B?NkpUNFFRTkcrdzJoS0U0SThDaysrc1o0b1RMR2ZicFBPOWRTeWYyenVoOWFG?=
 =?utf-8?B?SHQzU3hoaks1M3NrdzBzTEd1MXArTWF2QmhjQ1ppRWc0U1JrbDhUakJaNWhQ?=
 =?utf-8?B?MkdIb2p6OGZ3eXpDUXNrWWVwT0Y4N20wRWljMkt3N0VXQ2hQbjVKNklPTVl5?=
 =?utf-8?Q?ILCah68ueL1pWizAbQ9o2vYqBun/5AhWB2xba0Idd5qFd?=
X-MS-Exchange-AntiSpam-MessageData-1: OFlsOB+QcMkrdA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 087e0c91-2fbe-466d-ce43-08de6d498308
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 10:52:44.0015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hzfFCPFDEEQ74Tm6YlZm2IOyXpLdSDMHmrbz5eACKeMYgNgfqDx9R95Wu4UWMQuzlQx4Q1zAdB3rQxfuiERqmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4105

On Mon Feb 16, 2026 at 7:35 PM JST, Alice Ryhl wrote:
> On Mon, Feb 16, 2026 at 06:36:29PM +0900, Alexandre Courbot wrote:
>> On Mon Feb 16, 2026 at 6:01 PM JST, Alice Ryhl wrote:
>> > On Mon, Feb 16, 2026 at 05:04:41PM +0900, Alexandre Courbot wrote:
>> >> I/O accesses are defined by the following properties:
>> >>=20
>> >> - For reads, a start address, a width, and a type to interpret the re=
ad
>> >>   value as,
>> >> - For writes, the same as above, and a value to write.
>> >>=20
>> >> Introduce the `IoRef` trait, which allows implementing types to speci=
fy
>> >> the address a type expects to be accessed at, as well as the width of
>> >> the access, and the user-facing type used to perform the access.
>> >>=20
>> >> This allows read operations to be made generic with the `read` method
>> >> over an `IoRef` argument.
>> >>=20
>> >> Write operations need a value to write on top of the `IoRef`: fulfill
>> >> that purpose with the `IoWrite`, which is the combination of an `IoRe=
f`
>> >> and a value of the type it expects. This allows write operations to b=
e
>> >> made generic with the `write` method over a single `IoWrite` argument=
.
>> >>=20
>> >> The main purpose of these new entities is to allow register types to =
be
>> >> written using these generic `read` and `write` methods of `Io`.
>> >>=20
>> >> Co-developed-by: Gary Guo <gary@garyguo.net>
>> >> Signed-off-by: Gary Guo <gary@garyguo.net>
>> >> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> >> ---
>> >>  rust/kernel/io.rs | 243 ++++++++++++++++++++++++++++++++++++++++++++=
++++++++++
>> >>  1 file changed, 243 insertions(+)
>> >>=20
>> >> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
>> >> index b150743ffa4f..6da8593f7858 100644
>> >> --- a/rust/kernel/io.rs
>> >> +++ b/rust/kernel/io.rs
>> >> @@ -173,6 +173,160 @@ pub trait IoCapable<T> {
>> >>      unsafe fn io_write(&self, value: T, address: usize);
>> >>  }
>> >> =20
>> >> +/// Reference to an I/O location, describing the offset, width, and =
return type of an access.
>> >
>> > In the next patch you implement this for usize, but here you say it's =
a
>> > reference to an I/O location. I'm pretty sure usize is not a reference
>> > to an I/O location.
>>=20
>> Methods like `read_u8` use a `usize` to reference the location we want
>> to read, so aren't they in that context?
>
> Oh .. I wouldn't use the word "reference" like that. How about "index"
> instead?

"index" looks more accurate indeed for something that is not a pointer
type.
