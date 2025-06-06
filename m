Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C7F1A9B3D
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Jun 2025 22:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749247905; cv=fail; b=l1NkqJzBQ2GowImr1nKekIUKkQ6+HvGk5NgPfmuj3VuWAN7CboBpXynR8iAkoz2I20IWPmaixlv0o6hN6VcIKT4GbD73cbcUSbQFB0WJ/egMF1EfQt9pd7lU2SWEQqNaDXrkPKzqVv5w0oVsCdgcCOpp4pD5rbgLixd4aE6Io2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749247905; c=relaxed/simple;
	bh=pb5frz1zuc84sOEKo1iki/OrRjkq0iKohdEbT+THVB8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=g17vHQXO5aCLQWFaSpJki1Hq4oe6BFtKv+QCzGn31uINb9CadhB/Pmt3W9BxulxVvcfwNxqImBSwQpBxj9ay36mSxGjXcrIJGJjzXqWco0KIPtflAMH86jsteb+QCBqOqF42OjGp+iKlovgOuXX1Z4OM+ih+YiGSWPliF0ou02g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hmOFJzkn; arc=fail smtp.client-ip=40.107.93.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hmOFJzkn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FABTP4fcvi78ZLC6zM4QXcPMzz3x0OniMpJRwdXyukW7UK2aMVhT4+mpluVpmwmRG7mv+rP1w7o5Z9xxdN1OlPKBXYzfWqscpmRwV6rx7UDE2khoXVg5k9AYnErL0RJKj6sPvJs7uM+4KWd0oqiDDrKlcG9AtiYQ14SdvbV1GAHzRIxRSCXbJk/ur1BnW13ildv92/2AiB6X6VbLbtaRGmHSwe3KunCnsI4pVmKy9X4YBX4ZyT0XYu7m+y9N/nd2RAiLKdZrHc5YFt88boxnf6Tv0+Z7zMkNWnRzhWcazEGSvlMfwv1hJZ/Mv9UiY3hc6eQoPe8BWcaTc+aelfpsfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pb5frz1zuc84sOEKo1iki/OrRjkq0iKohdEbT+THVB8=;
 b=r4xf3+TaMq5gq+5fNF9jtpZi0E3/lq2RwUpyJfEemNn254ZE7l4AFN28rU1UQ1cdGZF/exAGEbPDtcvzMlL/LOXkVSt43NQMnVoBv4jq37uQFissZeCEC34FEAbyzZ9CjRANqJodJI4sKkHO0M6AXmBeJI8b0XxGyrd6SZ1bPqhLbSZP6sQ9lkQ4fulsSlrQfA0PJbbtCy9pO3uEG7zUvh0kANnbvv98vXYvYMRsFgDQ9X+EzCQkOOrV46kUaqdIw4nRbZchZHkEE4OUibavoX7NJ1Vf3uKcKXU6wcQW7uQMajoni/T5MzgmsoVDOWr8FYwxeZ1uz/1TE1FTiPJEeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pb5frz1zuc84sOEKo1iki/OrRjkq0iKohdEbT+THVB8=;
 b=hmOFJzknK1bqdT3FIHjUPJSXAzNjsdRde/l2dkSCHkFxZ2h1holmbBXTQJjmfYZXek52WXcxmxyiDIWCYaoe2+JhemYDCm6TLde0esHQPCq03nh96iwGyKa1M8jHv+YWW3JasXUKabWgss65AP/E/uUjQ5t6D6vxGBOWXjgxb/7hj8fNm0oDlUsYhLZ1qce8S3jKmEFOQCw4Z+bcsuJJvE8VQrAcnLMwLYaV5JLXOdx0x939wKtIwGjIZu588z7EVzsv/kXT9bPyNVT1GAsozD5ETDkMeeIjLFBakypiiZgaaIN9dXwh0NvWZi3DP32hCbrdhQqjQ7cdFxukazP25A==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by MN0PR12MB5739.namprd12.prod.outlook.com (2603:10b6:208:372::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Fri, 6 Jun
 2025 22:11:39 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8792.034; Fri, 6 Jun 2025
 22:11:39 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "miguel.ojeda.sandonis@gmail.com" <miguel.ojeda.sandonis@gmail.com>
CC: "ojeda@kernel.org" <ojeda@kernel.org>, "aliceryhl@google.com"
	<aliceryhl@google.com>, "lossin@kernel.org" <lossin@kernel.org>,
	"dakr@kernel.org" <dakr@kernel.org>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] [v2] rust: introduce sfile macro for succinct code
 tracing
Thread-Topic: [PATCH] [v2] rust: introduce sfile macro for succinct code
 tracing
Thread-Index: AQHb1MFmutpP/mRyhkm0X/8IcLhMibPyCzgAgASrNwA=
Date: Fri, 6 Jun 2025 22:11:39 +0000
Message-ID: <ecc4bb6c582bb99c17b4795d80d2556e98e590f9.camel@nvidia.com>
References: <20250603195426.2360773-1-ttabi@nvidia.com>
	 <CANiq72nGZusApAFztsZOoLhRWJYEMmRY6XfAC89e4-dW6snC8Q@mail.gmail.com>
In-Reply-To:
 <CANiq72nGZusApAFztsZOoLhRWJYEMmRY6XfAC89e4-dW6snC8Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|MN0PR12MB5739:EE_
x-ms-office365-filtering-correlation-id: fe907c91-dda6-4410-57c0-08dda5471c5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?N3NNMXlxbWRWM1d2VnFJdnBqMjM2dFEwek1kQjZiOEkvbDltRlRxMXdLeWJU?=
 =?utf-8?B?dzFWVFJyb2JTanBURWpJMkFXQVdKTGdHNE9JaDVNbi9XZFE4OUc3ZjlWMUxY?=
 =?utf-8?B?U1BNdDFyNjdjZmlBQ0tFamhyVXFOOTNmUW1Rc1AzSDdoQUZ3ajl5OEJuN3hO?=
 =?utf-8?B?Uy9pWnJwS1dJUmk1Rm5aL0ZqSStBcy9nbTBHaXlwTVU0ejRiMVpQakpWbmZN?=
 =?utf-8?B?V2xLRFlsaDZxWWVsVFNYN1NFYytCSVduM0pjdHJhbTY0ajJmTVRidXBDU0Ji?=
 =?utf-8?B?QVY4K1FsdEhUNmVQaEJJU25CSmNhS2lwZnhDeDh5SzIxTi8rUUxiOHZKRndr?=
 =?utf-8?B?Z2tIcjI3eVRyM0d0ZXlRN2IxdGFPd2hYWFJUamJnZEJxaHBLekt1c3Zya3VR?=
 =?utf-8?B?MUluOTc5YTQzSWsvSlZlaXVNK1crZWNKVjBEV2NYcXl1azFsaEJzdzY4YjFF?=
 =?utf-8?B?SE9HaEFoNjNFY2l0cFVOYjZmMVlYQkloK1pmeTA0d1dwLzdEbmRnMTBUM2Ro?=
 =?utf-8?B?c0lxRDBpMzhwS2QxbEpSSmt3TGFHd0RaNk9kbWt5UXpSWTFCTVFFRHlMV0xx?=
 =?utf-8?B?NG9OUnh1YWx1OEl0OCsvMHBUSHJtVS82MFZWWWczaklkakRNQmhJUDV1T1BT?=
 =?utf-8?B?dEF4VUd3R1I0VWRHZ3JKSTU4UTFraGREb0E1VVJWeTVrYjJGV2tFMXRrQWFN?=
 =?utf-8?B?ZjkwYUZLdFp1bFNxbjdVMTQrdDU5ODh3R2hleEY3ckNsU3FoZktWbHpCRU1T?=
 =?utf-8?B?S3F1T1cxaUpiZDN5QUYyaDhJKzJEcXNsNXhBa05neUJwcVpGTmMvNGVCOFFl?=
 =?utf-8?B?d2VXemtFaDZUN0hGR0t6ZlJiSUphcUxLZVhwTEg0Nm04YitXMDVQSFlIM3ZY?=
 =?utf-8?B?WnRwaGtoVFptK0lORjZONnNJTEowdjIxZmN0T1drWjhCY3FCNEdQOGcxTUhU?=
 =?utf-8?B?eU56aWJDSHlCTVlJR0hGa29rcnhXRmlkNmtlMlNvVjhvQ2cvMnRpRG50NUt5?=
 =?utf-8?B?NFN3UnRZRVVkcUxPT1I2SDhJVTlTcCtCTEw0ZDNFbEorbGE1RzZpSGp4QXNx?=
 =?utf-8?B?aVZFYkhWb0dHNllKYnVOWVlJY2RORHhiWE5RbWM0K3FSdW14MHV4UWxSemI4?=
 =?utf-8?B?STZBWCtDUHZURys3U0RJblpva3ZiTVhqN003VHk4amxSb1I0UVhDQkNhZlVM?=
 =?utf-8?B?L3Q3UkYzVWdMcENuRno1MnFSOWxQUFVXK3Q3ZjZjak9xU3M4Vm40V1lxamRO?=
 =?utf-8?B?RHAxSFdEL2MzYzJtVGJHM2g0K1Zoa0ZsdlBNUHpVcWJEdmNubzg2QWtOSkFH?=
 =?utf-8?B?WWpWZUZ1SUVhdzlDZEhuZDB6b3k5aUUzdVN5RGMvSFBNeUJxWnV0SnhVdVlk?=
 =?utf-8?B?cVE3dzZ6dEY5Q2NTRnZHZ0xUbVFNTkt3RXNSemJZRFk1QmsxSWpKWVJsUkEw?=
 =?utf-8?B?M05RZTF2R21Edm1jVGx6WWcxNjZYZkR3OTQ3cHo0ZUhNQmx1d2h1R2tRdnpQ?=
 =?utf-8?B?Mm40RjQrSURVWlhWcEo1eTR6OTRUMCt0WldZQjFFdzhNN1RGTVBjUmQ0ZkxY?=
 =?utf-8?B?Z0NBRDBNbkc1bFNkYUFEdlZnQ244QzhuQTl2SGlWU0E4KzRmQkZHdzBrS3dG?=
 =?utf-8?B?TlZVUVBJalZNRXJnUk9GL29RdWtPVWhsb2JvK3Y4bnpET3B2Sk9NdmNzZ3da?=
 =?utf-8?B?dHh0Vk81Q3ZXN1JjU1ZGK2tibkZFckpHSWc0S0U1V2hmZ3FuQ0pSQ1ZXNk9k?=
 =?utf-8?B?Y3BXR0ZUUXg1KzN6RFpPRnArK0tRQ2xCN3BxVHJkS3RMbk9PUkhVNTNuZEZD?=
 =?utf-8?B?cHdrS3hWY240eXplMUpjcGE3eHphNHp5bEFnZGRRS1RQdCtTQTZpNU5lK0pM?=
 =?utf-8?B?aFRTWCtxOXpRdFJUeXlLYm93c1VEUFBOTmQ2WUw4TittNHlab0JGS0x0MTln?=
 =?utf-8?B?WWl3MVhxY0VNZlJjRHBFYi85UGFuNG5CVjBHbHVzeVczcnZheWlTUEV2TU84?=
 =?utf-8?Q?mcd4utdOGqSI3uRxTEv0+6U6Pu86s0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6526.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SHZ4MGVpQXVna3R2WXF5ZjZCQ1phc0hHa01sL3FWR21ZWUM5M0s3VTk5WS9x?=
 =?utf-8?B?eEcwV0ppTVVJOE1sVlFSR1lyODBnZTZhdHVkcEtNbndqK05TWW5QZlFuVkZ3?=
 =?utf-8?B?aE5teW9DKzVBeEM4NkkvcGtRdnV4cDdLWGsySmxQdzJldWg4KzVNaHJobWpY?=
 =?utf-8?B?cC9lcDgrSjd6NGxuV0IvSVQ3c0h6WHd5R0RLU1lmbHRvazFFZkFNVjNuekxr?=
 =?utf-8?B?dm83NUY3cmlrVm9aSEh5UU1NU2JLVXFkamJjaXk5L09CblI1eFREQ1g4b3pT?=
 =?utf-8?B?MllFcDJrb1pCU3h3UFlMZ0p3SE1FK2V5ZUlIVThPaHczQnFkcFFyeW84U1VF?=
 =?utf-8?B?aXlWa2Z1NVdZeFBsR25ubFN2RHVvd1BNTVZtOFh3SE5pbStwMkNuby9va0Fu?=
 =?utf-8?B?dzNpYkkzU0FtdWJuTmdHSk9RNzR1VmlZRklEdE5zamhGbXg3alZOVXB6b2NE?=
 =?utf-8?B?QXZwODdWY0JmN2h2TEtxaC8vWUNzN3FhRlk5cjZkWG0vU3BuRTE0U2IxRlZR?=
 =?utf-8?B?ekR4Ynk2dk9BWGVHNUJmc3N0WWduS0gwcitIcWVnZHBOSS9aRk13bEFNL0xS?=
 =?utf-8?B?bkcwZFJ0RkV5Tzh4OXVHWnVPdXhJenByTkFPOUI5aTljM0NPa1RPdWhLVnc3?=
 =?utf-8?B?Tk0wREFNVHdYQTFTWjFYcnpZOE82Snhqbm5Tek4yUDJ5a05LSUVDWTdneFlO?=
 =?utf-8?B?aDhRUHJWNXZxSW11bU5wNVJINS9ITnd2TmlMK0pZRDkyQkVRa2o4SDN2RlRp?=
 =?utf-8?B?bFd4bXF4OEROY09uKzdWMlZxaDRjQkQ3ZjJlQWhXRnByUWhodmRPV0U5RHAw?=
 =?utf-8?B?eklqTmNFcVNSYTI4S0JuMWU0eVhPeVRlcFBGZmJhamgyQlhoNkk5TUtkOUJT?=
 =?utf-8?B?N09hTTd6V1BVZTNlWkVXSDY4WVZtMTZxVFhRUi9iV2kvQjF5VW5Na2g1TDRy?=
 =?utf-8?B?M0JFUllzak14MTVqQlQ5WmpsWWRrWnFYT1ordWVoUzkwRFVBeEJ0cVAxaEty?=
 =?utf-8?B?S2svQXlld1dkV1owMVdvSWZXbHd2aDV4K2ppUnRydHU0OER2V3ZtdFRBQXJY?=
 =?utf-8?B?UEN6bU82RVdLK0E3U3MrbG9KRW1DbHZOQmJURUNwL2pwWHJCSmVhdHc1S2xx?=
 =?utf-8?B?SGlLbStIcUpRbis0NzZ2SDMrMG4xNmt4Tlp3d0tEZVZRTE5aczUxMkR2aFlN?=
 =?utf-8?B?YVgvSFZaaXFPRjU0YWtjbnlneis5bjNySnoxa3VJb0J6OCtjQUlDUVJoNE95?=
 =?utf-8?B?OTZtRVJhTFFsOERlUGNRUjFVUmd4eTAvU3BLb3M4OG9va0piUU9wQXNFeGdK?=
 =?utf-8?B?MXlTLzlibnFYUjBWeFEzY1BWRjNGaEY1aXpQUWxzQ1lmNlJocVNNR3VXdUNG?=
 =?utf-8?B?OXVqeHpFVzVBVmVSNjduRjdaM0lQaWFSNDZPMm8wZ2NYaEJ5eUFPeDBmNjlD?=
 =?utf-8?B?WDJPVmIwczRWcm9hOHFZcVVWaVlzbjhtaHMzREs4WXZJUXpQcW1CN0N6b2My?=
 =?utf-8?B?SzB0cDJ2RUpSSmR5N2s5NkNPNkdkK3NqdnZJcmhaQ3NoTTlYNStnNU13WTho?=
 =?utf-8?B?Z0dHcFVyazMvV3NQV3pLSE91Tk03bTllRVg2bnA4ZFhpWUdRLzdia1FXVzNG?=
 =?utf-8?B?ZTVzaXpXMThBendQcCswVlZEV2NmcFhPQUNHek9VU1hkZFZ3cGg0Z1VJY09G?=
 =?utf-8?B?b25xSVlpd2lvb3NWUXo2ZnNPQ3BkQlNvTXdNTEV1QlhMczNYQXU2UStlUFFq?=
 =?utf-8?B?RlcxQmdMU2FlV2tSWGlRK1pnbEdtNFh6SUZ1RTBuQmt3aklHOHBjWnUyT2lz?=
 =?utf-8?B?RnFDWjhpaWYrYXZmMERGdHBxOG9KT2NqU2pOTW8vQU9KSEJLMTIzRHVSR1la?=
 =?utf-8?B?QTYvaWNvNHlSaUV3cVNDVHBqeTdRamJ5cW11b0ZsRXhNbFk1U2pHZjNSREZh?=
 =?utf-8?B?NHdPeXBibjl6YjMyckJTeUprL285SkdBZUZUR0tkWU4vaHB3YlFSYlpaNW5H?=
 =?utf-8?B?ZFJ6S1RSSTh6MkJZaFZscjhUaFViSGNOanloNit0S1NnVmVFYU1tcHJDUU13?=
 =?utf-8?B?aUNIaS9oWFNXeXByRGFxcnN1dXZSNTRqaHQxbXpLZWJaSXIyZ0hQRCtKZFNB?=
 =?utf-8?Q?Mo9l5Q+QiYWtPPVenqVia4fHM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E864B3B41FF6F54DBF6CF13B25623408@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe907c91-dda6-4410-57c0-08dda5471c5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2025 22:11:39.3371
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B2jgo8Guyq+gebwYn6/yMNqTA+2+ep0/daV6SEhhcIMTYAoSd6BukrV0WfhsCzV+02earD2lXQ24TKWbllQwWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5739

T24gV2VkLCAyMDI1LTA2LTA0IGF0IDAwOjUzICswMjAwLCBNaWd1ZWwgT2plZGEgd3JvdGU6DQo+
IE9uIFR1ZSwgSnVuIDMsIDIwMjUgYXQgOTo1NeKAr1BNIFRpbXVyIFRhYmkgPHR0YWJpQG52aWRp
YS5jb20+IHdyb3RlOg0KPiA+IA0KPiA+ICsvLy8gYnVpbHQtaW4gZmlsZSEoKSBtYWNybywgd2hp
Y2ggcmV0dXJucyB0aGUgZnVsbCBwYXRoIG9mIHRoZSBjdXJyZW50IGZpbGUuDQo+IA0KPiBUaGlz
IGlzIG1pc3NpbmcgYSBjb2RlIHNwYW4gYW5kIGl0IGlzIHN0aWxsIHVzaW5nIGEgc2luZ2xlIHNl
bnRlbmNlDQo+IGZvciB0aGUgInNob3J0IHRpdGxlIi4NCj4gDQo+ID4gKy8vLyBgYGANCj4gPiAr
Ly8vIHByX2VyciEoInt9Ont9XG4iLCBzZmlsZSEoKSwgbGluZSEoKSk7DQo+ID4gKy8vLyBgYGAN
Cj4gDQo+IEV4YW1wbGVzIGFyZSBidWlsdCBhbmQgdGVzdGVkLCBzbyBwbGVhc2UgbWFrZSBzdXJl
IHRoZXkgd29yayAtLSB0aGlzDQo+IHdpbGwgbGlrZWx5IGZhaWwgdG8gYnVpbGQsIHNpbmNlIGBz
ZmlsZSFgIGlzIG5vdCBpbXBvcnRlZCBub3IgaW4gdGhlDQo+IHByZWx1ZGUuDQo+IA0KPiA+ICvC
oMKgwqDCoMKgwqDCoCBhc3NlcnQhKEZJTEUuaXNfYXNjaWkoKSk7IC8vIC5hc19ieXRlcygpIGRv
ZXMgbm90IHN1cHBvcnQgbm9uLWFzY2lpIGZpbGVuYW1lcw0KPiANCj4gV2UgZ2VuZXJhbGx5IGF2
b2lkIGNvbW1lbnRzIGFmdGVyIGEgc3RhdGVtZW50LCBpbnN0ZWFkIHdlIHR5cGljYWxseQ0KPiBw
dXQgdGhlbSBpbiB0aGUgcHJldmlvdXMgbGluZS4NCj4gDQo+IEFsc286IGNvZGUgc3BhbiBpcyBt
aXNzaW5nLCAiQVNDSUkiLCBhbmQgd2UgZW5kIHRoZW0gd2l0aCBwZXJpb2RzLg0KPiANCj4gPiAr
wqDCoMKgwqDCoMKgwqAgLy8gUmV0dXJuIHRoZSBpbmRleCBvZiB0aGUgbGFzdCBvY2N1cnJlbmNl
IG9mIGBuZWVkbGVgIGluIGBoYXlzdGFja2AsDQo+ID4gK8KgwqDCoMKgwqDCoMKgIC8vIG9yIHpl
cm8gaWYgbm90IGZvdW5kLsKgIFdlIGNhbid0IHVzZSByZmluZCgpIGJlY2F1c2UgaXQncyBub3Qg
Y29uc3QgKHlldCkuDQo+ID4gK8KgwqDCoMKgwqDCoMKgIC8vIEF2b2lkaW5nIHJmaW5kKCkgYWxs
b3dzIHRoaXMgbWFjcm8gdG8gYmUgZXZhbHVhdGVkIGF0IGNvbXBpbGUgdGltZS4NCj4gDQo+IFRo
ZSBmaXJzdCBzZW50ZW5jZSBzaG91bGQgYmUgYC8vL2AsIGFuZCB0aGUgcmVzdCBhIGNvbW1lbnQu
IEl0IGFsc28NCj4gbGFja3MgY29kZSBzcGFucy4NCg0KT2ssIEkgdGhpbmsgSSBnb3QgaXQgdGhp
cyB0aW1lLg0KDQo+ID4gK8KgwqDCoMKgwqDCoMKgIC8vIFdlIHVzZSB0aGVzZSB1bnNhZmUgZnVu
Y3Rpb25zIGJlY2F1c2UgYXBwYXJlbnRseSBpbmRleGluZyBpbnRvDQo+ID4gK8KgwqDCoMKgwqDC
oMKgIC8vIGEgc3RyaW5nIHVzaW5nIG5vcm1hbCBSdXN0IG1ldGhvZHMgaXMgbm90IGNvbXBsZXRl
bHkgY29uc3Qgb3BlcmF0aW9uLg0KPiANCj4gSG1tLi4uIEkgYW0gY29uZnVzZWQgYWJvdXQgd2hh
dCB0aGlzIGlzIHRyeWluZyB0byBzYXkuIGByZmluZGAgaXMgbm90DQo+IGNvbnN0LCBidXQgdGhh
dCBkb2VzIG5vdCBpbXBseSAiaW5kZXhpbmcgaW50byBhIHN0cmluZyIgaXMgbm90IGNvbnN0DQo+
ICh3aGF0ICJpbmRleGluZyBpbnRvIGEgc3RyaW5nIiBtZWFucyBoZXJlPykNCj4gDQo+IEFsc28s
IHdlIHNob3VsZCB0cnkgdG8gYXZvaWQgImFwcGFyZW50bHkiLiBBbmQgd2hhdCBkb2VzICJub3QN
Cj4gY29tcGxldGVseSBjb25zdCIgbWVhbiBoZXJlPw0KDQpTb3JyeSwgSSBkaWRuJ3QgcmVhbGx5
IHVuZGVyc3RhbmQgeW91ciBleHBsYW5hdGlvbiwgYW5kIEkgZ3Vlc3MgSSBmYWlsZWQgdG8gc3Vt
bWFyaXplIGl0LiAgSSBkb24ndA0Ka25vdyB3aGF0ICJub3QgY29tcGxldGVseSBjb25zdCIgbWVh
bnMsIGVpdGhlci4NCg0KSSBkb24ndCB1bmRlcnN0YW5kIHdoeSwgd2hlbiBJIHVzZSAiJkZJTEVb
c3RhcnQuLl0iLCB0aGlzIGNvbXBpbGVzIGFzIGlubGluZToNCg0KCXByX2VyciEoInt9Ont9XG4i
LCBzZmlsZSEoKSwgbGluZSEoKSk7DQoNCmJ1dCB0aGlzIGRvZXNuJ3Q6DQoNCgljb25zdCBTRklM
RTogJidzdGF0aWMgc3RyID0gc2ZpbGUhKCk7DQoNCkl0IHNlZW1zIHRvIG1lIHRoYXQgdGhlIHNl
Y29uZCBsaW5lIGlzICJtb3JlIGNvbnN0IiB0aGFuIHRoZSBmaXJzdCBsaW5lLCBpZiB0aGF0IG1h
a2VzIGFueSBzZW5zZS4gIA0KDQpXaGF0IEkgd2FzIHRyeWluZyB0byBzYXkgaXMgdGhhdCBJIG5l
ZWQgdG8gdXNlIGFsbCB0aG9zZSBjcmF6eSB1bnNhZmUgY2FsbHMgc28gdGhhdCB0aGUgc2Vjb25k
IGxpbmUNCndvcmtzLCBidXQgSSBjYW4gZ2V0IGF3YXkgd2l0aCBqdXN0ICImRklMRVtzdGFydC4u
XSIgaWYgSSBvbmx5IGNhcmVkIGFib3V0IHRoZSBmaXJzdCBsaW5lLg0KDQo+IA0KPiBCeSB0aGUg
d2F5LCBwbGVhc2UgdXNlIHRoZSBzdGFuZGFyZCAiWy4uLl0iIGZvciBwYXRjaCB0aXRsZXMgLS0g
eW91DQo+IGNhbiBwYXNzIGUuZy4gYC12MmAgdG8gR2l0IGZvciB0aGF0LiAoQW5kIGlkZWFsbHkg
cGxlYXNlIHByb3ZpZGUgYC0tYmFzZWAgdG9vKS4NCg0KWW91IG1lYW4geW91IGRvbid0IGxpa2Ug
W1BBVENIXVtWMl0/ICBJJ3ZlIGJlZW4gZG9pbmcgdGhhdCBmb3IgMjAgeWVhcnMsIGFuZCB0aGlz
IGlzIHRoZSBmaXJzdCB0aW1lDQphbnlvbmUncyBjb21wbGFpbmVkLg0KDQoNCg==
