Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B842E8472
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Jun 2025 17:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749834208; cv=fail; b=I9Nn0V80QYQwAU+EPy4t1FjrMo635qSdPWSUTbJZOax3wst8Av6ZvXp7T3+u9XYNIBeWysmmOV94XUdiZi5FsJvVH68hJe94ZslJB9ivKvZ3DWKf5F3yHS2DrKXh8tcig0BshUIoyPW+uJ+IUWqQUHHKEQDb/KexfZOIofBg8bc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749834208; c=relaxed/simple;
	bh=qVVhkePsUOB6awgo2fOlrkzkkCOINCP9e9mO3FOdtLI=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=McRpxglNjDaa/sFZWo2Qh8mXtO6QvE6iuB2E2hce5wdb9eo0h1F6w0dnWyFRQv4ZOm+IbHQPBrEAiSMyaPioxX6n5xRXONggUaGPclc/67pmtBxnyQm4XtYSoeGc0JqvE18cfO19mZ+naPb+j2wXGVZ3V7htoqJTJPhH6pMcgRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GqSaUyEV; arc=fail smtp.client-ip=40.107.220.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GqSaUyEV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHDLaKMNwtDNqQHLqizhx3vDyi7Y0QWWdp2SypC2jfnbjbQ3l6ivhDVoqAYYSPlcpxWuGUm9sVM+YYhI0fohQYiPV0wRi3ZKmZHfNtzWqHbkqyWFuzeE+9Sdn4I54voY4bGf9akfpzWFhHr1wzMNvJ3178zZGt2olD+N2a3dIoGNpzwB9QtnSUvk6c6XNIZ/chTT0vUbzXdCYYXDh3kSpmqHmhONSy7b9Oun8XvQkEHBNyR7+PVIMWw4ZTNSK4TXsciY6pRZo/3cevLvtBJKdyVDD5JWZzJ/ZRrbon3YApbsAVogTFC+sL4nOZjEjFh1EgHa99Q//K1QGfwAIxu+2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVVhkePsUOB6awgo2fOlrkzkkCOINCP9e9mO3FOdtLI=;
 b=FXsPPWtsWNTBkMmkzNit/HvZks3CkfXo/vgp+PgmBHliZi7DEvHT0T3tlfigAtplZWbA9ClXjp88nN+2te+oMXkMT8jnppAvFUL30yoZsmXo5hckcMMEIq6zCP5ZBXp6jKnPi4Su+MnC75ST0328bbGimiJJ+OAdj7Jf1851UHD3/aBlt4MNPgSx9f0Uy459NGrl/P4kI8ZRfRoJ6wDADlK+gaPXtj47xgWX6lwUNxee2i8L2x50FuQ4LMkIukShE7VL4QZZxeHKX4p8O79TxHpE4nI9j4kV+iAK65I/Wfu5UDHiDCgJk4UkO/jyqwADAfFxy7EAwBjyBsWIiTd99w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVVhkePsUOB6awgo2fOlrkzkkCOINCP9e9mO3FOdtLI=;
 b=GqSaUyEV7/dGxWYhKKp61CbzrGPq9S4Zxr/M/fpKxYnzLQGr0WdtdAzFM9cVgdHqlU+VdnjorQcFJg4FDRgd0s8aplB/iNiIeq1u9rnNpCgu7EYaW471zaDNRtrv9hZyOHZ3APFF6isTVatvibMJRWmHkH7pKMBhZwCz6fR6GjfUXEOLpCdx6g9whEqUDPMQRGvONi749tOROzVQMUNltFEs+cu/L8B5AF4n7CuhO91gERS93AhvIHmz4SkesG/dBoEsSeoWwj20/L4LlC3emLmhHWp+OWQ8IBruyuznNO5525bb4/HqPIH+BAiDnFeWOmbM60GL5pi+4UnKSiHN8Q==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by SJ0PR12MB7008.namprd12.prod.outlook.com (2603:10b6:a03:486::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Fri, 13 Jun
 2025 17:03:24 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 17:03:23 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "ojeda@kernel.org" <ojeda@kernel.org>, "aliceryhl@google.com"
	<aliceryhl@google.com>, "lossin@kernel.org" <lossin@kernel.org>,
	"dakr@kernel.org" <dakr@kernel.org>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: introduce sfile macro for succinct code tracing
Thread-Topic: [PATCH v3] rust: introduce sfile macro for succinct code tracing
Thread-Index: AQHb2Y76GidriUYRM02FngySpVCBwLP8FOaAgAVCIIA=
Date: Fri, 13 Jun 2025 17:03:23 +0000
Message-ID: <68b469afff19b8612cd1d8502166a9c868fa8ea8.camel@nvidia.com>
References: <20250609223606.2897030-1-ttabi@nvidia.com>
	 <DAIPZJ4YMJOI.2HYMHADQG1YER@kernel.org>
In-Reply-To: <DAIPZJ4YMJOI.2HYMHADQG1YER@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|SJ0PR12MB7008:EE_
x-ms-office365-filtering-correlation-id: 4116fd37-1fa7-4715-5262-08ddaa9c3520
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UzdCTENxaFdtWEpvVCtrQS9ZMHpubHFOMWt6K011aEpMM3VMY3R6SXZTVnJW?=
 =?utf-8?B?OWdRTGV0MDVwMTlxOXZiVlVYcEZFWm1aT1lCN2dQMmovQXA0d1FkeFRpUENv?=
 =?utf-8?B?K2ZlTTFDRHgrdjk2SHRQc2hpNTdOZXRoRHZpNWhtVHp6UW5NMXdUVGlIWXU4?=
 =?utf-8?B?dFFQODk2cm9VS0lud0I2a0h2bDlhN0NXdERjNk5RZ2YyWUxSbExnMDBNaCtV?=
 =?utf-8?B?cWlteEkzWUZadWExbVhNT0htTC9PQTNkS1JpczdqendFVktiWDZoVjBwWW9L?=
 =?utf-8?B?YzRSQmM3MGlldEZNNU1xV3h4SWw2YlcrdnMyN245a0RkeFJ1MjcvNUJldFU2?=
 =?utf-8?B?RUlGanBnRlFNL2RablZmZTBIaU1FaXJSOUluaUtKTUZsVDk1cU9scjFxSmhI?=
 =?utf-8?B?dG1tamNSSzNGWjF3bWd2M012Uk9oQlpBaUJJSEhkNFFqRSt3d3lyamhvNnNU?=
 =?utf-8?B?anYybDE0MDY2amd3NFI3WTA5eHM1Ymd4RDJ4enJpUlBzV0hMVk5XZ0kyMUx2?=
 =?utf-8?B?aWgwbDVEelNHdUJsY3ZXMVlkUDJ6M3RwZ3BaMkI1WWozRnFocXoxRzJPblNo?=
 =?utf-8?B?RjB3MjUzdk9aNGdIcklwa2VTL2VueTRsVzNRQVBURkZ3S2kxeTlpWjNXNGVj?=
 =?utf-8?B?NW52U3I2b0J2VDZpbVFMRlNQa1pVRkRZazlKQzg2aVlYeGo1ZUZXcnlCQk9G?=
 =?utf-8?B?eUloWHVpZlhWZ0JLaGZ3TGRlU05DbFJKTkNwSXh2SVF5L1JYS2djMDFsekl5?=
 =?utf-8?B?K3dnMGNtZk0wVWtTOVh2dWI2SWdwM0ZCekMvaGtXZXdraG9tSTgvdVhYZW01?=
 =?utf-8?B?UFdHY3dGTXAvVThjd2I0ODF4UWo1RE9yQWZHb1JwZk1IYWJ4QWF3VXNJaDNW?=
 =?utf-8?B?QXRrNFNZT1NiL0pTaXdENU9tQnY3eDYvTGEwY0hsd3RiaHRnd21pOGo4NHc0?=
 =?utf-8?B?dHpadU1yak01L2FrWHduQ3VKczFHVEVYWWhZcW5NcHlQRXJPa21mMzR4K3Fi?=
 =?utf-8?B?NUZHeFBYenJRUGFCWUovNFNIcDNhVzdISExQUUsyZnJJaXJRRWtjU0txQjBC?=
 =?utf-8?B?LzM3QkZuM1M0aXdjSlk4Tkh2R0tZcDZ5MTQycThUT3RqK1NRWjJvbVdnd1hM?=
 =?utf-8?B?ZERIeTNMSE9nMTJWM2R2aDhnTWZpVXdXQUU5Y3I5ejJzeW8wMzBDQTBmcW40?=
 =?utf-8?B?dGk1bGtYSTZkcytoZzUwaVlGYnZOT2JrVjR3ZVg3YTUzcDUxWUZXWm5OUXdh?=
 =?utf-8?B?cnNNQnFFdkE3QW1nU0RnemxiNlhmV0tITlhZekFIK0dnK1V4UGx1Q3BaYUQy?=
 =?utf-8?B?d3hsdloyOHVteHNaaS85RG9XSDkxR1FzMXoxemVEc1B0NE41SjFjcWJULysz?=
 =?utf-8?B?RXAvaC9vSzFWYVpKYjlYU25vZmEzWWlTTVlkTG9vdFJzQ2Z1NjJ0bUFLVEJD?=
 =?utf-8?B?Y3ZNMGJMM1lQbXZiR0pUNlNPL0pTYmFnUk9aQ0NXZWdnWkowMFJBQXlENzR5?=
 =?utf-8?B?RERERXpPZEc2bFZReXl5WThuckxJUnRRRHR4am92UEwwRlQ3WHFkcmxiNmxF?=
 =?utf-8?B?MVhUdytqRGpVeHN0Q2dZemtEb2ZZWXYvQXh1dDQ1RTlMS203MkphNyt5czZC?=
 =?utf-8?B?UnFRY3VmbGdUOWxacS9wOXp6MmYvNUZnWXpMUzRkcU10UVN1dDc4WWhQTVJ0?=
 =?utf-8?B?aHRac0ZxVVBmL0hEWTlyWjRrVVB3eU9kNlYyNllSYWxuWVQzQXdBNnYya0F3?=
 =?utf-8?B?eVNaR1ErWkFLTWwyRUJQL3A4MnRMa1A3RVNzUTlldUdGbjUyOEJVK0xTU3lp?=
 =?utf-8?B?QXVoR0oxbHBBLytqZEUvb0MzQVZSWmd0YTFjSWhndHNkclFKeEJJOGwvb2s0?=
 =?utf-8?B?a1lOSXRVZUtlbi8xU3ROM2lyeUs5TVAwdjdrd3lBa1JvcmhuQzVHbldQQ1ll?=
 =?utf-8?B?VkFyTHN2KytrT1BwcXRxc3hSTC9GZnUyb0Vtb1pyVklQS0oxaU1uSFVVRnBI?=
 =?utf-8?Q?aPKd6tJoIJcjW2uqOXU3v0lrkDW3lc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6526.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?akJPbU1zblVhWGZDR2oya1NqN2t0YVVkdi9rb2h6eVVndGpYVUFvYmw5V25V?=
 =?utf-8?B?LzJVM2h0cGdnNUJsaCtBemFyRG9sNTdQMzlvTVJNMWtsSFYra2NGMWtUOGNS?=
 =?utf-8?B?OW9udmhteTVZUUhOckp3SDQrdklDUmtYQ3NxbEM4OGVXdjl4VXYrMlk2TC9s?=
 =?utf-8?B?ZnNhSlJMcCt2VllGY093cFRzQmhDZUZmcmdQSXVRUFRhaGxESWFDYUswaFd6?=
 =?utf-8?B?cEE5L0hyU2pzb0NqT24wS3ZHdEFVcUMxRGJ5V3JTVU9NZk5KdnEyMHFrU1JJ?=
 =?utf-8?B?cVFscGtrTDliZEhCSU5iZXo0dGFidC80elNzSko5TnZUNHZPUE44S0YwRUY0?=
 =?utf-8?B?VFRuUFNCU3MraExYZm5tOGgwb0Z4R2NBamMra09FbnlGVXRKakx6OUQ3SnFH?=
 =?utf-8?B?TkR1YTkvNm9nbEgxTVAza2RZOWxlV2QyQmM1SDNIQWpvdEY3elExaENGZi9y?=
 =?utf-8?B?SXpWdWRwT2FFR2szMWdGRXk4ZU0xamhPV1JBaHV3MGY2VVBNQVVySDB1WjZC?=
 =?utf-8?B?c1FnbCsxOE9pNXdzbUcxY3VjRVNZcGJUOCtyaGhMRHVRcmxiTUhCS1FXMkJI?=
 =?utf-8?B?My9NeHBGbkVKQzJwdDM2b1FmckhxMjBDU0NTNXkza1BHeHkrMG82UVRPVzlI?=
 =?utf-8?B?OVJTbmRHai8yTXR4UXhDSEQ4Z1Y5TkNqZGlKcTArdUNBUUtvRXlNZGtMblFn?=
 =?utf-8?B?SDFiQ1hKc3dNQTY5WVo2Q2p3TXkweWZ2aU4vRnFzQWZsT0RCRUtLYW5VRm9K?=
 =?utf-8?B?VnpQek5VY1A5WjhPWkkwT2tHR3cyc2FEelU3WW5TT0Y2ZUJMK1ZKVDVkM2p5?=
 =?utf-8?B?T1BuTjEzSWc4QTFEOENnektsaUZLYU9CRU9EaTBRcStzQ2hlenFUWUtJbGxt?=
 =?utf-8?B?WS9KMHB3VWp1WHIvQmtia0pGRFdqRnVZdm51K3NGaldkQ3ZBUzR4VnVydkRY?=
 =?utf-8?B?aXYwV1ZqOGRnWEhwYTlGZUFmUnRnSzFXdmxwWTAzd2xtNmpGcVo1Mm4vWVIx?=
 =?utf-8?B?dXgwbnE2dlV0WmNKWmRHVWk1V2JaQkVXUURHLzcxUk1tVkttdUNVSWg3SG1z?=
 =?utf-8?B?SDVRQ3RlRWJtV1QvTjJQVDNjdDJYYmhKTG5FSUlFS3B6REFXL3diQitHeHlz?=
 =?utf-8?B?N3M5MDZvRVBxVVdSdWlqTGprNXJld3hvYzFVcjM1VEdSSmUyQUZ1RlFPVGZT?=
 =?utf-8?B?a09DNERMTXkyL1krNDI2c3pUbElkUkF6SjcxUk1kT0tlMlBFSk54N292SEJU?=
 =?utf-8?B?c1FpNUdVeTIrWXVKRkFncUlMSng1bzlwSXM3aEZ3bDNoOXlCTGhGc3RpV3BK?=
 =?utf-8?B?MnRYRU1qMFhHc05CRTl3dlFSVnJMV1FvcmVJeUE5WENMdXB4ZksvSWN3MGxO?=
 =?utf-8?B?S3I2aE1pWXpZUDZoTUduUmtuTFZCVkQxSHh5cUdLT2h6SXVUT2ZMTnc4TjM3?=
 =?utf-8?B?eXRiOVdoVkY1NHdDS1FoY2tnRWN5cG5FMHNPY2Z6UHYwNHFWMUZleS9MU2pP?=
 =?utf-8?B?Q01ETy95VzQ1U3N0MExYNHpTNHc2VUtIek1leGRLNjFXa3JZbWRqem5kSmNO?=
 =?utf-8?B?SGZrRjNUK0dkWWFlNjNoOWZ0Y0d4OU5yamZKY0ZtOUJWQXQ0UkdEQmdpREV1?=
 =?utf-8?B?VkhPbFM4N095dmljWEFQQ0hWV1l0Q21pVjlsVzIyNG1Sbmw2aUxndGJKRXV6?=
 =?utf-8?B?QW9mM21xRERiVGZxYlE4MVlZc1hISC9RQUhEZnhrOWwrMXZUZWZ1NllhTGdm?=
 =?utf-8?B?d3ZrZEoveXpvLzJQbWpvOVE0VFN5WmN4VWdUdXNGcnVKV3k3b1NRYzM1Q1Rr?=
 =?utf-8?B?dWp6cEhrWUV2elJMTXBZWGxFanVKaGRzQUFYNThITElNWEpoZXpDMmdIQWZl?=
 =?utf-8?B?dlFiTmpONGZ1N28vNXM5VTRZZW54YmN6eDVpYUpXNjlhR1dRWVF5eW8xT1VK?=
 =?utf-8?B?KytjQlRiT1U3YlZOL09yNjZ4NVRjcFhxNFNkMjhwb2tZbTFYeEpvNFVKTG1q?=
 =?utf-8?B?dDBkVVJUUnN4ZHQ4OXlhWHdqb3owc2FGa2dKVWgwbGpCaGs5RWtIV0lPemVM?=
 =?utf-8?B?RFFzWlB6K1JJeStaOHRsZk1DM0FsbWQ2UVNQd1NMMkdlVEZUQjdaUHd5ZTlB?=
 =?utf-8?Q?Va8ivlNadYQBW+gyTZ9LC3CFV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1EA096053870174FB4FB7F2734F88034@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4116fd37-1fa7-4715-5262-08ddaa9c3520
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2025 17:03:23.9039
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1cufMKiMz/BZVQ1zz49w8kIhAsldxQJxAfOE0+vAe/SNqAFxQYKIQmdizPWn+8wn5hvKsT4U2eQPI4RHZvfyHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7008

T24gVHVlLCAyMDI1LTA2LTEwIGF0IDEwOjQ1ICswMjAwLCBCZW5ubyBMb3NzaW4gd3JvdGU6DQo+
IEFub3RoZXIgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoaXMgYW5kIGBzdHI6OnJmaW5kYCBpcyB0aGF0
IGBzdHI6OnJmaW5kYA0KPiB0YWtlcyBhbiBgaW1wbCBQYXR0ZXJuYCBhbmQgbm90IGEgY2hhci4g
QWRkaXRpb25hbGx5LCBJIHByZXN1bWUgdGhhdA0KPiBgc3RyOjpyZmluZGAgaXMgbW9yZSBlZmZp
Y2llbnRseSBpbXBsZW1lbnRlZCAoYXMgaXQncyBtb3JlIGNvbXBsZXgsIHNlZQ0KPiBbMV0sIGJ1
dCBJIGRpZG4ndCBiZW5jaG1hcmsgdGhlIHR3byB2ZXJzaW9ucyA6KS4NCj4gDQo+IFsxXTogaHR0
cHM6Ly9kb2MucnVzdC1sYW5nLm9yZy9zcmMvY29yZS9zdHIvcGF0dGVybi5ycy5odG1sIzQ3OA0K
DQpJJ2xsIHJld29yZCB0aGUgY29tbWVudHMuDQoNCj4gDQo+ID4gKyNbaW5saW5lXQ0KPiA+ICtw
dWIgY29uc3QgZm4gcmZpbmRfY29uc3QoaGF5c3RhY2s6ICZzdHIsIG5lZWRsZTogY2hhcikgLT4g
T3B0aW9uPHVzaXplPiB7DQo+ID4gK8KgwqDCoCBsZXQgYnl0ZXMgPSBoYXlzdGFjay5hc19ieXRl
cygpOw0KPiA+ICvCoMKgwqAgbGV0IG11dCBpID0gaGF5c3RhY2subGVuKCk7DQo+ID4gK8KgwqDC
oCB3aGlsZSBpID4gMCB7DQo+ID4gK8KgwqDCoMKgwqDCoMKgIGkgLT0gMTsNCj4gPiArwqDCoMKg
wqDCoMKgwqAgaWYgYnl0ZXNbaV0gPT0gbmVlZGxlIGFzIHU4IHsNCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gU29tZShpKTsNCj4gPiArwqDCoMKgwqDCoMKgwqAgfQ0KPiA+ICvC
oMKgwqAgfQ0KPiA+ICvCoMKgwqAgTm9uZQ0KPiA+ICt9DQo+IA0KPiBUaGlzIGZ1bmN0aW9uIHNo
b3VsZCBub3QgYmUgaW4gdGhpcyBtb2R1bGUsIGBzdHIucnNgIGlzIHByb2JhYmx5IGENCj4gYmV0
dGVyIHBsYWNlIGZvciBpdC4NCg0KSWYgSSBtb3ZlIGl0IGludG8gc3RyLnJzLCBhbmQgSSB0YWcg
aXQgd2l0aCAjW2lubGluZV0sIHdpbGwgaXQgc3RpbGwgYmUgaW5saW5lZCB3aGVuIHVzZWQgaW4g
dGhlDQptYWNybz8gIEkgY2FuJ3QgZmlndXJlIG91dCBob3cgdG8gdGVzdCB0aGF0IGluIGdvZGJv
bHQuDQoNCj4gPiArLy8vIFJldHVybnMganVzdCB0aGUgYmFzZSBmaWxlbmFtZSBvZiB0aGUgY3Vy
cmVudCBmaWxlLg0KPiA+ICsvLy8NCj4gPiArLy8vIFRoaXMgZGlmZmVycyBmcm9tIHRoZSBidWls
dC1pbiBbYGZpbGUhKClgXSBtYWNybywgd2hpY2ggcmV0dXJucyB0aGUgZnVsbA0KPiA+ICsvLy8g
cGF0aCBvZiB0aGUgY3VycmVudCBmaWxlLg0KPiA+ICsvLy8NCj4gPiArLy8vIFVzaW5nIHRoZSBi
YXNlIGZpbGVuYW1lIGdpdmVzIHlvdSBtb3JlIHN1Y2NpbmN0IGxvZ2dpbmcgcHJpbnRzLg0KPiAN
Cj4gSSB3b3VsZCByZW1vdmUgdGhpcyBzZW50ZW5jZSBvciByZXBsYWNlIGl0IHdpdGggc29tZXRo
aW5nIGxpa2UgIlVzZWZ1bA0KPiBmb3Igc3VjY2luY3QgbG9nZ2luZyBwdXJwb3Nlcy4iLg0KDQpP
ay4NCg0KPiANCj4gPiArLy8vDQo+ID4gKy8vLyAjIEV4YW1wbGVzDQo+ID4gKy8vLw0KPiA+ICsv
Ly8gYGBgDQo+ID4gKy8vLyB1c2Uga2VybmVsOjpzZmlsZQ0KPiA+ICsvLy8gcHJfZXJyISgie306
e31cbiIsIHNmaWxlISgpLCBsaW5lISgpKTsNCj4gPiArLy8vIGBgYA0KPiA+ICsjW21hY3JvX2V4
cG9ydF0NCj4gPiArbWFjcm9fcnVsZXMhIHNmaWxlIHsNCj4gPiArwqDCoMKgICgpID0+IHt7DQo+
ID4gK8KgwqDCoMKgwqDCoMKgIHVzZSBrZXJuZWw6OnByaW50OjpyZmluZF9jb25zdDsNCj4gDQo+
IFBsZWFzZSBkb24ndCB1c2UgYHVzZWAgaW4gbWFjcm9zLg0KDQpBZnRlciBtb3ZpbmcgcmZpbmRf
Y29uc3QsIGl0IHR1cm5zIG91dCBJIGRvbid0IG5lZWQgdGhlIGB1c2VgIHN0YXRlbWVudCBhbnlt
b3JlLCBidXQgSSBkb24ndA0KdW5kZXJzdGFuZCB3aHkuDQoNCj4gPiArDQo+ID4gK8KgwqDCoMKg
wqDCoMKgIGNvbnN0IEZJTEU6ICZzdHIgPSBmaWxlISgpOw0KPiANCj4gSW5zdGVhZCB1c2UgYWJz
b2x1dGUgcGF0aHM6IGA6OmNvcmU6OmZpbGUhKClgLg0KPiANCj4gPiArDQo+ID4gK8KgwqDCoMKg
wqDCoMKgIC8vIFtgLmFzX2J5dGVzKClgXSBkb2VzIG5vdCBzdXBwb3J0IG5vbi1BU0NJSSBmaWxl
bmFtZXMNCj4gPiArwqDCoMKgwqDCoMKgwqAgYXNzZXJ0IShGSUxFLmlzX2FzY2lpKCkpOw0KPiAN
Cj4gQWxzbyBoZXJlLg0KDQpMaWtlIHRoaXM/DQoNCiAgICAgICAgYXNzZXJ0ISg6OmNvcmU6OkZJ
TEUuaXNfYXNjaWkoKSk7DQoNClRoaXMgY29tcGlsZXMsIGJ1dCBpdCBzZWVtcyB3cm9uZy4NCg0K
PiANCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKgIGxldCBzdGFydCA9IG1hdGNoIHJmaW5kX2Nv
bnN0KEZJTEUsICcvJykgew0KPiANCj4gQW5kIGhlcmUgYDo6a2VybmVsOjpwcmludDo6cmZpbmRf
Y29uc3RgIChtb3JlIGJlbG93KS4NCg0KRXZlbiB0aG91Z2ggSSBkb24ndCBuZWVkIHRvIGRvIHRo
aXM/IFRoZSBjb2RlIGNvbXBpbGVzIGZpbmUgYXMtaXMuDQoNCklzbid0IHRoZSB3aG9sZSBwb2lu
dCBiZWhpbmQgYHVzZWAgc3RhdGVtZW50cyB0byBhdm9pZCBkb2luZyB0aGlzPw0KDQo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgU29tZShzbGFzaCkgPT4gc2xhc2ggKyAxLA0KPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIE5vbmUgPT4gMCwNCj4gPiArwqDCoMKgwqDCoMKgwqAgfTsNCj4g
PiArwqDCoMKgwqDCoMKgwqAgbGV0IGVuZCA9IG1hdGNoIHJmaW5kX2NvbnN0KEZJTEUsICcuJykg
ew0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNvbWUoZG90KSA9PiBkb3QsDQo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgTm9uZSA9PiBGSUxFLmxlbigpLA0KPiA+ICvCoMKgwqDCoMKg
wqDCoCB9Ow0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqAgLy8gVGhlIGZvbGxvd2luZyBjb2Rl
IHRoZSBlcXVpdmFsZW50IG9mICZGSUxFW3N0YXJ0Li5zdGFydCtsZW5dLA0KPiA+ICvCoMKgwqDC
oMKgwqDCoCAvLyBleGNlcHQgdGhhdCBpdCBhbGxvd3MgZm9yIGNvbnN0IGNvbnRleHRzLsKgIEZv
ciBleGFtcGxlLA0KPiA+ICvCoMKgwqDCoMKgwqDCoCAvL8KgwqAgY29uc3QgU0ZJTEU6ICYnc3Rh
dGljIHN0ciA9IHNmaWxlISgpOw0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqAgbGV0IGJhc2Vf
cHRyOiAqY29uc3QgdTggPSBGSUxFLmFzX3B0cigpOw0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKg
wqAgLy8gU0FGRVRZOiBXZSBrbm93IHRoYXQgYHN0YXJ0YCBpcyA8PSB0aGUgbGVuZ3RoIG9mIEZJ
TEUsIGJlY2F1c2UgRklMRQ0KPiA+ICvCoMKgwqDCoMKgwqDCoCAvLyBuZXZlciBlbmRzIGluIGEg
c2xhc2guDQo+IA0KPiBJIGRvbid0IHRoaW5rIHRoYXQgd2Ugc2hvdWxkIHJlbHkgb24gdGhhdCBm
YWN0IGZvciB1bnNhZmUgY29kZS4NCj4gDQo+IFRoZXJlIGlzIGFub3RoZXIgYXJndW1lbnQgZm9y
IGBzdGFydCA8PSBsZW5ndGhgOiB3aGVuIGByZmluZF9jb25zdGANCj4gcmV0dXJucyBgU29tZShy
ZXMpYCwgdGhlbiBgcmVzIDwgbGVuZ3RoYC4NCg0KSSB0aGluayB0aGF0IGNvbW1lbnQgaXMgc3Rh
bGUsIHNpbmNlIGl0IHdhcyB3cml0dGVuIGJhc2VkIG9uIHRoZSBvcmlnaW5hbCBjb2RlLiAgSSds
bCBmaXggaXQuDQoNCj4gPiArwqDCoMKgwqDCoMKgwqAgbGV0IHB0cjogKmNvbnN0IHU4ID0gdW5z
YWZlIHsgYmFzZV9wdHIuYWRkKHN0YXJ0KSB9Ow0KPiA+ICvCoMKgwqDCoMKgwqDCoCAvLyBTQUZF
VFk6IFdlIGFsc28ga25vdyB0aGF0IGBlbmRgIDwgdGhlIGxlbmd0aCBvZiBGSUxFLg0KPiA+ICvC
oMKgwqDCoMKgwqDCoCAvLyBJZiBgZW5kYCA8IGBzdGFydGAsIHRoaXMgd2lsbCBnZW5lcmF0ZSBh
IGNvbXBpbGVyIGVycm9yLg0KPiANCj4gTm8gaXQgd29uJ3QgZ2VuZXJhdGUgYSBjb21waWxlciBl
cnJvciBpZiB1c2VkIGxpa2UgaW4gdGhlIGV4YW1wbGUsIGl0DQo+IHdpbGwgcGFuaWMgYXQgcnVu
dGltZS4NCg0KV2VsbCwgaXQncyBzdXBwb3NlIHRvIGdlbmVyYXRlIHRoZSBiYXNlbmFtZSBpbmxp
bmUsIHNvIHRoYXQgdGhlcmUgYXJlIG5vIHJ1bnRpbWUgY2FsbHMuICBPdGhlcndpc2UsDQpJIHdv
dWxkIG5ldmVyIGhhdmUgaGFkIHRvIGNyZWF0ZSByZmluZF9jb25zdC4gIA0KDQoJcHJfZXJyISgi
e306e31cbiIsIHNmaWxlISgpLCBsaW5lISgpKTsNCg0KVGhpcyBpcyBzdXBwb3NlZCB0byBiZSBp
bmxpbmUuICBIb3cgZG8gSSBnZXQgdGhlIGtlcm5lbCBidWlsZCB0byBzaG93IG1lIHRoZSBnZW5l
cmF0ZWQgYXNzZW1ibHkNCmxhbmd1YWdlPyAgQWxsIG9mIG15IHRlc3RzIGluIGdvZGJvbHQgc2hv
dyB0aGF0IHRoaXMgY29kZSBpcyBhbHdheXMgaW5saW5lIGFuZCB0aGUgY29tcGlsZXIgbm90aWNl
cw0KYmFkIHZhbHVlcyBvZiBzdGFydCBhbmQgZW5kLg0KDQo+IA0KPiBNYXliZSB3ZSBzaG91bGQg
bWFrZSB0aGlzIG1hY3JvIHJldHVybiBhIGNvbnN0IGJsb2NrPw0KDQpZb3UgbWVhbiBsaWtlIHRo
aXM6DQoNCiAgICAgICAgY29uc3QgQkFTRU5BTUUgPSB1bnNhZmUgeyBjb3JlOjpzdHI6OmZyb21f
dXRmOF91bmNoZWNrZWQoc2xpY2UpIH07DQogICAgICAgIEJBU0VOQU1FDQo=
