Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022128.outbound.protection.outlook.com [52.101.96.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1621A683B
	for <rust-for-linux@vger.kernel.org>; Sun, 19 Apr 2026 19:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776627391; cv=fail; b=cuS5eQxIE9FOx9vtlEk5FN/wBGXT1qTospdqKurEk73zVQDFeazNuwuUtKUD0nToDa2C0qy6qTaJc668cQ0dXVLqU4bMQX1pMJSExcyOFjD+SF150AXH7wF/zXqLx6FjPFSJhqAUj6g8BDAgIVPWhW4Zo7ULbncZeTBn16O5fNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776627391; c=relaxed/simple;
	bh=KIN31iRPSCismDBm2zDbKvtD0ddjVw10HvcjYWQRfwM=;
	h=Content-Type:Date:Message-Id:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=esDsEZEaUUTOms9adSdiRY/BCJ330WRrSjVa68eE89mvbkgd2VfyACS5ZBWg3lgHeiyZ4kscB75SGrE0oLZWgm09j7U2h5mZFCkfrVdpDG509i6yB+HFyF6UaztyGDFwkNAzBiMRf0Tnur3syskwIw/BrPd1aT6Y+YkTPHTEQUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=jJ5ccuV/; arc=fail smtp.client-ip=52.101.96.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="jJ5ccuV/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lgZ0wd+60gRkD35Iubjg9Y+VRQwr5IQ2a9qdUn0Psi1eekTnS+PLSuWHOh7OzFTnaI388vLjImJny4nyGt7nFBVvigu2fTrR4eszNOAgp3QqOoDzzw+k5X201XKYLkzRv+Ef1eJXUZOmxNcxcHYnejp0xPMF3jooLp51JGPvTYKBuWQ1Spawx1WAYfQXok96uEzVms87xW+p4dPgdKjJmyVSlEaWrK6LuIpifeKcSxT7xhB/nwrBi4MTMYHTvgKbLDlK54FUebqWCegqcQUst0YhOYXt2HeeSJ3yNoarGVPaJdi/UNVDTNtE0ppd7lWf5UpweYOChGFkXW2WjdBIfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLZVIsw3n54GAYUNQpQiZ/I461+jmyIK1qn9mAJo9r4=;
 b=CLtv3vfD0u3XUBMJsjCMsPy7GqdmJ0SAu45pqWQDlUpm/TRk+6dT7H+oBmWcpmd8n9FNh9y0nLwn3AF+OKwLr46LA0Cud/xINEHpstFgUBe1jei5q5mboI8c2sw7ySrGd6kBCZqblMWIPfmJiY3nrUabBzANM4A39MuB4TPLjXq38vOoSugwN0zSyXRC9H+8Nfg/SbXBRDWsDFGvNzkpExw4jspAyIq5rb6KTrLgbbwUNbteygpE0fbFh3nOapKAjJZ3pik8daliGuEv1OZQvrQtmTlDjykDtKQJJR+MqT9gkXyzNajXBYU22LD61CsjBjVAt7CrSxRC9+ekonZ3aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLZVIsw3n54GAYUNQpQiZ/I461+jmyIK1qn9mAJo9r4=;
 b=jJ5ccuV/o+/nbhx2b+9HblYciQMHPpkyUSx0LRrtF7esxzsUQWcm8rPiBGs2eJsGqCBcG1GyBAitpHZTVaLLKaP3E53QR6XT4qKvu8hP6hUwHJc7eF+D1rmv+27jxIAzw7jOormf2+Jr2ZyUSRRk5Jm0Xdpr+k4MLiHQETRYJvw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO2P265MB5301.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:257::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Sun, 19 Apr
 2026 19:36:23 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.20.9818.032; Sun, 19 Apr 2026
 19:36:23 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Apr 2026 20:36:22 +0100
Message-Id: <DHXDUGAYY5TU.1UNRJ1RUUVQP0@garyguo.net>
Subject: Re: [PATCH v5 6/6] gpu: nova-core: enable GA100
From: "Gary Guo" <gary@garyguo.net>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Gary Guo" <gary@garyguo.net>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260417191359.1307434-1-ttabi@nvidia.com>
 <20260417191359.1307434-7-ttabi@nvidia.com>
In-Reply-To: <20260417191359.1307434-7-ttabi@nvidia.com>
X-ClientProxiedBy: LO4P123CA0173.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::16) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO2P265MB5301:EE_
X-MS-Office365-Filtering-Correlation-Id: 626158f7-1b25-4b8d-6622-08de9e4af07d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	y+h9yXYmUej1LyoVUtPRx7bzrOtPcKQbkrmKDmV9sRt0ZC+jmpFfFvJgPrqgRA3y87tHxO/3F3oiYG0L5mTYldNIi5/VaasnA5nKYkbcd5CyxM9SQATGdJ+7KwBxbKjMxisX6QKTMY1UB+fsuJZu4GtNduQsE0+Q/VjrBIzbEgOunFHptGVRi3Fa92kWXGKm6OOi00/QmeECz2F86A/a8qfvWzFNE3T0k26HPCGq8eeZLIqRRpSDNcihtcYeGU1jhTuFEUR7B3n2RnG/knCmmy18qBkbPLWkC43t5QsTwAjXp5jMi2y555uBzJgCpeobL2dVAl4zNMu2d5h6Lpr1EfGt6d7zeGSRfpyVBwn3QTXVQ6+UVVPy0va3pf0p9HhwVc/5cO3+T55acVbRT7B5Z0knsKtOiMmHXHpUzV+R0F4fV2KqTbdPkEp+FnoUsbypJdLwUq8j1Blo3OPcUgi5HOyCRmBvji3SaJyTqg2lz+WCbbRa5//u+EYNJLmUd9wNZkgu7fyEKn+w7SltTowZOWrSW8HH8p9k2Zy1IEc2wkQIQpIDOpzfiaGE5nI3S7jMIU9amOw9/u77blk0f3yeGHSMr5PMnB8Aq31HGRiMP9omjJPU5NAYwSCMJn1swR/PJ+/pt4Bv0cb2iQONxvewBX8B+OD//s0olYmTv7Z7JP8d+npRsB2YNAKP6442W/qlgE25JFI8+GLFAkIOezJDmLQY3R+GjYgEnWgT2ztsrkA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2N6dnRYd2diUjV2YW5wNHE4MXdwVkR1MUlqT05uamUzSFY4aGl2NEY2OU5m?=
 =?utf-8?B?cmJmWmNyMHRQeXRrVTJsSnkxWis4cFgyb291TWpGZ3pTZWx0cys4ZG53SktZ?=
 =?utf-8?B?Yk1YY0pLcndqdnB6NWU0c0xsVTdJajhuMS96enFMeGJrdDA1ODNKR0tkL1Rt?=
 =?utf-8?B?T3pjSkIzMnMvVGczanYzUUhtNElYaUVmYWJ6L2Zla3hJWVMwYVlxSzZRcyth?=
 =?utf-8?B?bWpOSWxkZWZRVFpLSXMwOHBKZnNDNWorZU92MUhZemRma2VUdFU4dmdKQlVO?=
 =?utf-8?B?U29JeWtPUkRUSG1uSmNMeFJPbFh1ZFBLakx1UmtXQ1dKU1hxbzBvd2tYTG91?=
 =?utf-8?B?R1lkRDFSYVhSZW1BdFR1aGVQTVhDK0x4UHBtVFFCa1RzbERUTkwrRlJVZUxB?=
 =?utf-8?B?cjRTNmxYclRTZTd6K2tnMGVlaERNc09Fa2lKbE5jRUtLeGpwMk9PL2prR2Zy?=
 =?utf-8?B?aU0rZnJtaGtsZDFVeGRHQ3lNTG5BREdra0ZOWkhYSHh6VXVCTDl4QWhyUVhB?=
 =?utf-8?B?VmF3aHBzWlVyTUFZTkpQMVd6Y3pIZldFaVlGTlAxeS9jVnBZd2cwZk1iQnVy?=
 =?utf-8?B?bzRHVytCKzBRRUgzNDE3cWZnR09hR0drVmJjNXdSYkNDckEyamxXNkJhSllt?=
 =?utf-8?B?UGc5TDJaeFRtQ2xQbys3bjdWbFA3T2Z3c3FWYXhSZm4vK3RTczlUcDhaMXpx?=
 =?utf-8?B?SlZITGV2L0RBOXpiZVJzKzFZWThWU2xFRFRSUVZYc0Nwc20xQWZkbXo4QVFH?=
 =?utf-8?B?eHN4YXI3UjFub3htN0NZUlJaMEtzSXljcWY2eFovTDQwV2RXMmlqQ0Vyd3BQ?=
 =?utf-8?B?eGJCSlRxdE5MM2dkbHBrZ1JDeUlKZC8wd0pqOXRpL0c2R1lNL0Jnd0Q2Mm8x?=
 =?utf-8?B?Z1oreHV1MkFpSFRmZElRRE9naitZWUJSdVRUekl0Mm1OOWp4MG9TSHhlSFoz?=
 =?utf-8?B?SUJYcCtzQmd6ZmgzSytCa1RNMkJZb3Z5aFJndGNkOE5rNFpmQ3ZWTWwxSnB1?=
 =?utf-8?B?RkFlME15NFVZc0NqRmV2aXB1TktwdnNQc1A5RHRNWlNzTVdDVlE1K2RHYUM4?=
 =?utf-8?B?WFBoZytFVHMwakdvcG5pSWsrTDF4eGRwNWgwUkRqT2FlL1NqMkEwZEdTYmI5?=
 =?utf-8?B?NWd6Ylo5bGh5dWJ3RHBobmEvQlkwdUp2czFvUlk2T1YyZytPSjc3YTVoNzhq?=
 =?utf-8?B?dG5oVlhXeHN6YXhpUnI1S0phMExQaWFIcERKTkRYQ0d3cnBaZ1hGb0RHV2N1?=
 =?utf-8?B?VFpxdkU4OS96aCtpR3VNcTl6aHFHeGY0cy9lMDl1RDBSWkQyS2VzbmRLZlhM?=
 =?utf-8?B?ei9ZZWsvQ0tSTVE1aXdqWVpHZ3FvSU5KOGdPSXRIR3pvcVphUmhHaGU2ajhO?=
 =?utf-8?B?MlAyd1hMODJxQm1WTFl3aUo1TEFpcGdYNzBiVWkya1lTSFNCcURud3J1SFVa?=
 =?utf-8?B?NnZ3Rzg2cmEvR2s1MzJxN2pYeGNOUzE0T0ltY3AwdHBCd0hRakdrWm5ndGdX?=
 =?utf-8?B?clBpQnN3YndDM01WdzhwVFJwVzk5VUdHZy9QcWZNOUk1RUNJMC9ZYVdHdDcr?=
 =?utf-8?B?d2c2Tmx6SGUrN2RDUGJEU0JrK0R0OGYyOXNNMC8vTHZObVdOU1I3c1pKekNB?=
 =?utf-8?B?MldiYis0WUFBZVAraDkzQjl5YXR2d3lEM2NQU2tvZ2pWOTA1ZG5RSTRvVUMx?=
 =?utf-8?B?czMyd2ttN2tFTmtISGdoWmpvL3RwSit0V1J6VEM2SndtQkhJY0JOUkx5R0dW?=
 =?utf-8?B?ZmpucGlSdm1xUWJQVkJzZEw3QVdsSWpjbzZCK3BicUVXdkEyV0VjRGFUV1hY?=
 =?utf-8?B?YlBzZlk0VWMrVGlaeUFMRzNDcDMzbXRsOGtLUzlEUVdmYzc0L2wwaVNZeFFF?=
 =?utf-8?B?MTJUK0FTazNJaCtuUnM1TkUvc0NEaWM5MCtETkkzVUpYaXIrV3E4YjRyRXNT?=
 =?utf-8?B?b1JXeU91SlBkYWh0SUJXaHJnRDV3cmxGRjRLUDdDYUdwdVNKQ1M5K25FZFU2?=
 =?utf-8?B?OUFGQStsUmRSWkthT09WcWdIclUydGVqZk51dHdiSXdOMjlMWXJBblpsU3I4?=
 =?utf-8?B?amRRRFlGL3FqV3Z1WTZ1a2pRUHUyVWo4YkVHcEFFYWV2a0hEamNseGFvL0lB?=
 =?utf-8?B?endrUUh1Y1EyaEw2akVjSDhQamV1ZW03YzQ1cTFFR1B5b0wxdFJhblNoTjYv?=
 =?utf-8?B?WjZad2xoNHEwRWRQVlhZLzBsYlRiSzdkODVpeEJxMFlPOHNjNmN6elkxU3V6?=
 =?utf-8?B?RmJ6OGNQZDhwYXliTTh3SUNGZVZTUUpMemdYeGdlUG1qM05OeldtN2s1dEFN?=
 =?utf-8?B?eUJSdUU0VWp0QUJsaDVxVVBVSVhSeFFxN3NzMEx2L0lBQVc5bDgyZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 626158f7-1b25-4b8d-6622-08de9e4af07d
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2026 19:36:23.3260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GNuTpfyitECDtKzUjUPewo5ypaohmXdBUNbCByOhDnpbxXSvS1S3dL5q5zUesWO5gdzGZnPWW4gwHEDAwUC/bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5301

On Fri Apr 17, 2026 at 8:13 PM BST, Timur Tabi wrote:
> GA100 is a compute-only variant of GA102 that boots GSP-RM like a
> Turing, although it also has its own unique requirements.
>=20
> Now that all the pieces are in place, we can enable GA100 support.
> Although architecturally like an Ampere, GA100 uses the same GSP-RM
> firmware files as Turing, and therefore must boot it like Turing does.
> However, as a compute-only part, GA100 has no display engine.
>=20
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/gpu/nova-core/falcon/hal.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

