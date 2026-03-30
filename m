Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012043.outbound.protection.outlook.com [52.101.48.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FCE3E95A6;
	Mon, 30 Mar 2026 22:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774910848; cv=fail; b=KZgiu7nTxvuUPsXtNphdrXLanM8ac+9LsUEytN7MOozwaxZeWSQtorDsrKeNkl1omyMFACuYd3tuFVShyBonAUwT/eYj1PM1zLkJ7qr/BtfHQF8ncplc83TZiy2GH7sRsg0WyerzdSVVVsIoZbb8nO2ZsMK5y1PXimEr8pCpxGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774910848; c=relaxed/simple;
	bh=pRZNoYtxwcb5j9XRJ73n5F0bxzUQRn/omTbyYBOXaRc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=muUHDzFW8Gy3xUhd2aFCzp6XMC+aRCHIKz694jpa0DgK4IsUXESVQlQLOQ3wTy/+EUprwKtAYPrc/D/tjScz3h794NCV7ZCxHvD6JwGSHSNnmCY4mMm0FEI4WjTXmYCHEjBHCDLfYwjmTa8GVZtLT6uOw91A0u+3k19lbIHN4o8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lrs3s6KG; arc=fail smtp.client-ip=52.101.48.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lrs3s6KG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rO7N5ZPBt/bvzBpO/KU/Cap7GA7xTs3X/hPdlL1SeKGwkPMd3PYYoFgaICFRrKqmyPl1C5as/+/Dtojd3C61t6Gge45eMvrE1Iotj+Aegl/9vLx+TlrPVc7LJ9Fhf1JjBtSkaJIfqLAvZBaukdPYrpdqk3K69kiS+bLzmO7sxyOaXe2uugt6OmJOzjTN54lGDq7WW/QrKU6qyMQYLDepLceXDaHri5Z0yATDxhrCMOE4ZVI6Kb9lPugPDnOQN/jGDgS7R37HSFi/M5QXWwyPfqXpe+AmAPL2mOI2g4eAM9TJ19HGrEwGkmr4lKIzebkdkOjohu/DlWktYPaizvJO7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qjpqBEgLkJapc92DvilSUyAPZdwyfG4vQC7fSZSJvh8=;
 b=zC7jTChQlXfP/vM1DIeIreJNdRUMlfPA/8qm/XrUKYcitWr2ug1HS9TNy9prX3clB4nRV6ORjpjfv67eBD7rAoFbG5xolZBMmJ860+LldsESlQUuO2WTAbPyk9KO9oa5tIYhFkBz+tFlKJHo2DF2I57szIGYTlFaeWKkqIAZdjAirx4tKiNhBfS19WGUruIX0RYsLSLGaTnew+Dp+UHgh9fX42Ae0oRIaVxX/lZZJcM0AObnu/QSMaul9kFgWE3fa/VO4RntIlSfhomXVFUUnt8I2i5zMfsdFzN1MXWtML/PES7QVKbJ9pvafrUGl6aeIzVtwuiJwxJZ7jiD7YpnoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qjpqBEgLkJapc92DvilSUyAPZdwyfG4vQC7fSZSJvh8=;
 b=lrs3s6KG1OWQB8QQu6P4aC0/kBs50+qo/VvhQnlriSiGbWDgtDgT/J/itfC1RvRFYgcyrdzOPj62oako11zZT6sbJfFtMcqnFyWF0T+WMHt8CG8WXUtVCfYRsCo9vNJ2Ixo4yQE9EwdgJl6HdmWTbVZLqBBpj6UuhCNA6Asgm/61CJ6Boa/ejdzgcWgksZdlhnzllGzheCGB9HivRvqiHg9GmMGLd3B+gI9FWo/oo6KkMJgLuXNuIRERZ0NL/ax9gamUiMgEQb77ME0E+h/FiwKM2HUWsNupCG/ZrC7HYysZ+MsFfeNfuzjJZdVkadzx2Wj8APDYZjb5SSrMC3He7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB7544.namprd12.prod.outlook.com (2603:10b6:208:42c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.15; Mon, 30 Mar 2026 22:47:20 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.011; Mon, 30 Mar 2026
 22:47:20 +0000
Message-ID: <3f9fa9f5-1ff4-4ed9-ba00-eacf4cd6699f@nvidia.com>
Date: Mon, 30 Mar 2026 15:47:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/31] gpu: nova-core: firmware: Hopper/Blackwell
 support
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
 <DHFUW9OH373D.3BAD8OO1IRHBP@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DHFUW9OH373D.3BAD8OO1IRHBP@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0006.namprd21.prod.outlook.com
 (2603:10b6:a03:114::16) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB7544:EE_
X-MS-Office365-Filtering-Correlation-Id: bca5b9e0-c4ee-40ed-f7b2-08de8eae4d50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	PsaxtY4aNGWyDsSBfw3OJwf0xr+r9KQHTQDedXeyqMJ2/blqYSH4RDsrbOBhi51t5EvWKpe0aK+uzfH7/ntPDokdSqWOmire1R4TAcmwfn6gEdt8/8HbQcbFD423hWyg3B47DHfvYBQhZ5Z9ZAgT37/Wq0JjOvq8xetNgJQ5dTKJdZuZdaxTGyzHMwUHjP57SBQkKoL79lf7JuPdV+bAaX7E7IZLBfyL3+lTZn97JtoSZkLXWFSTJSb/0GLThbft6iFH+7rTrmvK6rwMZ9XLOVvUNX5W3oY7HS0OWJ/QAkJA0au1gJreqJvucVxjgYN2J06VVOBiulW+tW7yTlZxgODvx0QUuZCjtE8s7AKixzauipY0+sSTFAXJeOacETlIYwD86bIl/+ChErZx+kG3G/ChscbGE0PDE5caX/Lf+ULCSsM3zA8QrbzgPLe3DNFIy7OV8KJ16wnlZ+7l91C0lFLqsoI51EklLVm1ZCZo3byd2BKfH8kyTsuZ9h1PRNKpqeJYQUvjU4aDU6xI6qOTr1+3gXfBlkK5/fCM5lZY+VUKKw9C1o3aecN2ASWkSXitzwSTXccTrzCtWbU2TFySynqWxNAUNet9f5gA9kJLF0e8q98HW9QiA5UOB/5JhOoxgmFY9oICfydpAy/ga/mW4czYjcRNKUJvSc0rkeDxiaFN/s7TThX5T+BuGo8V48CMyAhOdsm6JTG2m2d44YZwyyXYnK9FRLyneEKhoOQQy04=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djdzR2IrRDBSQ2hYQ1cwRVhBdGd3UFJ4RW1PWERUVzdTU2VDcmZscExmaW9E?=
 =?utf-8?B?NE5RelFNUkh1TmREN3MvZWpmcjBITERBVnJsa0duM1piSE9uNWtXaEl4aWEv?=
 =?utf-8?B?emd3RFp1VVYrNkVOS3UrcnNJTVhSdE4zSVFPSVpaNjl5OFV6Z2pkakp4VWFt?=
 =?utf-8?B?STZReXY5bXJ1NkNuODZyQnVSOWdZalVZQkJqUHJrYzZFSzN5K2lRNVMyZDNM?=
 =?utf-8?B?Vy9XM1JXdEQreFdJRG8yLzE1Y1NLTjlIcTY0L1h1RkJ1YTRZY3JMQkZHU3JQ?=
 =?utf-8?B?ZXJHQ0U4bnN5Vjl6UmxFVzQ5bThMejhUV3JTaFYxM1RtbDhtQmxBbldnRHN1?=
 =?utf-8?B?Rjc2SWJmcVFtMnJ1QWRRNUtVaHdMNHZwS2UraDJQbEl2UHRvZ1RtQXBsZTBo?=
 =?utf-8?B?VDJpS0ZaZ2ZEWFJGOGZuTTUrV0pseENEdXVBaUF2YzcvTW5INW40MXI5ekRy?=
 =?utf-8?B?MDl6YUowQWl3NG5FRGZ1MStZa0ttbXc4YWZNSTZ0cmZ1dkYwOUxPdEtIOGV5?=
 =?utf-8?B?Nm5nN0NHQ2RQQ0FoaHJDMFJTeVZUMHZpVWdDZ3Q1YW5kd2drU3l4Tk5JaUNK?=
 =?utf-8?B?aDZNNXdheWtZaFNLbmZYNVRlSy9qQ3ZWdW1lS2RSYXBycmEyM1l0R3dYOTFz?=
 =?utf-8?B?eGVOamc3aWwzZXphcXVhTFJxVjR5OU5JaXJKMTJNc2ZiT013azNVWVM5SGp5?=
 =?utf-8?B?THdzLzdXb3NiM2I5N0VtUGc4UTU1cEpOOXhCRVRSdWkwanczRXZzTUU2Rnho?=
 =?utf-8?B?Mk9DVFloYXMyMllzd3kvaGNvNTVmd2orOHNlM3RONXlWNytMUUhNOE4wanZD?=
 =?utf-8?B?MmRESVJrelgzWGhqLzNiYzBWRmd4Q0NMN3RHcGJ3WXo5MmhsQWk2QU81OTVQ?=
 =?utf-8?B?VnoyNzJZOTN6a3FSeEprM3BmY0RQWnFSYUZITFJPeEQ4WEhvQXc1SXZwMTho?=
 =?utf-8?B?eWlnRUFrd0g2MnN4RFJ3eVRqMU41alBiWjlGdERXQ0FpRk9iZ2hDU3YwZDlr?=
 =?utf-8?B?cnZxVU43K1IwWlRncGdMR2RrSzF4dGxUaTBNd2g0Zk5VMUZqak02ODVGSlZT?=
 =?utf-8?B?WmoxU3dRV216OUJoS3pOUDA2cHlYMUhGdWJjZHlmZG5pSWMyUVBXRWx4MEdS?=
 =?utf-8?B?K2lqRnRiZnUydnFHRjM1QmpzOGRaaVk5M2ZzeC92SnRpdHFQd1RuOXRUNEdM?=
 =?utf-8?B?cFhYNXJNaW9VK29EbTRGcW44THJYeW11VkV6d2hBbzk4MTBndEJBL0sxWXVh?=
 =?utf-8?B?REZtVDZWQTFaSVQwbDdFLzl0MWRmaVMvVGdLazVWWU5oTS9BVFdNZVZZUmZQ?=
 =?utf-8?B?Ly9KM0tEVHBnQ1FmSUJuRzBMcXQwWkZLTkkwZmoxMlBvOEJOc2hDL3B6NjVE?=
 =?utf-8?B?NE9hNUlsYURDSmZrdmhnQ2NWUnZpZm5yUjBpVllrbkdwZXVjZVZFV3B2cDc2?=
 =?utf-8?B?NThmWVROaENTalFUU29DaTBZSU44aTNubHdCNTVZckd6ZjRWeFc0VExxYkxZ?=
 =?utf-8?B?VytmeEN1NmlPM3cybUpmQm0yWXBVckYxWUZJTitrN1NnUVJKMHFWOW5SKzI1?=
 =?utf-8?B?ZG5zODM5Mm5oQVU5QjlFaEhCcmxFa09hM0dDUjA5SGtZcDc0OEdXdFdWamp4?=
 =?utf-8?B?TXYxaHpOSkd4bk85MkpHT0huR2JMZzQ3eHREQWYzNlBJd2orcE5CQUlMWFBF?=
 =?utf-8?B?Q1B5anptLzFKMnRqMUlEWkZ5VzVrWlRDcnJEbXN4SWRRckZzTGQ3SVN0RDh4?=
 =?utf-8?B?Mkthc3hXN3Ntazhld2lMVzRUR2lTN1Zjakx3akZxSkFGVTlnVGRrQytVRGJ6?=
 =?utf-8?B?bExHOWFaQW52MTZjM2pLNTRLbFcwQldFbHVkMkFyNzhnbTR5VkpWWjJObE50?=
 =?utf-8?B?MXRNR1hTeUpGbmdUSXYyOXRjNTQ4YWlvWkNHa25pZEowVXZsM1hWdWZmdjJV?=
 =?utf-8?B?Sm5ydEpsUGJ0L0ZNOElGQUJYTDdRTnRMOWpvMlZPYmNyTTBCMHpKYkJEYzNH?=
 =?utf-8?B?UmRkeWw1NUhkT2tVSkhUMFRJSU1FYkZNL3hJek44N2F0SHBWa29tN0NxZUNj?=
 =?utf-8?B?VXd1V3MvL2Nlb1l2T09FVFpSOHhoU0FQWktPRUY3bmwrRVV4RzZDb05NZE12?=
 =?utf-8?B?SldzNTZ3NGhEd0lLeFE2cWROVk5mdlRvM3I1cnNkWERaVEtwY2NRZCsweDR5?=
 =?utf-8?B?VkY0T05UMFp2TkFvRlovS2Rqd21lM2lpYVNtSURlSkRYUEJySGRwNkc5c2VX?=
 =?utf-8?B?eVVOQ2tmTlBSTjlhUERkRWpjclpiUlFnZ1p6T0JKUFJMMENVUGZtaVBlZUR5?=
 =?utf-8?B?bTFvQ1VCNzdiRG9DaGtSRWh6SzE0ckhoT3E5OU84OHAybnBLa3FjQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bca5b9e0-c4ee-40ed-f7b2-08de8eae4d50
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 22:47:20.7738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kOEHA5L7OOCiFGijKu2PHDJQQ3STY6RkRnePt72CxvTKuT1KpTSsDjdgATSYJWQdmaKtrIryDzg0hmzzHeGnOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7544

On 3/29/26 10:10 PM, Alexandre Courbot wrote:
>>   gpu: nova-core: move firmware image parsing code to firmware.rs
>>   gpu: nova-core: factor out an elf_str() function
> 
> These two commits pushed to drm-rust-next, thanks!
> 
> The rest will need to wait until `drm-rust-next` reopens as -rc6 has
> just been tagged.

Sounds good!

thanks,
-- 
John Hubbard

