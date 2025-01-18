Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021141.outbound.protection.outlook.com [52.101.95.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE51C8C7;
	Sat, 18 Jan 2025 00:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737161092; cv=fail; b=GDAAWXUF+KSQwAKjZOxK62fsD+cpy0aGuLaaNBS2P3FYcbAk7RUjAmESwejMTz+UCW9KZAyQOX+9rwQI0cGRgWdgN+WK77ON+aLGCVDxlNC1Rlsvz6t/awGG1VZtmCrZxwhqnk0kIgi6M6sFttF0Y56b7lhsAYqVH7oqCt8WyAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737161092; c=relaxed/simple;
	bh=5n98AQbTPdF9KJGuQ5slLCMnZgtNVO48k7hfsi2z1r4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JjOZXRk6npEQfVWoQz/AmoHY/caPkpSf+fw0EH7DPzt87LrvfDQjX5LDRYrHBJt6n0xdfrrvGFpEdRxnB/sAd4gBfmZT0HBTJBlScVnLBwdzss9DOgoQUuXV3LU1pYzUPmeWH/j+QZYswfoWe9G2u8BeumK45rL5BdexH/gCTdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=iyCH4YYJ; arc=fail smtp.client-ip=52.101.95.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="iyCH4YYJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JefcPomNIhI7covUZVnqY9wl4tL/k3c1reiFOrD5Bl+yd9m5ffSTSemJU0peASvcDIE34olLpP/8yRsYv605PK1ADsJM2tkZbZPl5VIKVzC8ZaQMFiO4ENmIy/bxpDLEyuAA/Ub7R3gf6tiZxrdT8zj/+Q4QZVe33uJ5h7g0aCopOGtfk5+zJjP6LA7y5ky5X6JaeZn/N+roFtZsSWLGMy4OBpZG4EKur3gw7OiJ40AWdb3rf+5x4nDNqhs0gJKxFuD0YIQrXvHvgYcVjEK1VOL5I9A2wO03UVklAymHYb/CzipIny981tQYeFRn/315tdUZdqBPGpSRdQhxkPBSuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kZpWgH5WqJM8oC/a/ElFCydSbscWkXTebHg87hfxIU=;
 b=jfZ0oVX9A8LMQqFRRHJQWYnzvQMdP35ezWDFkJQP7jMMQ1UOvqRznpaARVYMU3V8JB3fx+60WF8zqMMQ6I5qwcr6a3jdP74qFQUczVuKOUorqhpLvGArk7ZZD9SzBfYVpKis3yPW3WdvuK8OFCrfgW0dUILjq7pzJauV/kQfTUoYbz9ixiO+e/8XihjzZLXCUxZX7+WueuKh1Z89ElCiL2xs0mpRQ0ljOjN0PsZDn7xiXgXG4wC9gRn+7liiu1EVksoVnJNDoGSMJAbXnDc6r8+4/Cae71ZZ1oGTbYH4NCyx2/pW/zhblKcBcUo66BubfY0wxI6qsqi4/IvSHh0Kmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kZpWgH5WqJM8oC/a/ElFCydSbscWkXTebHg87hfxIU=;
 b=iyCH4YYJXKh++16qJ9YdkyfwLsGZ+84li0c7YpIfzPmGZTdVYZqZhPS8dRr8GS7pPajqnctEbZYus0D14qZFnnqk0VVx6RfCfxa0rikWgV5KN2Qm1BUH9qX1nRdYiCXb+kEBygltQYY61gmD6kyeA/8ZpRTFHSF6BhR5JB2vl80=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by CWXP265MB3687.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:ff::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.17; Sat, 18 Jan
 2025 00:44:47 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%5]) with mapi id 15.20.8356.014; Sat, 18 Jan 2025
 00:44:47 +0000
Date: Sat, 18 Jan 2025 00:44:43 +0000
From: Gary Guo <gary@garyguo.net>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex
 Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor
 Gross <tmgross@umich.edu>, Rob Herring <robh@kernel.org>, Dirk Behme
 <dirk.behme@de.bosch.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: device: Replace CString with CStr in
 property_present()
Message-ID: <20250118004443.51cc6302.gary@garyguo.net>
In-Reply-To: <CAH5fLgjsuf+smPg5734mGZnZRFS9yDrFQnREhWwSVqoxP1AuBg@mail.gmail.com>
References: <e97dcbe0418cc1053fb4bcfac65cc02a0afcdf78.1737005078.git.viresh.kumar@linaro.org>
	<CAH5fLgjsuf+smPg5734mGZnZRFS9yDrFQnREhWwSVqoxP1AuBg@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV3P280CA0005.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::19) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|CWXP265MB3687:EE_
X-MS-Office365-Filtering-Correlation-Id: 835cfe06-41dd-49c1-b011-08dd37594f30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RVdZYU5telkzQ3JZbFduSUhEbHNZbmp0aXFNNjR4bjBjMVdIakxDRDJLSTNN?=
 =?utf-8?B?bXZnSVdITTZ6S2hyVTJrWENqRmZtUFZlOHFBTlVsbTI3SWN0WUZoWE85bnUy?=
 =?utf-8?B?VzZHZUgvS1Y4MEhxNnZCbFRKRmhoMTJxUFA4dFBWd3BJa1A5ZGhCTnN6ZFZk?=
 =?utf-8?B?S25XdlpXMmY0OXZTV0hGSEdndFZzL0JKWjNsdEhyK05Rb0J5MUdlelJ0bVcr?=
 =?utf-8?B?WjZqU1ZXbk9wbmFpVG5wQzk4aUt1WlYyZmpDZGlIQ05Bbktvc0Z4a2FibDh1?=
 =?utf-8?B?cDNydmJLTTEwdDJhK2swS3Q1ZFo0ZmJWNXk2VDYzTlgzWUlMSXJNRC9VOUQ4?=
 =?utf-8?B?NHd2UGg4b3dVNE9EMXg5b2JpMXgwQUFIdnFabEdJUEVOcXJ1TlhxSEJNV0x0?=
 =?utf-8?B?dk9zTmlkRG1Ua0JnVUlyZ1lIVUF0UXNvRlF0VjgxQ2ttR3lNSExIMzkrKzBD?=
 =?utf-8?B?ODhnaTlBOGx2WXRuRExlQUVvakxHTC8yUS9YdDN0bVJEdkNzV2pEeFJ4WTM0?=
 =?utf-8?B?dVdRZ3ZhbVdHcWoxcFZ6c09OSG9jU1lZOXhqL2RobE1vK1UzNzliSTR0a3dn?=
 =?utf-8?B?SHhWZWpCSEhSZ2w5OFBSVHZOU2FhVy9NVkZvYUVUWE9HOW5CdHpWUVBZTUFE?=
 =?utf-8?B?RmxRTDcxcmpPNEhOS3J5YWVqMWtkUk5VRm1Bb3dMTWZXbmMzN1RReFVkcVF0?=
 =?utf-8?B?eVpoUjBKZHV0dmQ0aWcrU1drOUxQaSs4VlRuQzFWcy82NTVoc2pycmszVVhX?=
 =?utf-8?B?aWhmakNQTDZGd1VKWEhaZ0g0cTNvL01KNkxiWHJDTXlVanI5c0V0YzJFdEp4?=
 =?utf-8?B?TmhOSFhsRGJEVVRJWjVHMkZ4VVpoekRRNHd4TGZjQ3dQdXNvN1pTeDNCSXUz?=
 =?utf-8?B?MHBKTmdrRFd2Zkpla2Y5RVpFLzVkSHhhTTFkYzYwcmxFSVB5NkRpMWdpRXk1?=
 =?utf-8?B?Qnh0RFlZN3hSbzJrRE8zTkwwYk5oNXNDWVl4MlpYd0VTWEc1aFV5UjBjNlBz?=
 =?utf-8?B?aUFoZk5jMGZVeVhzOTRKWGlWbDgwZHlVVUVhZ3VxTitvUUZ4T1R5bThCZkd2?=
 =?utf-8?B?QUR2K2RDQ2NHSENRWnhwQTlIYUZOUlJ6ajZuWWtMcUtFcUNYMFNMNWtDaGs0?=
 =?utf-8?B?eTVzb2N6TnpTNkxGWGhHYzZ0Q1pmbzRtN2RSRmFONlVuZ0NGUW82UGV1SG1N?=
 =?utf-8?B?SUZuWEpNMG44YnpRZW5BNyt1TVFOZTJQODRIanQ4ZEJPRnJCVkNPREV3aW52?=
 =?utf-8?B?SFRYMHJCaUpuRG1TaXFTZUVheFJrZE54K2Q4dm9LeXZRSnQzSnJNVFh3NDRk?=
 =?utf-8?B?ZUkvK05SUkhpUG5ERWpWZXRtZ0p2WFFHcmdRS3A1Tk9zc2VvSXNNOGZVRVg4?=
 =?utf-8?B?ek44Wkg4aVc3N3A4YVRWcWFMQTZ4MkRNZXVwOHMyUS9uQ0kxS285WitOcC9S?=
 =?utf-8?B?UUpDeGhSbnVkWkFLYjNySTdYNnhXVS9tUGJyT2V2Ujlva3Rpc2lKN2FPRk96?=
 =?utf-8?B?TU15SnBBcWpBNzdDSHVHQnFBMG5Vd3lhYlZ3dDR5b0R6V1Y3QXI0RUpkRjVW?=
 =?utf-8?B?bU13UkpPYUxwSS9STEtTNDFrNEwxbm5HaEJ2QU9leUJDN3FVMWxsRnMyd2dN?=
 =?utf-8?B?bzM4Z1kwd2w0UFhSNjlSZlV6RlVTZUVOUEtWazhHR2ZPKzAyMjEwWE1xT05W?=
 =?utf-8?B?Lzh5bFpXMXU0eFRZaVhzOCtMRmluTjdoYUhHWGtrZjhUYWtJa1JRM1hMRWI4?=
 =?utf-8?B?THBHb0daSzVQMjdVUkdJVTArM2VjSW9pSzAzRDZPVGRpR1lVOTZIU1g4MnRV?=
 =?utf-8?B?amUrOTZ5T2RUN0Nrc3lVUnVNZWgraXd3Qkh6U1ZMbEJ1R0I1d1p3d3FWc2ZJ?=
 =?utf-8?Q?dryeSkAjfo+xj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDNGVDZKTll3Y2w3MUc2KytGNkR5RHBSUktDTENnbGdpd1g4U24rbENwN2Jy?=
 =?utf-8?B?eDNJZUNCMCtkY0hxbEk4VkhSNWRXdEw3TERMMWdDNTUvZU5WVEIzKzVNb0J1?=
 =?utf-8?B?RysrWmpFbFZPT3VWU0l2dVlCbjc5Zit2SUlwVkRFWTE0a3owTjdxUXRXWnRw?=
 =?utf-8?B?bVdoRElMTU1aYnE2cnpCRGZVRlMwYy9TdnNLUEZnMVFDT1E0NVlXc01oMVJV?=
 =?utf-8?B?Y09BcUxqdHdpbjJyM3prcmYrNTh5VVdTSlcvUGdkYVhmblRIVkRMeDRHUlJI?=
 =?utf-8?B?dGx1M2RyWHV5N0haZTRFV1FrUkZiWWFlU083LzlKZjgvRGw1V1drbWFMdTIv?=
 =?utf-8?B?ajhBa2pnbWFhVGUzVi9VWi9GL2xJRnRDQk5IK25SMnpOb3duVzFhcXp1dGtp?=
 =?utf-8?B?V0FvZ0toTVdVMFdVaEVXdjRIMUJmSENiNjJOc2VIMzFLZnZ2MnVMaDdUT1BV?=
 =?utf-8?B?TmtWZXBRYUFFNGhIcjBCSHdzMzF4T3NUQmtTSHhlWVNjYVVTQ3R0QjNFanAx?=
 =?utf-8?B?TVdxMXIwN20vdFAzak9lSW9mUzJLeGVKenNjWjdPM1lyZjV3dGRSMkdpanFP?=
 =?utf-8?B?eVNXenppNWhObTdjeVhKVkl0dHpYQWhRV0hNY21VdE94b3NVNFhDNHRKOG1v?=
 =?utf-8?B?ektRZzVCL0t1UGJLbE04dTUwemJ5VWdNclo3SFdpempwT2orRVJkTGZ4WkVZ?=
 =?utf-8?B?Ym5Ha1oxOGEvTmdMV085ajVuZjFLWEtyY2JEMXlHd0tYRHpOV3h6cDlyekRM?=
 =?utf-8?B?Vmp6SVJRUDMvSHdXV0Z5T1RhcXQwVzRBZHVOUTJWUHI2aVNDVUFyYlVZT1p1?=
 =?utf-8?B?YXRjakZjUDZoMUNSZkRidmtxSGNsQ2twbEJTL3VRYWtGWUFkNU1EMVBNdzNZ?=
 =?utf-8?B?ZW4raHBaRkg3QlZlc094TWVHVWVrTHFkQ1BpSi9hSCt0czNUTWtHODBQVHlx?=
 =?utf-8?B?Vk5Oa3VwZFpDSjR1WVYvblN4dldhbWt3VENzWE9XbFJoWjZTZU4wQWN3Sm1M?=
 =?utf-8?B?enFuSXlCSUZSQ0pEN250TUV3Ky9JekNHckJiTkZXSWhLN21aZFhHMVVOb2ZZ?=
 =?utf-8?B?ZUVPeUZIdlphUjdqS3FJdGQ2c2dDQnFuYStVSlJ3V21mb2RzdGtEdXB4YXEx?=
 =?utf-8?B?NCtSUGhSeDNpK0NKZGNoR3FmQjM0ZmYrQlRXakJSaWlSNWp1eFhVUERzQnAy?=
 =?utf-8?B?YzdRSUZXb0JMWjgrbnRyaGN3YTZMdWJ5WXZqaE85eVJKOXNpWGl5UG1rWCtU?=
 =?utf-8?B?T0owaEp2cUpQeUpKbHFSdVI5ck9KcjZNQTFuUWd5b2VzQlZKd2J6MGhlR2Nt?=
 =?utf-8?B?REw5b1pudFBxdUhqc2ZLSlM5Nk1KK1dTU3ZFTVR6NGFCNGV4Nm9aK0NOajQ3?=
 =?utf-8?B?WGVjWlV0K1pMK0tQcXd0QjY2OWdHaEtwbWxlQkMrLzRodHNvWUQ2M04rWkg1?=
 =?utf-8?B?dkc1MGV6RkZFVzd0ZHdWYzYzSW1qMDNmVm5tdkxYaENTUWJTVXNrWnYvSWdV?=
 =?utf-8?B?aEN1VllXeE9ZRzFZOGFSUjJOZ1IzdEV0alJGMlU2RlJydjFUcTZZdytpUVM1?=
 =?utf-8?B?UFZncEtMTlp5SGd0b0YzblUwQlZqVERKS2V4VXMyVXFVMmt5SmJXaUdFM1Nm?=
 =?utf-8?B?VnhENkp5ZXVwZFUrMEpiQyt1SjNwVFZiVkl2bFBFOUhTandzMk1od0VIM2hZ?=
 =?utf-8?B?NUhhL2xlRnlUN0JJRWd0cG42OURweSszY2xvbmVkSEN5cmR1N29hQnRGa2V0?=
 =?utf-8?B?RE9WUWVQOXZLMEw1RFYwaTFQb2pJR0NJNEEralpRa2swQzVIMkhUSWord0py?=
 =?utf-8?B?Rm1SUGczOE5RYVNmT1NpdUhhWU54MTVVZDl4OWRFaGR3ZHcrOStENmFXeHor?=
 =?utf-8?B?M2YyVWQzdlh2Qy9QZEJ6bW1HMTY0dVUzeENqWFZDcGEzOWVBck5manJ4QkU2?=
 =?utf-8?B?WjMrYW5WYWtaUVAwUXlYR2VGVjQrMW1PZ01pSU9JVmROSytPN3ZIbzZOd2dH?=
 =?utf-8?B?TFJ2TWRlRkIzbnV3R1JNcVI0cEF0Nk1TUjFVaXRnbU9mUlF0NllQNHk4enlO?=
 =?utf-8?B?cE1xcFNtdkNkNS8wRS9oaHBxS3JUSHB6SHhpT0lMcjA4OFp3WGk1UjM2Nkwr?=
 =?utf-8?B?d2tNU3lCMm4vMTdMOUpFVnQyRTUwNGZXVEMyMjZJUlZRckhza2t0STdEVG5q?=
 =?utf-8?B?OEE9PQ==?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 835cfe06-41dd-49c1-b011-08dd37594f30
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2025 00:44:47.8343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /WsljSfGTlg/zaVhpfX5yA4Fjl1GZw263lea81tC37n7HHnSC+G6crw3vUqe1d6s9b+saEDwn7SmWN9J8UZlyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3687

On Thu, 16 Jan 2025 09:25:17 +0100
Alice Ryhl <aliceryhl@google.com> wrote:

> On Thu, Jan 16, 2025 at 6:26=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro=
.org> wrote:
> >
> > The property_present() method expects a &CString currently and will wor=
k
> > only with heap allocated C strings.
> >
> > In order to make it work with compile-time string constants too, change
> > the argument type to &CStr.
> >
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org> =20
>=20
> One nit below, but either way:
>=20
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>=20
> > -    pub fn property_present(&self, name: &CString) -> bool {
> > -        // SAFETY: By the invariant of `CString`, `name` is null-termi=
nated.
> > +    pub fn property_present(&self, name: &CStr) -> bool {
> > +        // SAFETY: By the invariant of `CStr`, `name` is null-terminat=
ed.
> >          unsafe { bindings::device_property_present(self.as_raw().cast_=
const(), name.as_ptr() as *const _) } =20
>=20
> If you use `name.as_char_ptr()` then you don't need the cast.

Isn't the cast not needed anyway with `as_ptr()`?

c_char is unconditionally u8 now so they're now the same.

Best,
Gary

>=20
> Alice

