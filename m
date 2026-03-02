Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010003.outbound.protection.outlook.com [52.101.193.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AA0248880;
	Mon,  2 Mar 2026 20:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772482240; cv=fail; b=tFuZS8EdHZtEu2kE26hs81WilMX6gQ5Y2CsJ0D8SulVlsFOzq1jMP7wei2FeNg3Acgn7agCIpriU2VWQg495F6Kk2VREjUgeT2RTQY7uZ+uTDRDfPTfnfk3E4qrOSHESiMtdA1FxTuHzRH3MytfZx63NII0eJ5iYf/mDRTjRyoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772482240; c=relaxed/simple;
	bh=GmNiaXJTDegTgAwXeN+EaG8ILeW7JIsTWd2PpZAlVLQ=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pqNwK5zudpKeusw6+1zYu+ba6it4gyAFDALKXD8p/6UFEs5kogD3SBCLG8b8XM5EqegxwmjuPvbb3c59WnHglQVNidaZmI5Sbs1SccI97aJJY8ua3zTkK7xFXvHgcU2oYeuy5Nwao5+3AWHF1e43VynazKhZnAJhr7MlQUN3JgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=f+E5Xe1D; arc=fail smtp.client-ip=52.101.193.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="f+E5Xe1D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/5gtp89pfeDmO9tzYJ1tT6NhSLMnvX3/S7U49Cgq5sLgZ1sN2hh+eGJF2QVL4lqtopJimbiiR1FfScM5vQG68As2haMjPuyFbi08+GDWFGYZ8U56I3WGhaXzHIddGs77xrodyUiwPKzvvFh1Wft3LE9Kbk1FNF6wrz7keEaKhy2B/MSfbiwmMrF5SAtrdmzgIPAo8XmQ4N0C3F5XjuhzCVDo2ZycoqvYr0X+PQsGEjnaZbzFWasWCTN1DRx8OfCXgw6SZytyziJShOiqPgg4BGqh9hvCldSTk6xpExTdre5XBd+9oL25IIF/YuBYswZSAjLTPO3qsUKHOdpqeN0rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GmNiaXJTDegTgAwXeN+EaG8ILeW7JIsTWd2PpZAlVLQ=;
 b=KrvajMhCsFVcLNZ1rZhwXW9Vge4tMKf20TThiqKtM4wjQN0rPF79d+VcLThzterX4Dc/29hudJl9O0fdLk5au6/OqMtFtmYE7RVWmD8Dn1KPjn7iIzyjK8pmaqHVss9UPQYPwDdZAYrnKJ57ZCBGzCsr8S2KFFFUIujVwXL5LqIhk7aZ6B0xKeUDkRLMbn3t0QDMROBM3IZoms5N3HO+COHQOp7qxyjpi34Wvcalx9ljhawoqq2SfIHxS36BGCPY3mx0V9hQeltgu5CYZ1CP7XBrHROnyJ6BTjO68toliQyDgiNyu/CUbcLvAsrjzFU+g/0dUpl4Qq8lrAgdVDH4KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GmNiaXJTDegTgAwXeN+EaG8ILeW7JIsTWd2PpZAlVLQ=;
 b=f+E5Xe1DsaUAA9b854n+9Ito7cqNfyH35BP+Q959zZMPXrXycRXTxQP76SIDj6sd1kWp1g4c+Iy8ildgzE7zqQbN9qcASCNBVLGYDxjrPbBvKFnAltz39QxF9Xsp9+fMYUxutiCDggkcTf+FV2qs5PE7t9I+F/i4VThtlNIpy9TRmVupXzBxl/kLmJWJBpR1xHL1sNrYClh7n8pwP1V1dPWOUoM7XpCAKhzqLmsyQy2XLgx1khF0Olk6nEJ8Ep9I+rL7CKpGH3pzhKi9bEMu3tpgAHtiW/7FhGxLUCNVfiJFsaSereQErU2vdOS76sI5VneyzA2Hl07kH4Drg9aL5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 DM4PR12MB6663.namprd12.prod.outlook.com (2603:10b6:8:8f::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.20; Mon, 2 Mar 2026 20:10:25 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 20:10:23 +0000
Message-ID: <54dc2b29-593c-4833-9978-12366b59d1c3@nvidia.com>
Date: Mon, 2 Mar 2026 15:10:21 -0500
User-Agent: Mozilla Thunderbird
From: Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH v8 16/25] gpu: nova-core: mm: Add page table walker for
 MMU v2/v3
To: Gary Guo <gary@garyguo.net>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 joel@joelfernandes.org
References: <129e9988ff8d3e8747f724fbcc88c5cb@garyguo.net>
 <1772028959.538096.8539@nvidia.com> <DGRH1R6GVNI7.11AU3CRM3M36Y@garyguo.net>
Content-Language: en-US
In-Reply-To: <DGRH1R6GVNI7.11AU3CRM3M36Y@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:208:236::23) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|DM4PR12MB6663:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f4ae38a-facf-4ba7-e2f3-08de7897bc78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	9/u++MpuDSvNEvq+aL4IcQtf/EQlyvM7NUguCgNvcco79/CD026Gq9KUfieqcEEP+iFZtlSERC+IrHBeodmXyr1Z98C9vu79SuCGn2A/1KcbBIYyWKWXbQKuaBKSFTjgnHCCWW8+wlhjd12cJPYbpe4kjSW8A199wnLCuFzGbWo56rJtoGowx0MdIhbG1ZCBZSuTcEgSBnF8KnHohzVkBWnkQ0JCJXMxBur7s7ZXnwAjv101Zwgna0NHcEe/sktQGH6QTvA6ES+nuF+jmr+GYt2VZ9rB/bCkX3y9cvdTAEErQtvGgEPGMKeHRS9GFCMkomDNPDnWAlC4SQNwBdbRtBp247LV/hgg83TDJ34vK32QgbxnxSmEk24ipTAKIBO86VtQJs9YZVX6bMxlyB7B2Ntw7U3NFBl7ZxukZJ9q9qANYPeeX70pLLJFxnlFyvTDunJ6Z4UJuXbJKJkWxEyUxmqj2uqx5ZcmqyglMASefVlSMUxg653pSSyMfBNaWHUkVo9Cqt40aNU7QL8lJGrjwsc6hOD6eqYZvLIUnXpnS01kmDcUrOYkqwA/Jn2ihaBth2mI7Oitms+qK0rhn8ft+FFf0QppZeB2o9amcYidOSNwFiieeae/ZH4/ymEDQJOdmrqqD5Ftlt66+tA1UMxvUG9zhz0Vs2rYwuuHznc3jBYGrH6cDRdN8fnNK3MdrRgW8vAiXX6wgwFcrUxqGFZk9fB7JIV6ektrstYx8anJEa4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnVzcXVqdVRKRThKeTFreCtUSzlmVm5QejUyVFB5R0paQlRVdnV5cXc1RFNK?=
 =?utf-8?B?TXRIRVh0WFJkblNJVzl2UWRmWnFOczAwTTAvYStQb0pMbTU0VDVXSXBqUjFL?=
 =?utf-8?B?U3JPbyt1Y0MzZ0g1dmRzQWJXbmk3cGpJajhVQU1oTmtXSHJHME5WUzJyZm9C?=
 =?utf-8?B?MGVNWlY4aDRBZGpNeVdqNkljUGlCUjV4ektZQVp3MHAyZ2lDWWVYVVVBYUdt?=
 =?utf-8?B?bXVJV1JmcnhlRWJXZUZ6ZkZqa201dnF6c2IxYlorNGQvU2FPNU04cmFNM2Vo?=
 =?utf-8?B?SEpHTEFGbW03R0ZUL2tiUnJqaUd4aDZxSHlEOWdoMWhVSkhXR2FWbFVmTzBj?=
 =?utf-8?B?SmZtZnFHYnlKTXhLc2Y5YUNHNjZRU2ZROW5vSTFkS0llN0dHODVLUkNyK3FT?=
 =?utf-8?B?a2FBVEZudFJMNjB6RzNoT1NacW5RUmN5ZFhsZDRyaXl1UDVMSjlycDluN2o4?=
 =?utf-8?B?eTM0UXc5NkhCY0RQcjkyUGRyL0ppNGttOC9CTmxmcExZaUprNmRaM3ViOFoy?=
 =?utf-8?B?R0EwMVNWZFNLcSsxNnd6cHFCRUo4NkJMaEE1YTRrb2oyRnZacVJlOWpMaVhT?=
 =?utf-8?B?TUtwTkNQTGpaNDl2SHJtUFJ5TWkvSExWRDNPRHV4MVVRQ210VEFqd3M5dkYr?=
 =?utf-8?B?RmsxVVVCSzVZY2d3b0d3eXhlbnFRS0dKUlBNUG5ydStXYXAyb1luNTNEWm5y?=
 =?utf-8?B?QkVhaW95NXltSjNRNnNrbUE3RTBkeE0vY3RxMUNaOXdZOS92SC9raGFGVGhv?=
 =?utf-8?B?SEdEU2xEcjBoc1JnSUlkZklWSlc4SnVnS2l2MnZ5K0xzQTRPay85bHhUMm41?=
 =?utf-8?B?b0d3TGdnV25TK3pDY3hQTXpHNitnNUsyRFo4Z084L0tDRDFPQlRkanhCZitG?=
 =?utf-8?B?Qlp5QWpZajhGZzNHdEJmbmw0Y0JIZDVETzgrMVFseUFWNE5IU3N2OTlpZHE4?=
 =?utf-8?B?Qis3N3VnOU1XWHpaYU5lQ1VLRnMzek9GSkYzNU41ZmcvQ3orWUFFUUE4ZFUx?=
 =?utf-8?B?T1hMbVhHakJpOUN2TkZ1U3cyZ0dVWXZNTE5UWlBoMmE1c2gvYWQ5bHQ4VHlM?=
 =?utf-8?B?dU5pS291S3RyemM5UGtZdmtIQ3NlYkltSFhHWkl0STYvcjI4UFFZQ1hkUktv?=
 =?utf-8?B?Z3dnYzZYWHlkNXpRb1VuWHFpOTZiK3Zqd1RiT2ZwVDA1QXRSanJBdnJUbUVt?=
 =?utf-8?B?ekk2ejArQXFUNXpUSHZSaWRtenJNRzlyZS9RdGRtcnpaSFprNU90cFhqdmdq?=
 =?utf-8?B?eFp3TkxCQ1NSMmEyS3NsNzVqNjdaN1NFK1o4bjN6SDFTYllRdUhxWnhraXY0?=
 =?utf-8?B?eWhHZzJzY0pZKzVSWklMMk5Fa0ZnZERLNUgzakViVGVZZUpTTzM3SUphS2gw?=
 =?utf-8?B?UDdaU0ZJS3l3TW9kQ1l4bWRiQWRlRXBRUWNqLzg0YUZwRklQSXdHV3ora25m?=
 =?utf-8?B?RzRlQ24yZ0hxelRPTWdEak9DS3dOcThZOWhEVnc3VElHVjlQeWl4WVZudVNy?=
 =?utf-8?B?eXZkWE5pZTBISTZGUzE1Y3d0Y0VYQzVNYjNXc3FEZ2YyUUlKa1BZcjUrZnhl?=
 =?utf-8?B?R2xzU0FWd1BRQk5LQTFDZEJaRjlkOHoxK2xUYU9vMjFjWkF3MHpEeXowSUYx?=
 =?utf-8?B?U3lBRTc2bkp4a3JHdzhhbFlFRGFtNmFBbjNUNE1IblMzMTN1NGQyRThUQ1Vi?=
 =?utf-8?B?THZSL2tjV08vbi9Bb2FldDlickdWdTRFckFieWs1Rk1zYjFBc2dPbHlBSSs5?=
 =?utf-8?B?MUIvNDlEaitaUDRjTFJJeDBXdEpuUW1OV2tQZERLQnhGMVdOM0Q5OGExK3RU?=
 =?utf-8?B?MVhLazJxcjU4RFZYcDlmMkVEZnBQK3p5Zk91Y3FFYzBud0haMlNRS2hyRHV3?=
 =?utf-8?B?RTlmak8xekhLL25XODF5NDdxaFhTZitjMmo0SnFyTUtnODh6ck8yOWlIeWZY?=
 =?utf-8?B?YXFyZk1lUWY3QnRPdzNubE5TK3MwOUdEWVdRaEMxdE5ZSmVOcWpEdmg0WE5S?=
 =?utf-8?B?M3F0VmdiMFRqNWRxQ3E3SkZsbHBtVTFIMWtKb1FhOEQ3SWdLVVg3RVcwWlJJ?=
 =?utf-8?B?a3dLTlJsZ3RPdkJETzcyZ0pKQUl6UXNwUDI4Y0hMYzRTT0Nqb3hQZnMwWHdR?=
 =?utf-8?B?K2NwYS9BaUZNWVVML2VoL1IrRUJPOXMzakUrU291OGRtbGhac0RUTkl3SklY?=
 =?utf-8?B?L0NHMkEzMHpJaDNlRm5IS1pHd3JwcndUbXVTYnQvV1Y5NVRwdnFLdFZ2SURD?=
 =?utf-8?B?aHdLVWloamFJMnZCZC9IQnBjWWxCRXYxcG5JSDh5YzFUdzQzOHNUL0IyNU5m?=
 =?utf-8?B?alF4UTdySHMxT3A2bXRUSm4rN1NkcXNsRnpOS2I2N0J0NGRQMHZFdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f4ae38a-facf-4ba7-e2f3-08de7897bc78
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 20:10:23.3675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s59qT0Bgu0u+FSsM6LyECkXjFPX3JddEFgkv98ibHxjlWfmVrluzjz1P8XcrlvIILPCKMs5zFYB3s/BSZTNaLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6663

On Sun, Mar 01, 2026 at 01:15:00PM +0000, Gary Guo wrote:
> So PDB is not just a single address, but a list of page table entries? If that's
> the case, then the number of levels is indeed correct, but reading the code
> gives me an impression otherwise.

Correct - PDB (Page Directory Base) is not a single address/pointer but
a full page table level containing a table of entries.
