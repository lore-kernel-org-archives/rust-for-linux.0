Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2061.outbound.protection.outlook.com [40.107.95.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F255B145355
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Jun 2025 15:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749135729; cv=fail; b=Eo62GaK//llWorBtw+NnDCne1MMtmNHgiiqoloNphKUTmAvRo2scboHRk7Pm65SQjpd94UoVJbjfsr9g3IvZtz2FW3xO+I8V+PtIbSu1H7v9T98keDqLWWqfE9xJsE4hflUpYJky/KblUMBK7EecgMC/mVXyG4gp1D48ZsjcoCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749135729; c=relaxed/simple;
	bh=1tndy/+70UxOccJqAT+NEJRIPsU3XHP+itp6FHkfrQA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ja72OQis29ky+S7wUtyoqrxGywr+OwNnww9fLIzRfKPTOZ3N6wXycbnfMupY/TeFH64MqdGbbL5Z15WF3/mk9l1po0VdUHvF2uXIp/lWGrEiATsxp3vEZ+urxGghDYj2RUoj9DKppmg3vWWSfIDOTmfS5f32B6N6CeA6tpd3oOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=G3VIDTPH; arc=fail smtp.client-ip=40.107.95.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="G3VIDTPH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JFlGhErMhwpZGAQKagO1bnYYAiZ+aVeA/eEfrHYH5YJOGboQaQPJEVd2HtKjvkB2OGQVHORV8g3kwD1aGlW096Ppf9ezsxo1AfUjxONlySn5t2uUmUFjCcfyR6CJAJrqIXyp1CZoUTzj5xYVfr+sF9OwlfjRaI5VO7m13viEE9tYO8tpZLf+FVj5edZpvYCYiybkwP0fSrRoI/3jwbbeeDrljZQHtiGHg/hQ7zGnM52D7C5L5y58FztJWm9CJJnejn17h9yM2UbFHE0gStTSYPLwdtnyRqnv9KmlR1ShTGpvo0MybobEtuIhwvZwf7jw46Oi2do73Wpy+uBGUQYIzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1tndy/+70UxOccJqAT+NEJRIPsU3XHP+itp6FHkfrQA=;
 b=ThSCM4LcMfEBi5tNaqHm4hG4lA7gBJyBixZvb66DxTisvPttXU5ASyuvfy9TZShmTxYX+0Z5GE9I5YOg7mjmi4eWKXK96dv4ZwX+JHawJGcArSlTm4elSvPK9S0BIbH27peDCtKmupoNgSQNDjJsh95j/zmaiFp94AVhDR4hbnIeUrcVrYkD4yMJgXhroraN5dhqFwx6w/iYpFnM50AXT9i96gseX7gyW1wmyBw2QX+cLllO4iupWVWlxTOZkQ0md+xQ95wt+onBRmfpKhsJRKzCk6OICL2z8AkSTfeqKSku66bEfQIArOYaOEIk1KTULb3BG2bvZwUuQSWsilTxDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tndy/+70UxOccJqAT+NEJRIPsU3XHP+itp6FHkfrQA=;
 b=G3VIDTPH75ljiP1e1wrOIVJJjzPnBGxVtYzNreZLdUiPb2usnRReo564QTgJ5i1BMnqP1sK6ftDkBT9c4PLzRnBH8JlRJEZikvUBiiNVWNEAahM88pEu59l1ru0YvJUikCQl6OL38h0NsYY/bcsMDZSdk0eeOt2TGSh2yMWDjun3TgQ03ioVErzapL25osU+nh5KFzR+dAFjCJokIuauxzSdczibaI11qgT2oug4gNKj3IQ+Nw5lzFGst3gnVVjXfiS7XVuDUkW3W7fCZoNit3HrEg69HQ+0HurOXfyU4k0oz4VAkja5bqZhBG2rdcRpf5+O4/V+CB+yxUjnjygYhA==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by DM4PR12MB6110.namprd12.prod.outlook.com (2603:10b6:8:ad::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.34; Thu, 5 Jun 2025 15:02:04 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 15:02:03 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "ojeda@kernel.org" <ojeda@kernel.org>, "dakr@kernel.org"
	<dakr@kernel.org>, "aliceryhl@google.com" <aliceryhl@google.com>,
	"miguel.ojeda.sandonis@gmail.com" <miguel.ojeda.sandonis@gmail.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: introduce sfile macro for easier code tracing
Thread-Topic: [PATCH] rust: introduce sfile macro for easier code tracing
Thread-Index:
 AQHb0Mn7MGE1brglZEyKYzrCM8w6zLPqDQoAgAe4WoCAAEL3gIAAFKqAgAC4IQCAAKpzAIAAnxwAgACVToA=
Date: Thu, 5 Jun 2025 15:02:03 +0000
Message-ID: <7faac30f75f2ba651995d9667c463706b61ffca5.camel@nvidia.com>
References: <20250529184547.1447995-1-ttabi@nvidia.com>
	 <CANiq72mqPRMXG3mR+wmGd8M61rWfti1JN7Bgke-TOMtTzFWagw@mail.gmail.com>
	 <0602b06ba5fbd640b6db50165688c026911ed7b3.camel@nvidia.com>
	 <CANiq72ncoP6oDbKEes7Lz_K6FAz-MZY1aZNAdsYK8Sz-pwyUDQ@mail.gmail.com>
	 <7f644a70cc0c91bb42badd1ac747518843bb1ef7.camel@nvidia.com>
	 <CANiq72mLEFV6iEX43=+d+5P8g9HT+Wip7eTBgPgqXQ--=dQxWQ@mail.gmail.com>
	 <874ffd400b0632cff99b618661adffe472abbf8d.camel@nvidia.com>
	 <2025060508-spool-twistable-66af@gregkh>
In-Reply-To: <2025060508-spool-twistable-66af@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|DM4PR12MB6110:EE_
x-ms-office365-filtering-correlation-id: 15692842-c3c6-4d6a-ecd9-08dda441ee9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?R2xmMkRWZXlhQldJaG1hV00rNW50R0lvZmxkclhkczhqMnMyVUhyZUJjcFRt?=
 =?utf-8?B?cjVkZW1Jd3l2QzNQa3lienBMYXpSczNvVmRnRFVIWHhQYW1RUXZFcys0NW5B?=
 =?utf-8?B?ZkxQSWRJeWFTOHFqQThwRWpnWHlRV2dYNE04S25HSnlLQUdDaUJiSUR5UEJX?=
 =?utf-8?B?Q041b2Y5M0RhbXpBUnQ5NWtLNWdzcE94WGUzVVVwQUhOQi82ZWN3aGhHd20x?=
 =?utf-8?B?SDdUeVBYaEpEb1lWWGlLTzlKMytEdDlYckFITGxBZWQzRFZpVHJTNDEyRGZl?=
 =?utf-8?B?MDQzdUdjbERNbUM4RTEwZnRLOVNUd1RST2ZPSlU2bmkzOWZ2TjZYcVhzVGo2?=
 =?utf-8?B?RHhLTHBOTDlrKzdnT3Nvc2syd0pEMVlENCtKZ2s3Q0Evc3lnVEVVdklHNFNw?=
 =?utf-8?B?RmhwSm9KUTRXa1ZLeWRnL2djTytNVWcvQVVvczN2blpnOFdHSkdZenB1REMw?=
 =?utf-8?B?bVFWK05kV0x1MXZTWGhXaEI3TWdwUnQzSVUxVXl3TkF6WndtMExuS3R1ZWo5?=
 =?utf-8?B?YStmSjd6d3RFQWpHTnRGYU1HYlRlTEdCTlJWbVpZSmg3ZmdnREVQR1Y2K09n?=
 =?utf-8?B?T1I1R21aSnczSy9EejV6TmJzaVdoN2Jkd0FzczdBZE80WllQUVdFRUlHR2pi?=
 =?utf-8?B?TUp5WGdDT2VvT3d0aWdDUnhDcGd2aFgwM0Rzc1M2aUFjRGE4UGJsbkFsUi9w?=
 =?utf-8?B?NGZuSDNwQ2xIenpYWWVXd1NodUh6SWJjUEtpVnhWSmlKZG5FM2JuYXJjdmNs?=
 =?utf-8?B?R3FyUlU0L09UN2lHSktFYll4M2JnWEpiRWdlWFQvVHlqQ0ZuRXI2cXhYck0r?=
 =?utf-8?B?WC9pUE9HcHQzMCtKaC8xQm1hckFBbkwvV0xLN2x6L2dCd3EwbkNhS2xHQjM2?=
 =?utf-8?B?Z3ZtOGRYMnpVcHlxVWJ4YWJ3Z2d5aWE2LythQ2k1cTFpSmVYWnpwS0JZT3M2?=
 =?utf-8?B?RG44MUp4SzIvWU00RjNsMHZjWC93YVFOamd1Zk9CTis2RzhmaDZmRURrQXhS?=
 =?utf-8?B?WTZ0V3BCcjh4TklnL0Y2VkxlS1NsbEMwQWRjbENPR250d01OQWpobXFPNjFh?=
 =?utf-8?B?dFV4MkxsM0RieDlhbGdxWDR4dXBtSmNPVU5ObUdrZkFFVGl0VVc5ZGZRVENV?=
 =?utf-8?B?ZnZxSjJXeEp1bGRnY2x3c1dUQXZZSkVMY2MxNDdZRHh5TFpEM2h2QzRoV1E2?=
 =?utf-8?B?cHdwTzAwcXpiYUVWSjJ2RitzVGFMSnR1ck1ZK0JqYlZnazNNbkF1Vk1KTzlJ?=
 =?utf-8?B?R3Jya3BlREpSZnRSWVVKRUlCNEd2ckNNd29rUUxwNGdQeFJYRWhJZ2xibWg1?=
 =?utf-8?B?YURDelVkc1R0UmN5bHhuVFdUUUJtVzB4SGRkbVgwQ3hZaW5QVVNBdWxFL0po?=
 =?utf-8?B?enJiQjgzS2ZuRWpCSWltMkRhR29rL2NtWU9CQ2RXRVovaWNmc2dzZVRIcE5v?=
 =?utf-8?B?c0QrcVFtMnNKc0x6VXVNMkJPWm9TdklDamlJK3FIQ1l1eWxveG5WY3RSSHlO?=
 =?utf-8?B?akVML25JZ0hOYkNUTGJEMlJKUld3REpSeE1KdTFGRXlCc1VVRjZoWW9NV0ZG?=
 =?utf-8?B?UW5Gd1ZSUVNpWDNQR2RNOGFOSjBRMWxCNTN1SytzK2pTQUxxWjJ1em16MFJT?=
 =?utf-8?B?cnJ3alNIb3MzM0VFdUc5WUYzYzBiaHdFOVRxYVBMY3lRc3c5K2xlbVIrWXEr?=
 =?utf-8?B?TFllcWNJRS9Wbk5PMFg3Tms3b3pjR0U4Z0d4L0krbzh3cEFrWEcvWHNBVzJM?=
 =?utf-8?B?NUVyVVZvcWxaZElMU0FGK1JHeU41eVBFYVJCUFpid2Y1Vi9UWk9iZUo5Q1NP?=
 =?utf-8?B?Q29iTmxYZXZvUkFDSFJBWkRSb2FnbmpBWHFOTkR0alRhcjJnR0hSb2JYbUxj?=
 =?utf-8?B?K2tMRlFlK01kbVlKb0hOckc4blFmL2Vaa3lvd1llZDRFSi9JZWlYSXB0ZHhy?=
 =?utf-8?B?VnNRVG1CRlVtWGxOc01ZK3B2UUNtTFpDbElMY0o2WHlNN2w4OGMzSG1aMUJ0?=
 =?utf-8?Q?JqqrcDIg4KhGeORswImz+K39moFVGQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6526.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cUFVMzJ3cXVyeTZGc2N3OGZIT0szVFIvbWhjTjBmNytWN0VuU3NhNUpQV0dZ?=
 =?utf-8?B?NytXQWVIVndtQU1HeHNvek8vRmtTeXovQXptaHoyNWN2OWJqSE82QU5iMndt?=
 =?utf-8?B?SjhjZzA3bW5ZZ1B6YnF4V3ZGUFlPckd2UmtiNTJrMGh3enNKMHVHYzgxQWtX?=
 =?utf-8?B?RE5mbzhTbndyWUdYUDVVVE9ORi9QdktOQ1M5dEZROFdHbW5uZHNHN3pYR3Zs?=
 =?utf-8?B?Ui9aZW51dzlhYWMyZ0xDc2V3MkovdG9zZVJTcWk4SmxJdXJxa3BlOXZKajI3?=
 =?utf-8?B?dTV3K3BzSEJTTEZ2M0pwOTBaMThHS25TaUVJcXZxUFV0UDc5aFJTWmN2d1RV?=
 =?utf-8?B?cUpwQ3E0YzljNm9JRGhkWG56TVZDOGxXTEpWaTZmaVYxMm1PZ1VscXlsTlMx?=
 =?utf-8?B?V0lvVTMxQkRLSUNyY0hpQjR4aFBDc3RTYXlacXBLRFN2V2M2c2UwaW0rNkdB?=
 =?utf-8?B?MkFRZ2dwb2VudXY5MG1VTXhpY3Y3eGNpUnBCd3NBSTlLaSt2UHgxaFpOaDJa?=
 =?utf-8?B?eGcvS3A0MElqMmFEL2N3Q2NSa3cwbFRqNVR6YndYdTVDNWx3UTExWjNoWnFy?=
 =?utf-8?B?RnIwQWlHUFVuYk94dUczYjZZTHdlQUNKejg2RDhVekIvMXJNNVlNNGtBa1F4?=
 =?utf-8?B?cVRRSFlvd2hpV2RIamNVNFR1TTFsbFVlM3hUeEo3TXdoNHkzbGsvNTdUYkFt?=
 =?utf-8?B?YysrcGgvWllsRzJmdkNVQWN6eGtTaVJHc2dMZEdIRDd4N0o3aFozSjVuMFdZ?=
 =?utf-8?B?UHdEbnZ0ZVhpUk1oOUlzZ2pYY1ZVMTNxaUV3MDRjdnAwZzFaeW11RlZXUVND?=
 =?utf-8?B?SnlwZ0xOM0xWcDNGM3VwS1BWbVNOL0luMVo3alc0T2U4aFdSY0p3NktScFRF?=
 =?utf-8?B?MUlEaUpJZFZEWVpJbldacFdRQTFXZFFXbTdjQ1EreUY5ODdvYm5hYmt1WnZJ?=
 =?utf-8?B?aEtGK1JXczAxZ1pVUXdLNnhvTEx3cUxyaHdvaTgyR1lEMWhIcTZTR0NUeWwx?=
 =?utf-8?B?ZHl3ODdCVHhPU3pHaU1GZC9sYjlHdWZJS1Q4czBFTjBmVHl6L1lnRUkvNDRv?=
 =?utf-8?B?dWdqWGN4cVBLOTg5eDBYMEcvL2FjWVhRZ2FFcEE2TXJva2xvWnJ1WXdTUTlT?=
 =?utf-8?B?RUNWTFZ2Q09RNkFORTJ5NUpNOTdkTGNQS3Q1TTZtYnV4T2tyaGhycjZZNG1T?=
 =?utf-8?B?ek9PSkVtck9WV1JEZVVvQWJtekgyUFB2eGZTUXM4UmIvRkpta3A3SWlZUWE4?=
 =?utf-8?B?L1E0VGlFbEpDL0h2R213UEVsZ3FOckRJT2RRRnZENTl1MlA5eGVVampsd0x3?=
 =?utf-8?B?Y25KQXdwQ3RhTE5nMHNWZ08vZzVzYit4bnB4V2h6M3JsNXpiZGhUZTI1ai8w?=
 =?utf-8?B?RXNyUjZzUTlwdjBta3lpNzZocmkvcFRGamRZeDJlUjdhK3doT1lUUDk4V0dp?=
 =?utf-8?B?TWNOOTdobURjVW80NkFrRStnYVZmQU9iV2RzMkdDbVJycVh0SFFxQnhwb2RO?=
 =?utf-8?B?UTRpMTAyVW5ybUh1aVFUcjBZc05wZ3hySHNPOUNaWmh1OWl5TWltcFBZZWlj?=
 =?utf-8?B?UGxMbU9QeVdGN3p4TGJ5dXNNRm1GekJ2ZUVOWUM3TUVwUmo1My9yQzRNWnFL?=
 =?utf-8?B?MlFwTmlVZXhEV1RMMDdWQnEyWHZhbVhiS3NFZ3NWMjZnVGlydmRQVjdvUmJX?=
 =?utf-8?B?QnNnNTBGOU1yVjhZNUY2NFZRN1U5aGN1djl2cEM2eno5SHVqNzBoMTBSalN1?=
 =?utf-8?B?Q2dwYXF0WDRUYjBsUzVrQXgxU0xNbGFtVkNiTTlrdDBLQmgySGVuVGJQd3h2?=
 =?utf-8?B?MFBneG9LcnlWZ3kxRDgrM1h2KzJEWG9CbjFYS3hWbjJOL0NXKzU4SndQazQ0?=
 =?utf-8?B?MWNxcUFhQkxlOWN4aHFsZjVYREFXUTkvZXppNW9Yc2tnYUtZcmNSa2pjN3Y5?=
 =?utf-8?B?aFlOdTBybmR2MXZ1WnhaN0VWL3h6QU9ud21xZWFsTXZyeGlVRFMwSFllQWNv?=
 =?utf-8?B?SE1HQU9LcTlCNElCMWY4dlZ0YS9qeFl2bTV1ZVFldi9FSkhZZmJvVFd0dG96?=
 =?utf-8?B?R0U0RU1wSHozZzNJYkF1WmltR1hJRnhPbjJ4ekdIQzdqVFo0d2lKRzI0R01w?=
 =?utf-8?B?UHFxUVdTWmxEU3lqZWhqaGtGc3loazVaZHlCMWtRY0dMVU4reEtsUUEyTXJh?=
 =?utf-8?Q?2pTFgcvX89hZqJnZUzuTldJVrM8U23OkJSlcvC1rcK0F?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <62C934C6139FA74F912524F8CF5C2D78@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 15692842-c3c6-4d6a-ecd9-08dda441ee9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2025 15:02:03.9420
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LFarptYHSlek3T723kt41w+EthIbrsMOsUOhCBmVAIxfEeRvY0oMCXOlMU6Mzr91T5IbL7p1onKMOP/rD1mybg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6110

T24gVGh1LCAyMDI1LTA2LTA1IGF0IDA4OjA3ICswMjAwLCBHcmVnIEtIIHdyb3RlOg0KPiA+IE1h
eWJlIGRicyEoKSwgb3IganVzdCBkISgpID8NCj4gDQo+IFdhaXQsIHdoeSBhcmUgd2UgdHJ5aW5n
IHRvIHJlaW1wbGVtZW50IHRoZSBleGlzdGluZyBwcl9kYmcoKSBjb2RlIGluIGENCj4gbm9uLXN0
YW5kYXJkLXdheT8NCg0KcHJfZGJnKCkgaXMgbm90IGNoYW5naW5nLiAgV2UncmUgdGFsa2luZyBh
Ym91dCB0aGUgc3RhbmRhcmQgUnVzdCBtYWNybyBkYmchKCkNCg0KCWh0dHBzOi8vZG9jLnJ1c3Qt
bGFuZy5vcmcvc3RkL21hY3JvLmRiZy5odG1sDQoNCnRoZSAicHJvYmxlbSIgd2l0aCBkYmchIGlz
IHRoYXQgaXQgdXNlcyBmaWxlISgpLCB3aGljaCBvdXRwdXRzIHRoZSBmdWxsIHJlbGF0aXZlIHBh
dGggb2YgdGhlDQpzb3VyY2UgZmlsZSwgd2hpY2ggY2FuIGJlIHF1aXRlIGxlbmd0aHkuICBJT1cs
IEkgdGhpbmsgZGJnISgpIGlzIG9mdGVuIHRvbyBub2lzeS4NCg0KQW5kIHdlJ3JlIG5vdCB0YWxr
aW5nIGFib3V0IGNoYW5naW5nIGRiZyEoKSBlaXRoZXIuICBJbiBjYXNlcyB3aGVyZSBhIGdpdmVu
IFJ1c3QgZHJpdmVyIGhhcw0KbXVsdGlwbGUgc291cmNlIGZpbGVzIG9mIHRoZSBzYW1lIG5hbWUg
YnV0IGluIGRpZmZlcmVudCBwYXRocywgeW91IHByb2JhYmx5IHdhbnQgZGJnISgpIHRvIHVzZQ0K
ZmlsZSEoKS4NCg0KQnV0IGluIHNpdHVhdGlvbnMgd2hlcmUgeW91IGRvbid0IGhhdmUgdGhhdCBm
aWxlIGxheW91dCwgbWF5YmUgeW91IHdvdWxkIHByZWZlciB0aGUgb3V0cHV0IG9mIG15DQpzZmls
ZSEoKSBtYWNyby4NCg0KSSdsbCBiZSBob25lc3QsIHRoaXMgdGhpbmcgaGFzIGJsb3duIHVwIG1v
cmUgdGhhbiBJIGV4cGVjdGVkLiAgSSBnb3QgYSBsb3Qgb2YgcG9zaXRpdmUgZmVlZGJhY2sNCmZy
b20gbXkgcGF0Y2ggdGhhdCBoYXMgbm90IG9ubHkgaW1wcm92ZWQgdGhlIGNvZGUsIGJ1dCBhbHNv
IHRhdWdodCBtZSBhIGxvdCBhYm91dCBSdXN0IGl0c2VsZi4gDQpTbyBldmVuIGlmIHRoaXMgd2hv
bGUgdGhpbmcgZ2V0cyBuYWNrJ2QsIEkgd29uJ3QgYmUgdG9vIHVwc2V0LiAgSSdsbCBqdXN0IGtl
ZXAgdXNpbmcgc2ZpbGUhIGZvcg0KbXkgb3duIHB1cnBvc2VzLg0KDQpCdXQgSSBhbSBleGNpdGVk
IGFib3V0IHRoZSAqcG9zc2liaWxpdHkqIHRoYXQgd2UgY2FuIG1ha2UgZXZlcnlvbmUgaGFwcHkg
d2l0aCBteSBjb2RlLg0KDQo=
