Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013059.outbound.protection.outlook.com [40.93.201.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1EF23BD02
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 23:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769209280; cv=fail; b=RjLGIxfzv6RqJQyFQ8yXpXxIezJDVMIqoNnaGDt9bvqqMj8zo4iRXxtQ80A6SOLdvX4FQbX64wI+8nawLpEDHUZdlZCVrIgJ6kZGMLhrxeOiiz/Ia5agk2hEH3Swj+Md6oxW1vKP+b5qZxE0xjWkxhUoQ8mVKRDvCu0U7/iSn/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769209280; c=relaxed/simple;
	bh=xZ6ErwrOo+JcFRP5mjC+HGFFmAGZXDGuWoJJhC0hiHI=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=MlvBcgpCfnb0c3k8SMKoL/gmbbNBBG3uKqRGrdOxez0RAYdwt/PO9wyY6JPxV9DfXPvR6/KAh2QYC9krIzLu1Uv0GJBJkhlK7ub1Tsvk/WqryFuUuCoMlnFS4C7Pc9v3gxFhVWfB2LSH8Bzs8WpF8qpR2labtx8Nt3KRBFlUjzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=a2U1FQlD; arc=fail smtp.client-ip=40.93.201.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="a2U1FQlD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FqaSllwIysXCxBf3bZ0OTVopM0NUgdEl/lsutsuiSPwkmYXXg3DsaYB6ktwZlSHqv2hP2H+6Pv6AdJnfw2oJGc7sYEfvZ+2Rgw2wA+/saJkhD5vlaG8CRQtz0O5WJ2KvTKQs03ApsBIfBtTET259/TMBnbGDnbnuFBVX3IxrDbOuIX7o6IbWpTNRsvUPLPhujSPBb2gDReXrhaTSlKY4jIGHWP4NAEz60witAr1D7Ekb7LRW8PDE70KNM+iU+D0/FIbRFrBtHfDNKARljGeP+TiooYC/25sCSJgMssupe582uklLIQXBp3nGhc0AhhfSDacFX9P3BfRHCLERFcM8QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RGE8m6eCrvuyTtjlhsjm2NZllUrCBw/5Q/yaJ+g4K78=;
 b=qyyVPnBjm+uJJaSHvcf87uVBRrBAlrDRBo7kZgJbud2Dh3dc0by/V5AvkyYYouh9OdtOMQdSvEXHDsnIfoEIlQJgHe6n2pDSmGIgCiOQu9y1wZoxoJ/XJaESGpWieWXkF1cw4BDmaLN9u32uhsVWkbIMgPWKAR69z04R7MLJggsrtoGdpTjdsddwrpFbQWkDJqX+anTdieWr0+9A9L3VInFI4WwsmAFJ8V4ANDFXOOgjlEtElAM7ztGzumjLkswd9ikWUSBV+4SK4yROI4ez/x7WZCNuLqDViQNwpyediaOMyr4Cfn/lwabU8LP0BjFoxbFhn5jeIJS5FCVcEMs9eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RGE8m6eCrvuyTtjlhsjm2NZllUrCBw/5Q/yaJ+g4K78=;
 b=a2U1FQlDLT1a/fAKsZRRpSa+BQ/Od/CbQkUpNuvLw3IXLhYoOg23QNgiTcOL8Tw6ivvGQpIoQYZokK2IIQjZ8vGcGWG6L1AuRB7bWDj9kX6SF7k1SHXkU1mofNmJivX3PmDoBsQMN06ij2nyJXNfVLENXO9jBNn6h0zOa/dpzI8X38A8CuQeeDao+cwk8/Rmdig8BXgBz6gObWzYLJsQ349pOJmPrQQVlINHyXBUsosa5j1JVMuXqyeUC6hc9//e63hjs9aZIf2n+Zzb+vOQmpgaOFx0IE9zurDWSSX3+NyAIHkGOKPxXiXC3ZJIroMxlqUUDbOgGmstPwEDuqutrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ5PPFEB07C8E34.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9a8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 23:01:15 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 23:01:15 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 24 Jan 2026 08:01:12 +0900
Message-Id: <DFWCCFH7XXAS.2H84Y5B5E1M3D@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v8 00/13] gpu: nova-core: add Turing support
References: <20260122222848.2555890-1-ttabi@nvidia.com>
 <DFW6PEK1UDTS.3GHOOT5I32WSR@garyguo.net>
In-Reply-To: <DFW6PEK1UDTS.3GHOOT5I32WSR@garyguo.net>
X-ClientProxiedBy: TYCP286CA0182.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ5PPFEB07C8E34:EE_
X-MS-Office365-Filtering-Correlation-Id: 68260092-8b0f-4e4e-cb35-08de5ad34fb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?LzM4TkZleFZpSG0vbllkS3UxTEtyZmg3ZThqWTMrazJ2aG95WDdmbjhwMGg5?=
 =?utf-8?B?Q3QyZmgxV1o3K0pDa2NrTGlES0E5ZDkrVjArY3QyVHVnd28rencyYVZWRlhk?=
 =?utf-8?B?MDVTWlBkVFI0OFJNcDE3NjA5eEtyWUNmVGllZlpFSVF1VGpsRHJRUmFpRVEr?=
 =?utf-8?B?YTNpTEZOaytzWldMQ0pyUkFoMFkvOUpPejdhTWJOUVBUN1poNkx1dk1TUkly?=
 =?utf-8?B?Y0tVWGNUY1ZyaVBUTXg0QW8zS2lUYnNDSHl2bUZFUHZxOEdnUWFmOHRlYkU5?=
 =?utf-8?B?U0hvNzVtcXMrMUZPNW1qL1ArdTZkOGFkbm1aNGo3OTNHUEEwWTZvL21QZlpJ?=
 =?utf-8?B?bmRnWUV0RHY1TnBVZTJOWFBadWlrSUVHSVVMRytENEdJbTdldVZxVTUxKzgw?=
 =?utf-8?B?WU5hZ0l6WmxZWE9xdTg5cFJ3dmk3MkZ5Skg0NU1MZ0RPTlh6d20wR0Z1WHl3?=
 =?utf-8?B?dmlnS3hCYzJPWXJzOC9xQUhkRGFraXUzSWV4cXJSTkVpKzFMWUpscHFmcVly?=
 =?utf-8?B?SGNaN0xxUmV3U0d3aUtxajhRemRYbC9KUTMxNHhvemJUL3FGN0ZIb1RnSGFz?=
 =?utf-8?B?aEJhNkFZSitycTVKdDdnNW5uY29OaTJxOU9saDcxcXdFb3JPNHR5U0pVeFVW?=
 =?utf-8?B?Sll6MCt1ZllrM1UzZjNnRE5IZ3hEMk14R0gvamN6eXFzVk9JQjNsRnorLzlm?=
 =?utf-8?B?SUIwY29xOWNCdlBYQlBBQStYTUJlY0FWdVhLa3g5SUI1UVBHYmJKM21waWZT?=
 =?utf-8?B?L2k0ZGJQbWRQY1Y2OXVXRzBuNmJ5NkJHYzZwVlhNRk9FbzdsTGRlSTYvc0li?=
 =?utf-8?B?QmV4TVZ4M2NBSkhXTUVsekFlZjlOaGFWQUp5ZUpIWG00V3VxenIxNWR3STIr?=
 =?utf-8?B?b1UzKzBURmEwZ3pENU5QZHBpREZRRTVFT2dqek96Q3ZSUDZWTWVJdkcxdWVD?=
 =?utf-8?B?Qm1nL1hQTUc0Ni9FYmV1QTlFU0FWYWxwQmtOKzllV3pMMU9GVW1LYXl4Tm15?=
 =?utf-8?B?VTMwdHFJU2crakF0WGNEeDNrbmIvMTlybjVOSDNBZVhQdjVUcmd5N2dmRXR1?=
 =?utf-8?B?Y0xBOUUyVEpxNDV6NzcyRVpNSFBEUU1NbFcxZWZURDlOWU82NXpDRTlkbG45?=
 =?utf-8?B?Si8rR0JSSTVTNlBUNUJKbmlXdjUrTFpPRDF5amx2MVpvL2ovZzVSa1ZYc3Vi?=
 =?utf-8?B?dzJTRVNhVUxESDJxcmovRFdmR3doTHhiUDBBbkVzaUZQSkNRM3hnTjJyd0Qy?=
 =?utf-8?B?ZXlrYjR4cmVrTk84Nis4aThZejU3c1h2KzUvbHdGKzlWS2ZMNHozbWltVmZn?=
 =?utf-8?B?TlpaYXBlbWZCblFFYUsvV0c3a1BSV05iKzRlRFNiK2FYKzFvdkFYYk9MdUJG?=
 =?utf-8?B?cjJHN2kxVmdrd0c4N2ZtTmFmTFdhNXRHR0c2UTgwTzhpT2Nlbnl5T2M3MWNk?=
 =?utf-8?B?YWxSVXVVR2FmZ2dyT20xaS93RGkvcXVVQzZqQ2VJSytoQVI4akkyb01wT3Nz?=
 =?utf-8?B?VHVLOTl6MEQxQVg1dDJ5VmhjeW9lcmd5ZEIxRlFKN29LdVhKTGNKcjZPWUk0?=
 =?utf-8?B?YlRVWmZVVktmSTlmaW1sMUlURDhlME1PUlA3cktWaWlhUWZMcUhKN0VZcGQv?=
 =?utf-8?B?bzg5YzlwcjMwVUplTzgzenpwSDlNUTlMYTd6Y0NFSlViTk0zVktaZW05bmx6?=
 =?utf-8?B?ck0rVGxDQ3MzcERYRHptNDRVeTZoeUFqRmdpRmNyUENFdGhzV2VlTzFxN21I?=
 =?utf-8?B?Vzc2WjlRUisvUTRKU0MxZkF1MmZQNzhzUlRLNWI2MGNRbngzcFRROWNUSjFh?=
 =?utf-8?B?SC9wVkt0SGU1MHd1YkUzNXU4UnRINHFHb1FhL2F4ZVdRWHNLZHdJTkJvV0NF?=
 =?utf-8?B?cWU2eVVlaVlIZi9RY2h2amFaS0tRNGhHSHM0bU9HYzY5NUtSc2UvUWJpdDIy?=
 =?utf-8?B?Y2VXSHY0SmxJTG9SYWVqdjFXSzlITFFyck9KejFTK3JxVlV3YWUrNEo3Y09u?=
 =?utf-8?B?aFRNT3NtZm5HZGRkQ0Z4cWNnM0NoZmhVVDdGaHk0ZWQzQTBvZzlFRmpwRlFi?=
 =?utf-8?B?aWgwbVZ5Skx3NDNScDN4aWttQk9YeERYSWhRZmZXZGRHYjhVQUxUR3Fwc01D?=
 =?utf-8?Q?vAqU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N002OS9meS9Yai9saENkMUpVWW4yYWc5cHh6T0R0RlVKZlBzT2VPbGoxOHpt?=
 =?utf-8?B?UzU3NkNjbzBUSzdoUU96UUJ1K1FYNzZDR20xWnNkUTRIdU9JNUE4dmRGck53?=
 =?utf-8?B?M3ZpbS9MY1JjTkdSem9lN01lZ0lGR09xSzNEVEtEaTMyMlpQenE1NTAwblc1?=
 =?utf-8?B?aGtJYTZ5UUJHc1E2L1RPR0c1am50ZjhUT2ZOU0srRFZ6QjFQQ05ZaUlpbVZE?=
 =?utf-8?B?dGJrdFBHTW03Yk8vTGkyclpyU2tjK0MrR2FUV2tnU2V1VlF5ZlJDZmltRVFw?=
 =?utf-8?B?Um8rcGJ3eGlUbW1wVlMzR202SFhkekYxdlVlMTFmdGhCRlF5WGNmT1V3OGox?=
 =?utf-8?B?QWRFL1lBRGg0VUZTblJjWExUbit3MVJEUHkxNlpocmgzSW5RU3ExaVRrcnBm?=
 =?utf-8?B?L3pQekJDRHgyQWx3V0QzdTdZWnhPMEFscVpWd3I1UFo4amt2VkdCODdsR0V4?=
 =?utf-8?B?VDBHL0o4NTAwR1A5VG9aWTFHOVBLVmM2aGd0M0N0d2hHMWhFR0FaTTgybFIx?=
 =?utf-8?B?Ulpudm83azJqa1BGQ2hvSDRVbWhZeGF2Ukd5NkRjVWp1WEM4VU84c3NMWE9H?=
 =?utf-8?B?N3IzV29OcjNoQm1tMlczeEJXN2N6OFREa3RyVUMwd0E2eGozekhZZ0U3Qm1u?=
 =?utf-8?B?OGFBMmxyTC9WN0JiZU44Z0FaN1BzcE1BYzcycVlJTTFFY3BCYVpnQ09vSFF0?=
 =?utf-8?B?VU9tMDJNeHFUM1ZkMm9OWU1TbmxJcy9CY1k4ZnFMcE1palJBOEMySXhlcHVq?=
 =?utf-8?B?SUZZQWZ3cVdpRkltN3V3S1N2RHlTOWpaaHlHU0JXcnB0ODJnUDNUbStUS0Ix?=
 =?utf-8?B?UHdwMHBVbHZmbE9Iak9xcEk1Zmp6U2hKRDJFTXlTdldvZHJMVTQ3MzF4OGRj?=
 =?utf-8?B?NEhxRFpISXNnS2xQMXVXZkEyU1MyNkRaNjd4bE1yamluZjRUNk5WNWc3RXpl?=
 =?utf-8?B?WkU5NThGUURZaVRWb3R0SGhIVVhxdTU0Mmd4WW5SVEZZK3JSc1VsVG9yc3Jj?=
 =?utf-8?B?VXJKUFZKSFlWWGZ5MG5mQURXdXBKYWM1dXI1b1c3RFVrTU5oTVZ0aDlDQzFN?=
 =?utf-8?B?NWViVjVSTUlEMGVwNXBKZmNTbHhUT2J2T294ci9PcmNTcDR5bWJDOWZOVGhu?=
 =?utf-8?B?dGdTUGZKUklYeGVZblJ5N2Fka0NmVW5HdXhMQ2pRUjJ4TUNPK3BtNFpLRjdY?=
 =?utf-8?B?d05pY0RqZnd6b2FjOWtVVGdzQkp6bjBZek9EU3RwOXNPZlpRY3hYY0hSaVpK?=
 =?utf-8?B?enNaREwzRGtLR0c3VXpEUWpacnlTNXBZYnhDTWowRzh3N2lrUTA1U0J3eWY2?=
 =?utf-8?B?dTRqck1CRlJFWWdMOUFzZ1RvQ2xqUnU5T2tJMXdITVFnYlV0NzJXSU43SDlN?=
 =?utf-8?B?ZGpXbDFLc2E3UFJuNlpGWE9SUlJ5d0ZDVXB2Y0hWMStSZ0tRS2RKWjBjL0tY?=
 =?utf-8?B?OWVxOURwZDBTN1dqc2xFOXZ2VzFDWWEzTkEyQ2tCMWxORXRLMitCQTJrNVVG?=
 =?utf-8?B?eUovUVd6K3JLWCtPa3p2T2VLU0tVOVJJQmwwSkpTSnFnS1lMU0ZuQkRFcUJr?=
 =?utf-8?B?a2Q4QlM4RUZxUm0xUm9UL1lpdWhKSm1BZDR6akMzbnBXbk5ETy9qNWF4ZUtx?=
 =?utf-8?B?a215eEN1aUN1eG5neEVTenJsV3J6QWVDeFRIWHFBNVV4NmxDR082SnZwUVRQ?=
 =?utf-8?B?T3o0QjRMMEVGTngwR3I0VVN1NEpxaGdtTGdkcHQxZm1VMzVJUG5lMDNLZHRZ?=
 =?utf-8?B?Z3dySk0wQ0U0ZXorN0VyRTIzaW9IYVluZytYZS9lTkJoZFF4YStlanovTGxh?=
 =?utf-8?B?S0tuOGFzQjBZL01GR09RY3BMYnFtWFNmR3FIcjcwTzJzQ3pyeEMxeG1oZCtY?=
 =?utf-8?B?eCtBaGE1bHdpazVBUmFKTW43V0dSODJkUVFkdkFQL3ZMSEFlNUdwWGdOcFps?=
 =?utf-8?B?NVBQSS9ldzVySGZ6Vi90amp5QkxyaUlDQXJBRHF4ZEx6RlQrV0hiRWlYanpo?=
 =?utf-8?B?cnUvU1JZVmNCSFBISytlcFpjaVIyS3QxWStlaitBZk5sMU9YU0NLL3lPZkJs?=
 =?utf-8?B?R1V5QmJabk1oUlBZRmh3bXEveWdxSm5BZ2tEbFhNSWxsMnk5T3BiYjl4Rkd5?=
 =?utf-8?B?YUQ2RFhja2JxSC9kaTg4dlZ0dGZNUVQ0UDlvMmcwTjIyaTRFRnVQOG5wQ0kw?=
 =?utf-8?B?TjgzMVRrM2xxVUlFU2dDNzBlWVVWdldUc0EwL2s2OUFPNXo2VXZ5UWlJL1dp?=
 =?utf-8?B?NUxlQUhMY083aXR3K1B4V0w3M0ZmY00yVHk1aGtVYWdkRUVNYnJvcE1RM0Zs?=
 =?utf-8?B?bVVFL3p4RSt6N1hhS0NTZjBvM0k2VDNIZ1NSN0dYS0dkc3pLd2pQZW9rZ3pp?=
 =?utf-8?Q?tgh4Y52o8i05Qlrnb0L7oOYy4z4qJjatx36+CycjbQF9D?=
X-MS-Exchange-AntiSpam-MessageData-1: XaW0QNBiYUiGaA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68260092-8b0f-4e4e-cb35-08de5ad34fb1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 23:01:15.7260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w7AKVf0Fvoo+hOb6kBHiVXeMTJN71E3Wxu2v3pEWkVYycDdtniNsyno6+4iSG5nmzeCrZudiELUlcsTkPpxG+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFEB07C8E34

On Sat Jan 24, 2026 at 3:36 AM JST, Gary Guo wrote:
> On Thu Jan 22, 2026 at 10:28 PM GMT, Timur Tabi wrote:
>> Note: This patchset requires "[PATCH v3 2/7] rust: io: always inline
>> functions using build_assert with arguments" in order to compile
>> with CLIPPY.
>>
>> This patch set adds basic support for pre-booting GSP-RM
>> on Turing.
>>
>> There is also partial support for GA100, but it's currently not
>> fully implemented.  GA100 is considered experimental in Nouveau,
>> and so it hasn't been tested with NovaCore either.
>>
>> The latest linux-firmware.git is required because it contains the
>> Generic Bootloader image that has not yet been propogated to
>> distros.
>>
>> Summary of changes:
>>
>> 1. Introduce non-secure IMEM support.  For GA102 and later, only secure =
IMEM
>> is used.
>> 2. Because of non-secure IMEM, Turing booter firmware images need some o=
f
>> the headers parsed differently for stuff like the load target address.
>> 3. Add support the tu10x firmware signature section in the ELF image.
>> 4. Add several new registers used only on Turing.
>> 5. Some functions that were considered generic Falcon operations are
>> actually different on Turing vs GA102+, so they are moved to the HAL.
>> 6. The FRTS FWSEC firmware in VBIOS uses a different version of the
>> descriptor header.
>> 7. On Turing/GA100 LIBOS args struct needs to have its 'size' field
>> aligned to 4KB.  So pad the struct to make it 4K.
>> 8. Turing Falcons do not support DMA, so PIO is used to copy images
>> into IMEM/DMEM.
>> 9. Load the Generic Bootloader from disk and use it to boot FWSEC on
>> Turing and GA100.
>>
>> Changes from v7:
>> 1. Fix unused warnings in some commits that introduce an identifier
>> but don't actually use it until a later commit.
>> 2. Split out the Generic Bootloader code from the PIO code into a
>> separate patch.
>> 3. Removed accidentally included vbios.rs.orig
>
> I've checked the Rust language aspect of the series and on the internal A=
PI
> design and it looks good. I haven't checked that the actually hardware
> operations are functioning as intended, though.
>
> Danilo/Alex, feel free to convert this to an Reviewed-by or Acked-by, whi=
chever
> you see fit.

Gratefully adding your Reviewed-by! :) Thanks for the review.
