Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011061.outbound.protection.outlook.com [40.107.208.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C0F316905
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Jan 2026 00:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769820710; cv=fail; b=TDbiREkau5GhzCnes2u1fwkd5GWvX3Nk55kBiqPpJPghlfRvYxqeUadoOxL9H/PYXedsQ3dpW7Lh1qb4u054LDAovm0ZBDSwhIYs5zOMVAdkv5jY7dxMglqsASu0OiXdvi2pbnwh/RPVwGh0J2EKocT7tMbp1xM3KG1LcFC1leE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769820710; c=relaxed/simple;
	bh=dHBSey+kt3kbZzOMXYZr915Njw+tSJSG/aRDHlboUZ8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jBSMhmDNlr5fqxILoeG3DXHInm5iTlMkSqnaO1tdCXySt8Jp8mwjb2WgblZy9dnzmByxFbVaGD2SvyORnYX8cIY/JVaguZNqFxw9T8D+NoUbxxOhzID0GTf6GcsYZoQBQidn04KvJJA8+xLyi77Sz/0uy21EEGU28wbJglJTFc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SgyMF5Bz; arc=fail smtp.client-ip=40.107.208.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SgyMF5Bz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U/5Y8Aciv/73cGJG+1g5f99YlpqpTvz7s1ZHxGU4zheTq3cjGKtN3IOKkQMHc2Xa/tBuUqqQ2XlVW7Sa9ryuT6dHhHaCVPmLJYW01grkX+49Ftdg6qCgqpp3sEfkm94wcvobw9ZeU88YCzH+yLdQRTZHJ1/fRf/2tteT+bbGmUevKSgEXomawBCDeMEMNGxblRGraeYtKUqu8kvcI2G2dIlEi/H1HR4e/mLRXkVqoozS5xjIiOFlzNjHJCpmaGFL6pivmjJpOIKZ7Ssx4zWQvbOIdvEys2X7M+N1xdw2FdXGr5HaA5QxcDqAmEmNpy9ZoMakdKukJJXc8HfLP2UUlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHBSey+kt3kbZzOMXYZr915Njw+tSJSG/aRDHlboUZ8=;
 b=fTbfGsOnVG/OB3I6j8DfU4uF9VzNiLZmA1yjdhEQAeTOViIgXTOeMbmpeLVspZchhQOslE+PgSybKbajzjwRvyGl1L879YYi8H9AF45Apz4wbSUasN7J9+eRTQfSsvvTV2GDvZzUkiWzBRx3U+LFViKcVkLrUd8rSXome4Tboc89r6/WHgBQWwaP3nD7zljOKR9Qplzk30KdIkkz1bKU7RFpz0W+KGekBpX5CH9SsIzsvcu1yZoKc18uRBTVYfwGnftOLKRy43rFfVHpHR9BdP94T0Fm6YjB2J21LNfAy9OtxHVJKJg2pGRWEsX2tJow2fMgAO+HLB9v6VzxgfryqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHBSey+kt3kbZzOMXYZr915Njw+tSJSG/aRDHlboUZ8=;
 b=SgyMF5BzSEsXByZ/3C1QNb9CK33Y5SQ+AbQh4Tb4MRXvbWsOp20fgwheDEh5UNqhzlEJyzEKVqa+RQF1zf8YVoP7HfDtZGNealzzAh6ChK5SUHEQdNmCPA8Ef5MKJ1aK5ZwLW88wF2ebK1L+lFZ176gvpvqUp0vQOoRSERFJzFD7UfXlVYpsfVY3Eq7jKF9mQrW2/ouwQwCL8ImkunrQ7UXpS6KvoK7D/UGSWwOkgYvjKrgvpwS4Opx9m4EyS5DKU6K22S9hJfEfKXFX6R5IYI4ULP840ZvG2d8GbGqGw2OCmvbaNeAoPa7MKPby7Lc5VI4yOuE8P/uUlAfsB5oOYg==
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by SN7PR12MB8771.namprd12.prod.outlook.com (2603:10b6:806:32a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Sat, 31 Jan
 2026 00:51:45 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::9000:13bc:9fe:4591]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::9000:13bc:9fe:4591%5]) with mapi id 15.20.9564.010; Sat, 31 Jan 2026
 00:51:45 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>
CC: John Hubbard <jhubbard@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
	"mmaurer@google.com" <mmaurer@google.com>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>, "nouveau@lists.freedesktop.org"
	<nouveau@lists.freedesktop.org>, Joel Fernandes <joelagnelf@nvidia.com>,
	"aliceryhl@google.com" <aliceryhl@google.com>, Alexandre Courbot
	<acourbot@nvidia.com>
Subject: Re: [PATCH v6 7/7] gpu: nova-core: create GSP-RM logging buffers
 debugfs entries
Thread-Topic: [PATCH v6 7/7] gpu: nova-core: create GSP-RM logging buffers
 debugfs entries
Thread-Index:
 AQHckMcO0eg+xcWa9EK4OKU7tGQKjrVrYNaAgAAGTICAAANhgIAABHwAgAACZwCAAASVAA==
Date: Sat, 31 Jan 2026 00:51:44 +0000
Message-ID: <f22ec3f562691343190d0fbe74f603168eb7e1f1.camel@nvidia.com>
References: <20260129022837.4133832-1-ttabi@nvidia.com>
	 <20260129022837.4133832-8-ttabi@nvidia.com>
	 <95b913a1d344f603d17abc7f6d78da166068bc91.camel@nvidia.com>
	 <DG2BY691US2F.36NWWJ18OPTBP@garyguo.net>
	 <DG2C7G44QD5C.BY4U4HG7XBJM@kernel.org>
	 <f723d517b943b9f4c10764daee9ff711e15b6834.camel@nvidia.com>
	 <DG2CQBAM6SG8.1116LCW3IIT3N@kernel.org>
In-Reply-To: <DG2CQBAM6SG8.1116LCW3IIT3N@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR12MB9815:EE_|SN7PR12MB8771:EE_
x-ms-office365-filtering-correlation-id: ed75b82c-651f-413f-076c-08de6062e813
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?SlJoa1FmUFBaaERzVlpvaW9lbHY0NmhyZWJWOWtQcklRVHk1Z1RxbzFrYkFp?=
 =?utf-8?B?WGE3aE84cWJYMzlmMHJ0dGN6TFFIZHhkSStaM0wwSjZNY1RzUmI2eFVKTjFD?=
 =?utf-8?B?Z2VscFQxQ1hqZUk5WGtObmFtdkQ0dVMvVG5FekZFY0oyNWE2NXkvMHRQc0tC?=
 =?utf-8?B?eWI0TEk5aDN1WlFaSHdBSDBmK3kwZktVNTg3dDV0cGIxZkdWUVFRNmcrcS9t?=
 =?utf-8?B?SitRZUt1ZFVZZ21ObjBkT3NuNGdqQXl3bkViNVZnbWNVL0s0THFjcnlObWRM?=
 =?utf-8?B?SWkwQUw0cTZkeGR3bjJYdmwvbG1ka2V5OGRnRGkxMVRuRGh6S082UmlnTFRo?=
 =?utf-8?B?dDMwZVhueUpIZU9vNFpzaWVrcmt0Y3NGNUlYM3R5Zk9HMXJKdks5dnNtTVRR?=
 =?utf-8?B?ODFYRjZSS05lbCtDc1M0Q1NFNjhYRCtBRmJ3MXpWZmUwamZmOHd6dlY3amdr?=
 =?utf-8?B?dTd1d21PU3RMOEV0SFAvdnVBNmh2T3F0MUVBdjZlOFZobTMwaTdQR204ZVEy?=
 =?utf-8?B?OUNGeUZLa2wzSFZJS2ZiOFlzaEtmQVJqWFd2dWhueStET2NwNE9ISVo3VVg3?=
 =?utf-8?B?NGMwR2l3REd4bWRCNmwwWmhXMTdPWEt4TW1qVXkyaElPL1lYSmVaLzNzb085?=
 =?utf-8?B?R0JRd1hMem4vYVorODREUW5MMjVvZGQ1cFpSQlhycFM1L2F6aE5FTmlNZy9n?=
 =?utf-8?B?VFMrZEM1a05yMHZSY1pZTkRwaHNBcUZTVUJpWkVtM1dHcjFzZnR4VHBqM1k1?=
 =?utf-8?B?UXphMDFnaFhVMnVhc05Qd1pFampqdzFrV011STZrMFRwelpQTHozRzAzSjBx?=
 =?utf-8?B?QzRCZGh6YndHZTJkU0Jzd1J1WlVTRSs3R0VTajlCYW4rcU5kb1FWc0FicmpD?=
 =?utf-8?B?QUc3alFqYnlBQ3BIRzlTRTdKd1cyNkluanNISXFaeE9WbEZzb3lDVkZqT1Jh?=
 =?utf-8?B?eWpDQjRmNTdxM2M0VjIway9ydkh0RUJWak5sbCtrcEd4Nm5ndUNsTDZxa2ZY?=
 =?utf-8?B?KzZ0QWZ2RjdsSDBtN05keGFBU2RsdHdZUWVabm1lMnk3dUg4SEk1Wk1Mc01Y?=
 =?utf-8?B?cW9qZ0lNWldaMDkzdjZlYmFFK2dnb3c2N29HQnNadkU1RzBwSnNTLzZGMjZy?=
 =?utf-8?B?OWFFaDF0aUdGVTRub2ZCUnpFUzBtT0pyamk3dVFTNTR4VTZGSGx0U3RLNzV6?=
 =?utf-8?B?cUhMWHcrMG1RM3o5TTNiUjhoUDdsM0JDcktBa01VbHJNdVNLMVRkek9uOXhL?=
 =?utf-8?B?d3VPSzlIcjRWamRWclhxVnErNlRnS28yb0swRWIrNXBMaldMcjJpa3BPeXp4?=
 =?utf-8?B?Mm1aVzR0M1RWbDl0ZFlDd0V2SlE1akRoN2JTZUpoQnZjSUE5c0dvcWFaejFD?=
 =?utf-8?B?REhaSmo3NEZMdDVqaEp4VWpnRUR0R1VkSTZDTWZYMDEyRTFYdFJQMmpwQWFV?=
 =?utf-8?B?VXVZcTF6b0VVcmpYMjIxblU1Tyt3eWpOdk8vS2tQU0o5VUV3b3pTVEFxd1FO?=
 =?utf-8?B?YTlyUHhKTnJRNDlHeWVxeGIwN0ZTWHJ5WDJJSFZnRkI1Y0hwbmNTbGhIMDJI?=
 =?utf-8?B?MlQ4LzdqMmcrZ0laNGlFT2ppREJYejRSRHNTQmx1U1pycnJxcGpib3QvTTk1?=
 =?utf-8?B?Umk3Qzk0K1c1N091c1hJdSsvejgzbEVnbkdKMWlYcWZhaVkwMXBZZndzK0Uv?=
 =?utf-8?B?SWpKcWdVSlR3eGtrUkg4eFdkMVlrdDMvbGpLK2VjelBidytTeU9EY0c0Uzgw?=
 =?utf-8?B?WjNFMi9yQUNKeWx2NEdPUG56bDZNbXpYNGJqUWhFTUtoNXdKRGZTWklqOE0x?=
 =?utf-8?B?aE5rUFA5UHBCU0RmemcyMVB4K3ZleUtOUTJSdHRYM1dhd3Zmb2FSSEZsdXVT?=
 =?utf-8?B?YnNpR0l0OFpQVTZtS0F4RW44YjJuK2UvRTZhNUhUZFBsbE04Tkl6cE96ZW83?=
 =?utf-8?B?RFNmNmRkczVtaTNaenFQb1dMTFBvWUN3NUxMbGR6eVdRYTRlNThmT3RUWjk5?=
 =?utf-8?B?SlI5MGdTMDRlMjVJaHRSMXh4R0lzTTRET3MvY1c0cnMzNEdHSGtoYjJBSWk3?=
 =?utf-8?B?WW5hUkRDTUhKNGpZVWZUSmFHaDZ1OWFKNzRua0xsU0UrTHZmMzNqSUo1dTY3?=
 =?utf-8?B?TDJ0WGlScndMU1VnQTh1S1pLbjJVWlZVR2k4WHJpT29XOU01NFZsNTMvRU9J?=
 =?utf-8?Q?ykT59lsmrx9jZ7jMbXVCRkY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aUkzT1FOcFp5cFpkL29VWVJNNmdqc0JKclBTWE9hSTBNVFFpM0pjWjg2YzF6?=
 =?utf-8?B?Wlp5alpDejM2Mm1sWnVCWHh5OVdXd1V6R2VDYjIvdENQN2FQU2U2UWx3b3dF?=
 =?utf-8?B?NERaUVRuZDhnRXl2U2gyM3E3ZnF5aEp6OVNhQjZ3WlBmUFJRZXJZTk43eldp?=
 =?utf-8?B?V0tIOXhQOGptd3FFcm81M0lueVB1ZXJGVkYxcVVzaWloaHltd1U3VGYzb1FX?=
 =?utf-8?B?TS9wYVFKRE8xS1FETkdTQ3RRazdTd0NFdlRWYkhFbDVmVit2b3JZWXMwcElO?=
 =?utf-8?B?amprcmVkRzZoV2Q2bkJzQ3MwL0xETW5VTDNZRGlEZ05mV1BERFBLWjFxRGs1?=
 =?utf-8?B?Z3FvMzd5N3ozZTNwTCtJei9kRGFraFNnMHFCZ1NETmZVeE9qeExFTkVIRVRQ?=
 =?utf-8?B?OTRzWHZIVFVZdVErQnBwNkxaamliaTN0QmZaZ1QwNzg0VWQ1Y0hyUUVHTVhK?=
 =?utf-8?B?clNQeDZyZzRLL2FGTDFwb1lGNlExNm1KWGhGZTl0T2NRL243c3Q2dmprYWhW?=
 =?utf-8?B?dmZINEdBNGQrY1ZibGlMd1BkL3hQTUd0bmVpTmRHeFErMWdGSGQvVnRrZnhK?=
 =?utf-8?B?c2dxUllnQWJFUUVHME9YdGVESjVXR0VhR1N6QWxydmtOajRSaSsyVXNNMGox?=
 =?utf-8?B?SVFHSjBYRytwN2lUZ2luc0xNelI4UGxLTUhYa0NFTTdTemtWeWY3NTd1bmJu?=
 =?utf-8?B?aTUyZ0NueHhzR0ZzdnY4YWlRbE9SbElFdzZIQzhWVjd6SGRPMEYzODVCUU5h?=
 =?utf-8?B?bzRhdVpmdjJQRmlUSFZlQlhUWW9FZkMxQWZORWJBSWxTbk9xZDQwRWphc3Ir?=
 =?utf-8?B?d1JjRTBuWjVNWjMvYmp5Yms0OXRtMStiKzJ6RVd4cVp5TkFzNENRNXlaQnVL?=
 =?utf-8?B?Sk85YWVDRk9ENkNVN2UvK29lTVpveUtCb05HbGNUWnJVTmlTajhIdDMrdjBO?=
 =?utf-8?B?cEFNK1d0cDErQW9EZVlaWXArNzczaXcydWJtbktWZFdwdVEydVc5MHQxNTRr?=
 =?utf-8?B?R3h3TXQxdXBQMnRyRU9NT2w1L3BGQmJDZlhGWW9iNXBWaEluNDdJeHR1WGMr?=
 =?utf-8?B?ZEtuT1laTHFuWEFXUytTdDdRWFdZMVZlYXY0dFhnYW5Yd2VYVitLVjNXdkQ5?=
 =?utf-8?B?cU5qZGFadWNqR1R0ZXdjN2ZQdWhpUmlIQWw1UVlRdHArSDgxQkxnV2l4Zk1C?=
 =?utf-8?B?eEtjNUtqYSs2ZnhWbHFNRTlOR0M3enpOSEtkKytyNjd0MU9ZUzNUNDVZZ1VL?=
 =?utf-8?B?Vm05UkljNlA0S1R1bG4zdzJGZjhxWUR3TllDTElIS1dkUTFMRUEydnpORW1W?=
 =?utf-8?B?RzUxcDlWRDIwSkcvR1lhMjhIeUZ4UjIzZjF6Zm9iWTYwTVRZSHBBTUNjQlhl?=
 =?utf-8?B?TVBpNUY1ZUxnWHhlRmdoS0lzU1FaVzZRVFBsSGFtZm1DRUZRdlI5a3EyWW1j?=
 =?utf-8?B?cFJ4ckJLN2JpTEw3M2NSdm5hTWppLzE1K3B0b0pOVTFzQmowelEzSGFSVEsy?=
 =?utf-8?B?akNhV2QwVmRUbnlsaTQyMnhSYmNCWTY5MTZJb2syZWpTYWExalpoMTVjQVBJ?=
 =?utf-8?B?ZXNBRnZvQ1N1bmJEWHVPVm10Q0U1eDVSbkFNVFIycjhKVFM3OThYaEgzSitX?=
 =?utf-8?B?RmtzbVcwcllyOW9zVjcxMVFNeGNaYnBKV3ZtclRacHFIUlJidytmc0s2bllu?=
 =?utf-8?B?MGhUK2hLWDh5OXladzJOMHFWdkdIZVBnYzNKbG9zN0RsV3RiU0Y4akdzeUJn?=
 =?utf-8?B?Z3BJYm9uMmkwU0Q5RVZKeWVydk03ZE0zUE1JY29NREJpdHJJdjFnM0wycHlx?=
 =?utf-8?B?WEJWNmtHcFBGUVRQSzVwWU9uT2ZKVWtka0Y2V3JIVTBmclQxTmUwbWdsaTNS?=
 =?utf-8?B?MWFJVWZFa2Q5RjFoaU5sSDk5V0Z2NFBJYVQzL2lUUG4xSURueFBpY3NjemRl?=
 =?utf-8?B?ZklDWlZTSkhFWTZLcWpSRVZSUU5yTlFUQ1BXdHlDeFc4NDZzbk1aenhYSitK?=
 =?utf-8?B?MkVkTzFIYUYxRGw5SHdmWWUrWVlCRGMrWnIwUDZLbS9xdDNtK3drMUMxb0Z5?=
 =?utf-8?B?QkVhbHpVK0hNYUxUeFdoNEk2K25CMGhka256S1RyeFFINDErYytWQ25aM1da?=
 =?utf-8?B?WFZLekZNMGtVcldUYmtQbUFXZjNzN1d0MkJON3JXeUcrM3psRHdJMU9SUTU3?=
 =?utf-8?B?M1FydDRoSXJGSzZkdFBsUTN2TlJYMDVZSVdQY1kxR3dFR2xUNFdIWnVVclpq?=
 =?utf-8?B?WHJVSmJQR3R5TVQxL2FyaTBKZkd2WFoyL0NqZEJnQjVWanRKTEsrY3VTVlJ4?=
 =?utf-8?B?K1ZTOHoydkF3ZG92Z2NBYVFqMWRPMFh3NGJaZDQxemR1UmNYVnBEUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9116748BE53AEA4A973C4D73A51E92BD@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR12MB9815.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed75b82c-651f-413f-076c-08de6062e813
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2026 00:51:44.9139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Iy9MW/B/enJQqFrDj+5pE8VRxQWVmNDTLSJ1JEzYt9q8eg+n9bU8VJz4Wt/Apng0tiLEkpTZIsHxv02SplOMyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8771

T24gU2F0LCAyMDI2LTAxLTMxIGF0IDAxOjM1ICswMTAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiA+IERhbmlsbywgSSdtIGNvbmZ1c2VkLsKgIFlvdSB0b2xkIG1lIHRvIGFkZCB0aGlzIEtj
b25maWc6DQo+ID4gDQo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcnVzdC1mb3ItbGludXgv
REZSNlJXUk9XQllBLjFROUpLSDhVRFNYT1hAa2VybmVsLm9yZy8NCj4gDQo+IE1heWJlIGEgbWlz
dW5kZXJzdGFuZGluZyBkdWUgdG8gbXkgdHlwZT8gSS5lLg0KPiANCj4gIkkgdGhpbmsgaXQncyBP
SyB0byBhbHdheXMgaGF2ZSB0aGUgZW50cmllcyBvbiBrZWVwaW5nIHRoZW0gYmV5b25kIGRldmlj
ZSB1bmJpbmQNCj4gaGFzIHRvIGJlIGJlaGluZCBhIEtjb25maWcgb3B0aW9uLiINCj4gDQo+IHZz
Lg0KPiANCj4gIkkgdGhpbmsgaXQncyBPSyB0byBhbHdheXMgaGF2ZSB0aGUgZW50cmllcywgb25s
eSBrZWVwaW5nIHRoZW0gYmV5b25kIGRldmljZSB1bmJpbmQNCj4gaGFzIHRvIGJlIGJlaGluZCBh
IEtjb25maWcgb3B0aW9uLiINCg0KTE9MLiAgT2ssIEkgd2lsbCByZW1vdmUgdGhlIEtjb25maWcu
ICANCg0KSSBoYXZlIG5vIGlkZWEgaG93IHRvIGFkZCBzdXBwb3J0IGZvciBrZWVwaW5nIHRoZSBl
bnRyaWVzIGJleW9uZCBkZXZpY2UgdW5iaW5kIGluIE5vdmFDb3JlLiANClRoYXQgY29kZSBpbiBO
b3V2ZWF1IHRvb2sgbW9udGhzIHRvIHdvcmsgb3V0LCBhbmQgaXQncyBzdGlsbCBoYWNraXNoIGV2
ZW4gYnkgQyBzdGFuZGFyZHMuDQo=
