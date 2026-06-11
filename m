Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022084.outbound.protection.outlook.com [52.101.96.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58100345724;
	Thu, 11 Jun 2026 10:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781173904; cv=fail; b=CM0ODTSOjGQ4Rj5lC1AjrXaHWiNL3kXywpJFpEjoPNx2TdorjX05BZRHw67N7njU+g5MAVty1kcI0M/v7OEMBL7r8NjJGQKpvOTc5h77CqUNFqVv3aFO/Fh2YPC6UGT6KBs4zQNf9/9DTQA/rUerFOIaLhrC/kpNpxbSMb4zKOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781173904; c=relaxed/simple;
	bh=x+FynuFgn9FHUz/MLX2ZPggoiaXUY1lneZu1VkF8nrM=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=axcqSOVWHxZW4XnQ56nGRj/w2j3T4APMmxx53JDgHNexRnBE/+PgVwahMDX6OXat+JtQvI02mdBA5OQdoPsdc1jjK9q6NiDYJomR9GabZU9QnGJbWZ9AwnXX5w88bpzlokOueGo3P8gZiuUxky4C9Nv9xhe1RZNN2n824ntNME8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=SrdQGjpP; arc=fail smtp.client-ip=52.101.96.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="SrdQGjpP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RAbRyMje0vjmF72a6KnqZ3EffbS6yrLO+Z0IFVbQo5UJZrIWi+DGp1rbmIor55n4kOrKBN3SwCGTdZtXjEt15mboVDWFBlcPbEF0vjD48yMLV84igamyZh6vMnFsvL7ZvBbeb+KfuaHrJlfaOAmKxtrcqjZUE+x6S/o4NTDxeIbuQE8t8slgEYvG0FEh/CmOhLk/tfXYiWzsOIc4zSBahlAZQWKli8dQKiyBbatfHI5DCY1ZFcnwJ97opuguJ7K1rAjmlMD8KSiVOmcmBlb2wO9ElnjH610uJv/ZIxbqAc9+yY+H7oXkjPVsXgA6jBwcdSsGy1vl+2zZ1leje79FoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqowgnHOGNPHXUY7wkoBzO7JNjYHdwbe1sx4gAesb/g=;
 b=TJrstToveXs7ADhIoGeyvhbiy/RYYXl7WSOvswPzoQCFpElcUel1Ecpxkq2YjjH0SbH5jv1IZHWyDtPy5j5WH0xXxqwxPigA3FsmdvUVorjPq5spbHaZEaImaUllSvMbc1wLOBGtXzCNdr570rG9554zfN38V28DwutzZEgyleKMR86tzahtc7rcNkekJazKtk4BywLkHFMtNyuhXmMkIlfmvx3B/jJJSjST7HSQcMszv31KgSGdjbiVhkMwpPNdVLJXH/fo/bkDLN8gpz2zduFf/06rdDkM4Z3aPGaFZObqPlDACfgU6FCOUvZ0XUzfUOfcXUD9X5/1p7FT6NwHeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqowgnHOGNPHXUY7wkoBzO7JNjYHdwbe1sx4gAesb/g=;
 b=SrdQGjpPw65ljRjWV0AcMJZbfndzdZdGUPJx4BFjpUidZu7yWO6j8YPFCLDeK/86jxx1mGXc2IsnCn1ZLC0iPAc2pdFT6k5gNt/UKxZEsJpbq47R08xcK02Cs1HoKeKj5pPuBqIZUs/zJ0D7ylwDDs6B/g/EaLrgukUMarFUOgM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LOYP265MB2368.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:112::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 10:31:38 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.21.0113.011; Thu, 11 Jun 2026
 10:31:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jun 2026 11:31:37 +0100
Message-Id: <DJ65G8AYP0Z3.3RHM7OQS48RC@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <ojeda@kernel.org>, <gary@garyguo.net>
Cc: <a.hindborg@kernel.org>, <aliceryhl@google.com>, <arve@android.com>,
 <bjorn3_gh@protonmail.com>, <boqun@kernel.org>, <brauner@kernel.org>,
 <cmllamas@google.com>, <dakr@kernel.org>, <georgeandrout13@gmail.com>,
 <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>,
 <lossin@kernel.org>, <miguel.ojeda.sandonis@gmail.com>,
 <paul@paul-moore.com>, <rust-for-linux@vger.kernel.org>,
 <tkjos@android.com>, <tmgross@umich.edu>, <work@onurozkan.dev>
Subject: Re: [PATCH] rust_binder: add ownership assertion to Node::add_death
X-Mailer: aerc 0.21.0
References: <DJ5ETQTN0B4N.G35D5N46VX13@garyguo.net>
 <20260611081525.73734-1-ojeda@kernel.org>
In-Reply-To: <20260611081525.73734-1-ojeda@kernel.org>
X-ClientProxiedBy: LO3P265CA0008.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::13) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LOYP265MB2368:EE_
X-MS-Office365-Filtering-Correlation-Id: 24cc43f0-58a5-432b-37fc-08dec7a49e89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|10070799003|22082099003|18002099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	434KLLgEbNt+GdRo5yk4Iw2Yh1Xxceudbf5HjohWGIb4GPNxO80Fo7JdCVwl2qD6fSodeonBMQhfj1ZrkPNsRZ9RD+/02fAAt5ee0UCepC4t6wZs6VUk6L18Yf4PelPwqpU2/FWdSKQbHKFVVOUzRxVPW5dafy4oTW/qs8raWG7OwZN1O6+RgTnfbzKrhmD6ZL8+/NlZna1CFEXdVxg6z7JmmAZrWte63tCg9Q3oi9Br5LWROQkms//FWqaaR76vYjJAh7zyLYSs4mbb//iGl/lpXAJj1Bovvd0TFZFJBGFz3S3LUQ9Cu/udSB0nf0GOlTcr6HuTeja3RW7ryV99IievlsTj6wcygRTHsYzrd+h9dVQT00h/e3bxByGL008GffnlboaBwETtM1iMZ/0D1V5OlXvUU2TiGQSvT87T++VMEmOFqPvS5J1G+hASiFZBW+TLMdjiH3ETqP5c1bL66qM1wyFF+BqX8p4rADYmu1Z861mqJi98mRvSVCfDgB4Mue0/PEic7S6jXuyZeoZ3YNQ2s94mBp8ibEvAk2E8r5tTaw75jDH0ZIEzs2RnNFyQLA0R31EgKk4mH6Ulyfh8wSVPNLkM95lUV+EUyApM32i+vpB0ao0dQHQq0W2FDy/9qOhkh2tIJsv9iGv7bjFfUqTEb5rQss0b7dlr+L0E6s/ZSdwcdtbh7cbppaLi4kor
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(10070799003)(22082099003)(18002099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzdqQmlkWU80V0tINVV3L05XSGVvNU9aU04wb2F3RUc4ZTFRWXNwek81REgz?=
 =?utf-8?B?Z2RhN2F0cnJVbnM0TGRZcnJwejV0T2lUMVZla1I1RDg1YXIzcnFVQ3BGZmVM?=
 =?utf-8?B?L2NMa2lGMFVJWGRzVHdNQjBhbktkb1JPSDBjOVgzNXJHNHY0OGNDeWF2UFFJ?=
 =?utf-8?B?TEJ4dFdMNndpYkVnOC9IZ1FFSW5VS2NZOTZoUUJNVDVpK295bGJBQTRtQU1M?=
 =?utf-8?B?dStlMjl2K3h0Q1V1clZJUkJsMDhCOVZwZTc3YU12dVpKUFUzTVVGT2RoRkVO?=
 =?utf-8?B?UXBuTHpJQy9OOStDdFJqd0hrclBDTTlDSjZjV2VtOG0xV29PMU04cVBJWGJa?=
 =?utf-8?B?akhWa1dUc3laNkxvRWY4Ynp2aTlKTG9IbVlyTllTWjJtUmwrTytrRFNTNzhy?=
 =?utf-8?B?ckJVOWc5TFlBaXJXREkvTUpSb290cTh5OW5EKzlML2NpODZnelBpelZuQmhF?=
 =?utf-8?B?TlI0Ymd3Rk05NDZob0syV2sxMWc1eURtWkppNm9BclRWOTU4R0FNc0l0eG1k?=
 =?utf-8?B?RythQnQ5VzFocTJ0am1vd1dsV3BrZDJQOFNsWnBGTEtocEExZ0Y5OWJxV3BV?=
 =?utf-8?B?MjFGc3ZuSnRUOVRDb3BXS1IxKzVvL3RYandObkhzajV2SzY3Mys4MFJBSTNj?=
 =?utf-8?B?TmJyRkdmVWJlM20wYlNQdkhWRmlNWWJtcmFvam5jaW5XeEtQVGc3T3dObkQx?=
 =?utf-8?B?Ym8xUVl0aWhjZ3ExTU81dmJJb2tLVWp4eEZGUmV4dS94MDJqd0pPS08rTEFG?=
 =?utf-8?B?cTNiZi9qWC9NSlZ5azJqdHdRcFVZUU9xdUtZdVBHY3cvaG1Xd3BMK3dEOHo3?=
 =?utf-8?B?bVVIYjRFQXorTUl3ek10V0FBSmpnRmxpdklXVGFXUTZOOVJVMHFlYmNLdXZ0?=
 =?utf-8?B?R0tQcDVTakJQZkYvb01XYmpGdmpERENLUVB6S3hITnhnZVBLVUpNeGFQdWpp?=
 =?utf-8?B?YkRwL1h6N0F2Y2Ywb0d0K3phR3MxOHFpUFRMUHhhbHJjNW5SemhvZ0FaYnF6?=
 =?utf-8?B?WUdxOWM1cVR6V3ZxM2pHOGFHcGxqaE8vM1VVTlV6RjBwOGJvanRvU3F5cWds?=
 =?utf-8?B?ZjhVdXR3MEYxb3V0WWJEQjBUSGdNQlFmd3Jzek1BWk8wU0NaOW5BcEpWd2dU?=
 =?utf-8?B?V3U3ek5BL2hFZGJzQXVUVjZEZHVGWEd5UVA0bjRTQUNwSDZmNmpVNjc2Nlcr?=
 =?utf-8?B?ZlJ3OVJWNFMrRFFvSmNmMXBLOEwvRHVNTTdPOW5Ea1NMK0ozTUFDU21hWmRF?=
 =?utf-8?B?YnRZNUtTaTZ2bmdkbFFYMWRPaWxVV3pMM3ZhN2JYSFZaOG5OUmt0NlpMRDNV?=
 =?utf-8?B?cDhaWllhQjJWRmdEMnpnQnhWa1V1L0pUcjFiSExnVi9pMUtHTTdVSUxsM0Vn?=
 =?utf-8?B?ZHJ3Mk80RHU0dUUrbVZHZ1IzWjNjUmEzaEtkYmZzM3pTY1A1ZDBCTjI4cXox?=
 =?utf-8?B?RUtGRUNLemFwNGdtLzZQaXJnZzlzNXJoMzk4RXlDRUlFUHlyL0lEdGd2NWVZ?=
 =?utf-8?B?R3ltcVZTa0ljc08vOXZMVDFTL1BrUnVmTDRkTE1VbkNFQTQ1aXNqbDZ3b20x?=
 =?utf-8?B?N0VHYWFCWjdMWkRRMS9tOGJJSVdWajFFNGpuRjRPbXBqUCtSa1BBZEQvcVVV?=
 =?utf-8?B?b0N2emhzczFSMlB6U2pmNmpTanRHT1RrdHVhTFlIbDBYb0ExTk5CU3JIK0V6?=
 =?utf-8?B?K3FzY2FxQjV6K05ka3AyVWFSb05RaUw0QW8zaUdCK09KblJmbDhscFJkbmJ2?=
 =?utf-8?B?YndTVzdDV1ZWN1R3UW5vZmZJME1kNVhsV2JyUEpFWmJqYVIxSVB3NHdvYmhM?=
 =?utf-8?B?R2pJNjUxd0kxWWQzSkM5WUJjMVdWT254Rml6UlhDVFZObzhMWEplYk9WSndC?=
 =?utf-8?B?T24yZit2ZjB0WWIwYnltbGQzcVc0clVsSWNQUDZyK1ExTk81ejJaWDI1UjVP?=
 =?utf-8?B?d2x0T1ZZUkxLdklhaEFINWtjcFJyL08yQnYrUjg2ZERRc3JMcUxaMVJQNVFj?=
 =?utf-8?B?MFBWdDMraWFKRE9HTEY3OVlzeUZsb2RzYWJHdmFnd1RkRWlRaG9OZnRDOC9K?=
 =?utf-8?B?cEl0d244MllWcGdJZGxVTWRFMzJXcElhM25jQWZiMjZiMFRVek9oaWI1TmhV?=
 =?utf-8?B?ejVmTG5ZckdJelpMOGlOVDBZQ01NVkdXZStwaTZIbCtHanl2bUdwQm5kTUhx?=
 =?utf-8?B?UGIvMDdyWGE1MlNuRmdjM3YxOUloNlZjZFJkc2VwRjVuZDRSQmZ0TzhkQUNx?=
 =?utf-8?B?eWp6QlV4bnhvNjhWa1dydk5MejZubmZHVk5DS3V3UFpiMVVjM0U0dVZ4aTlU?=
 =?utf-8?B?OGsxanp1Rjl0VnpHclFLTzNQcFFyT3d1VEVZN3NqemNia1h5TEV3dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 24cc43f0-58a5-432b-37fc-08dec7a49e89
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 10:31:38.2868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4qXJfVt1n6R8hQspyfrs0OSS9PIMNl2LTTzoEg/KknqTMobL9QdL5e0wBvboupMqzWAlnfF0cObet63361U5vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2368

On Thu Jun 11, 2026 at 9:15 AM BST, Miguel Ojeda wrote:
> On Wed, 10 Jun 2026 14:39:46 +0100 Gary Guo <gary@garyguo.net> wrote:
>>
>> pr_warn is probably a bad idea here. Given the code relies it for soundn=
ess.
>> You're either sure that it won't happen, then you use `debug_assert!`, o=
r you
>> are not sure, and use `assert!`.
>>
>> There's no "I am fairly certain but the code should keep running despite
>> invariance violation" for this one.
>
> [ I keep getting your emails way later than they appear in the list...
>   I spotted this one as well in the mailing list. ]

If you're using gmail, you might be hitting the receive limit? You can rece=
ive
at most 60 emails per minute.

If you have more emails then it'll bounce. My email provider will retry aft=
er 15
minutes for up to 6 times, so if you're consistently hitting the receive li=
mit,
then it might take up to 1.5 hr for you to receive my email (or for me to
receive a delivery failure notification).

Best,
Gary
