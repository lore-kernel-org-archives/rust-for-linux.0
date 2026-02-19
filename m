Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012060.outbound.protection.outlook.com [40.93.195.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96C933F36B;
	Thu, 19 Feb 2026 15:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771515864; cv=fail; b=Sk3nbQua+wzEU+iqqT1wIrobYYNW8APvrlFcBkgGw14hjAxxTHxs4nHGHa5r0zPI/rbk01dIjlHQAOyGOsD+HoCt6JvRR2qrnmnvx5EMbUFLid+izK06OXLbZr2UczT3MuI0hmmThA1FSssFcJ00o7+C5r0WlczJ6n6M8NSt8NM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771515864; c=relaxed/simple;
	bh=wKvvDJ0VnJYa0n0O5OzmfDdYMo0ygnGTggFE5Di39Uc=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BLSWAOYtCXhEG1/fPMjZfSLR/sXtSzUb9Do7+CZFFt1wcdQlx58z4o+dTKTOqChOFwStpmfFSfCfg5c2+NESiGTswzXMkqoKih6aS/30A6d6sPInVU9iJdNirmexq7XOPEArjtuFmMnPdEJ0Q2t5+7wf98PhMDENnojjp+iB6As=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fHzUsaqB; arc=fail smtp.client-ip=40.93.195.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fHzUsaqB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fpn1ZgIOAtaYdjFOgdWE0BMXxxF1c/PSQSkwri6zZLFGg/tesIzHCdD4JE3CpItij2ofPotjuWeeMxpoxwtkBaUyuD/wiJ75fIZSxRfFnOvggRgLFObcHeziYtZIeRHJcuPYC5k45L24Yx5HL5DUhEfkNibZ0O2omb59ZhezqheRssj/JWXIoX8mcIEsLdq830+WzAVTaH9oi24cWAK05P0YTVtf/XpItTKdbnO55vTnULgTXfjVYKd7BtYCeZmCJemF3HQ8zWJsWJ53LUuYzMYEADjSJc0VDkFihr347nQIl2wd5QEbN/N0KO/vh5kNvfbSI2xBPVL7pOJsbzBh+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKvvDJ0VnJYa0n0O5OzmfDdYMo0ygnGTggFE5Di39Uc=;
 b=jBB94Tvpxg/gQoBFZABwCq538KEiNLMIBNvFR4gAzClCDZT8V4JaBPZA1a56uJcwQF42rAwgW2SE8M7f9k2wzDxrMot8bgWC2CFigd13LHDFhDQUUVi0YbGQAH+Vm5XGLB7Ihqkl4kfTmic9bzb/OuAyOuwWPzM/Qip79nEzPsE01SP7OZMb5Zd8mEXbAdtyZ0uUFptrDpYT4fsN3Fc3gHP8tPgTnWkn3cs31yjT3ggFQCCdeBujS1o3Pm853crsliY5N2x9a6SzUsoO01aU1OV5vb1HN+tYmtPZ/tBggCgjOPJIk2No8mw6c/EbvIUFNAcQ9lGELCCYLnda5s6j1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKvvDJ0VnJYa0n0O5OzmfDdYMo0ygnGTggFE5Di39Uc=;
 b=fHzUsaqBJJU1zBwY0CKrwJRt6Um3iKw36f36aTLzHJ9AZzcmfVLmUcgt35ga6Q0t6lPFxoCRbX16jjskma92egRBWJ3rgEmaR8Oz8+iimaZZyNCDT+KmIZ8crw2AXJa2gPpl3sCCcgzsaYoUP1MrI43vrjd1xBV7OrSWFvkV5RdlY/WDJdtMr4s6z2sHLAu7GcdR7/hPXf15kOjPkmTEsGwMRLtM/0vf20oZ7MLgt37Ouf31wDGRMRanC498hYHHIwvuHSfygRO6KO2Y1IlD4slPx/nAWATIMrn8GF2VBiXDuXZ2IpaV+kBRr2KtPKoOnruTifRfw0riVN2AcEl9gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 CY8PR12MB8337.namprd12.prod.outlook.com (2603:10b6:930:7d::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.16; Thu, 19 Feb 2026 15:44:17 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 15:44:17 +0000
Message-ID: <15a193fc-b2b9-476e-a9f6-57e3a210b74f@nvidia.com>
Date: Thu, 19 Feb 2026 10:44:15 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Alexandre Courbot <acourbot@nvidia.com>, Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
 <DGIWDQTR76Y5.34L9IHKU2SEKI@kernel.org>
 <eadfa4662f403fa01f19c1c17a435c1a@nvidia.com>
Content-Language: en-US
In-Reply-To: <eadfa4662f403fa01f19c1c17a435c1a@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR17CA0034.namprd17.prod.outlook.com
 (2603:10b6:208:15e::47) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|CY8PR12MB8337:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bf93a42-db3f-40ea-b9bc-08de6fcdbda4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MkxDMUltVk5YZ0hlN25QSVJzbVl0VmR3Qmprb3A5Rmw4djdxZG04V0ZGU2pz?=
 =?utf-8?B?eVltYkphc0ZPd2hVSjhsbHNJaWdYQkdaVXpJUE1QbUhqRTFZay9jRG9VblRP?=
 =?utf-8?B?eTA5cVNCQ2F2MjhYYnhxaCs2SksvNDFnbnJrTTBtR0NPbkU2a1lGT2crUWN0?=
 =?utf-8?B?RHpOc1F3K0dJVUVqWFBHR3d0MXFMRVh4UGhoMkJ6M3VpUjloRFJHR2cxOVFy?=
 =?utf-8?B?TGJ2N3lHcHdqeXlWd2Znb1VlN2hieE9oUXdxaS9laEsxdmg1RGU3NHFpb1ZV?=
 =?utf-8?B?ekZmazFKTTdXWVVYd2FVck9JSWFHTm9WR3owdjV5RE5LVk1pNko1bmUyUU5S?=
 =?utf-8?B?dldnN1MvU1pIUFlGeUVianE1UnVVcFJhcjJpZ21ISFA5NlpQTGR0VTBjOFFo?=
 =?utf-8?B?ODN0cGJSN3hOMjU0eDc5QmNFMVpPcmVHZFlvaHZ1R1NrZGsyaWhpSkpHUlRo?=
 =?utf-8?B?RUdGanI1NHZSNHE0QlJSWWNkY1FwaGxJVFllOVc2d1ZObVo2WUZUM2M5S2NZ?=
 =?utf-8?B?RlE1blVMcXRBck1VR3NobktzeXpXeWt6V2xqUktjSjFUN0VaUTVMc2ZTaXJR?=
 =?utf-8?B?WkpDZ3dBQmFsZzZLTDNlY3p5Tk11b0NNTTRpeXc0clBiUVZTNHdDSlNFUzV5?=
 =?utf-8?B?bGFtNzhhb0QrNkxBZ253TTU4bmtvMnhNVWtaNE5jRmtCV09rQnV0VUtZaEk2?=
 =?utf-8?B?alZaTHJvWlM4dDNnR25XY3RYVE9KNUdVTWpWUDlPbFIxSE0vV1ArMm9pRTBm?=
 =?utf-8?B?Y0JvUksvcVJIaEVqR1lMODRkaXVVWUl2aUIwc0N1QkRTN2NQTDMyK20rYksz?=
 =?utf-8?B?NHUxTzVUZ0l5SitVcGcvaFFjMTFlQlJIVFJXUCthZ20ya2FKM0F0ZWd6WHdE?=
 =?utf-8?B?MUltalhkNTdqNERoVGVsdjhMRVFoREl0bDd6WENmd29kSUk0b2NMd3VMSEZi?=
 =?utf-8?B?elk0dmtvOVNkWTRTSzBsQ0FvSVAwcDliVmhGcWlCKzBIczlDUEthbytiYmtw?=
 =?utf-8?B?bm9taURyMUNOWmJWWDNERjN6aHFZZjFnMXVsOEhIa3dNS0FqVFBHOW9KK0RH?=
 =?utf-8?B?eUhobytEOEMxbXgwWi9IaEVnTlFOWkJQNENROGVPTXRjUXdETU5XWWlBTmZy?=
 =?utf-8?B?djVKaHd4UmwwNWVRaC9DR21DSzkxZ2tEUnlaRDZOb2JIcElCTVJ0eEZtdEI1?=
 =?utf-8?B?VVZxbVBYc2M4MjhSdkd5YkY0WnlwV0dRc2QrREh5bWxXeXU2ajE5YmcrdC9a?=
 =?utf-8?B?eE9HSGpaWEYwS3lka0RTcDB5YW5DcWdNRURDMFFCWUdEU2dLbFNyc1lYQ29j?=
 =?utf-8?B?cGtZcnJwOUFPVFZ4K3dxaG9jTFdGbXVKdTI2ZHhIUVlFY2hkZWNsSzFrTzdi?=
 =?utf-8?B?NWRsY0wxMmZ4NkdnUG5Na3haZ3JLWEtpU25IY0toL0ZKeVNmVnlqUkUvSGxT?=
 =?utf-8?B?YmIwTVpYdGpTSi9zenhjMk1JVTR3NzVraU15U05idE9Lcmc5SFM2MExGUEov?=
 =?utf-8?B?b1hJTmhBYmo2MlZmcGxMTVdBckozbFhySFhsRVc4aERKTHpkOEFtSERGWDQ0?=
 =?utf-8?B?N25NcnZNTVlwSm5KZi9YQUFpbGN0TGJ5REZyMGM5bXFCeU51ZFV4bElsSkZl?=
 =?utf-8?B?bHM0Qk5JTll4QVU3MG15SkFyblpyLzRXUmhwYzhBK3J1VnQ1QTE3bmM1Nkdl?=
 =?utf-8?B?RVFJUFdORk96UTB4NXRZUkVGZjRXL0JoM2pmeDRzVXVyUXRsdTg2Z2hGcVFN?=
 =?utf-8?B?T1VCQXMzdjk0eitXekR5REp0SVIrVDl2cUFUOGpLOC80RFFBMUtTeEpTSHFN?=
 =?utf-8?B?UHMzTXlVSkoyUUFCNmN4c2xRTGRDdnJrVlc0VEtQZkFUYnpRV0c5dkpZaTd3?=
 =?utf-8?B?SDRzM0JHNE1ScitsUi9nNzlnV084S0o2U3RtMGNaSFdvTlUrb1R5c282alRi?=
 =?utf-8?B?WXpzektxSFlmR0lObmNYdE5NbENXTU84MTFNa08vc0IyTlBRbXhzMDc3emRL?=
 =?utf-8?B?TjVRMDF6SG5kQ1p3OVptanp4UFVBM1dmdHZEQlBsZmZpZ1dpanM2cG1xQUhm?=
 =?utf-8?B?dTFnVnhQeWRkUWlDMlcxK2RWbllCNVdqSXNPQTRBUXpZWDBDUTNDZmdQM2NS?=
 =?utf-8?Q?4Fzo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MC9VRS9LM3pNdUd4OHJKaVh5QnBWRUp5RGUrS0xyZXV4bWtvVXZVSWZVWTBQ?=
 =?utf-8?B?ODhTMG03eFJEREh2ZWhaVnI5SzV2dUhlTE41UWkxMmh6bWJEZHpLQllEQ0lS?=
 =?utf-8?B?MjUxdHpYNWJSK0FUYXE3TEVKdUkxWmsydGVJd1doUmtkNi8zYXBpbzdCQng4?=
 =?utf-8?B?eFBrQm1Ud3hlS1BxdTZYdnBwQTQ1NXRkanJvSXpmazQ3YTcxaHkwdEhIdXRm?=
 =?utf-8?B?Z1dqWWVjWm5ncjdJbFk0enB5MnRNTTRNTU1IdVdRZExocWFmNndWendIallM?=
 =?utf-8?B?ZTZyR2N4Y2JBSFhiRmlHS29Qay9vSzhDKzMrL2t5dWRGKy9SbnZidGtIazhI?=
 =?utf-8?B?WUhJbHVQUDJRV1ZtU1ZEK2NrejZPUlRhY21hTVpnRUdtYlNwOVNkR3ZOdWZi?=
 =?utf-8?B?bDRORXZ4akVqL2M0WlB3MlJhTjR2YTRIUzRWRzZmbjJmVlU5WHh2c2pnRVZP?=
 =?utf-8?B?WWZGcFFBVVhJS2dsUVIwOGYrK3pFNmRITDJ0NnRwaXhDNy9sN000NGhZa296?=
 =?utf-8?B?ckoyOVphREhhZ2ZmTWVBRGNKMEdWbEVUZnhZOGQvaDg1YWt6Rlh5eVlzY2cx?=
 =?utf-8?B?c2xwZjVIajVnZHh6dkV2cUIxMzNya2FjTERzS01lTGl0aUphaFUvRU5QU2ZI?=
 =?utf-8?B?R053VEpmSlJsblQ5ZEpkajF4UHhYYXpxaUlFNUlpZGkvTEFuMEllOWNScmNr?=
 =?utf-8?B?MUsrVmljbUJnZ3pLR21yMUZLWmpydDBxbnd0ZHZVZE03bGlGRm9JMVUvYmsv?=
 =?utf-8?B?SDRNcFQ0WVNyL1VvVDRMM2U0eEcvUWEyV2E3Yk5CcUdhMFV5ZUNGQXdEN25H?=
 =?utf-8?B?RnZ4K2JEUDhIeE5mN1M2VFpSWTgrL01NMERDMzYvYzdOZitLOTgrcnlYak5T?=
 =?utf-8?B?dS9GWEZwRnp2c0ZxbFd1OUZSTkVGR2c1ZDVpelRYWWF6RXhjV2VzVUlsbkxY?=
 =?utf-8?B?T1ZGRTJ3UnlTOVFSMXd0NUxieGJVTWtGbmIxWDNidSt5clVaamZXaGIveHZt?=
 =?utf-8?B?OFFIMG9yNmcyYldLNnhCbitpa0VXVkd3Q3ZYVzJNK3AzYkgrcXdYMmhYMllC?=
 =?utf-8?B?SnlsTEZPbDJRTWxYRHdEMTV2RXVEdU9aKzhZZEplNEJGNnRIbVhwNEVrM3FM?=
 =?utf-8?B?ZklSY1ZkcmRWblVKKzEzK3Yxcy9kTThOREh1OTM0UWNDTjNiejNvUVdCMjhW?=
 =?utf-8?B?SG4vdUY2QlBuRGJtTDRIWE14a1hxZmFuUXNWR0J6K280VDlYT3FtNkdncUIz?=
 =?utf-8?B?Mm1CMlpvUktnVDM2dklPRWlsNXVPS1UxbWRHMjdPa3FSQzR5ZWdEUDhrMXVG?=
 =?utf-8?B?QitiZmZjbjZrK01CUjRXM0RoUkREMVU4b1ZQZnJIZzcveWZ3YytSOWJPbVFk?=
 =?utf-8?B?TitqNFRRdDNKMmthNUtla1ZFbEc0N3NpaDJXUWZaakUyWlk5UE1IeENmYk5J?=
 =?utf-8?B?Z1Y2cXg1aUZEMCsxS0JEQ0ZaSXYwaTRyR2hIckREOE91VjFNVFN1V0dZdWdF?=
 =?utf-8?B?MW9GMXdSL1c5a21OWVpta2JVY21zZUhyZ0lzR3N3QllZODJtcUhUZ2Rnbytx?=
 =?utf-8?B?TmNYTHhsVThnWldGZE5wWGNFMUQxS0xvb1VWMFRabENpVnRmT3JvZThFTnhW?=
 =?utf-8?B?LzkxV2o5WjdEa2lFY05JZmdwbXB2SHNvTEhkT2hoUGRjSG1OMlZnWEFRUlBw?=
 =?utf-8?B?RmRxa2EwOWsxSTVGQ1VaMnlHRmV6cW1OUDdtekFkUGZEejZ0cnVkVVRwOGdS?=
 =?utf-8?B?TVM2UlZ1dXhUb0NWVjdxbEZNMTZiTWxQYWdWV2JUWkNQVWk1dU9lOXBadzVm?=
 =?utf-8?B?akZFVjhzZm5nRzF4bmk1ejVJSEkra3c0VXhWWGU2TUtXTWhWWjczcmFNeDJQ?=
 =?utf-8?B?a1MvQks5Vm01U1BwSEVYb3gwRDV1RmlhRFR5RFJ6NzUvSkt2eTdPOWdodmlQ?=
 =?utf-8?B?RVJzMHpTcC9KQktTMGFoK0Z6YXRkak44eDZyVTB0RzBxaXFVWjM2YjJVdVVZ?=
 =?utf-8?B?a0R0LzhZWDRTTEZvcmFNWWVoMzdjRWdwV09pNEJ5eDJkSHFkMXRXNHUvTWlM?=
 =?utf-8?B?Y1ZTMGl4eGhaSkU2ekJGMEJXMG5TMTd6c0R4WU01aE44cGRaVENBblFmOFZH?=
 =?utf-8?B?Nm9EWkpwa0h0cDFEMkZLNEp6bEtnMkNtbzlLZFlqSFA1VzB5NnRHeDdOTUhZ?=
 =?utf-8?B?RTc2NXAyS1plMjVNMGVQVGx4ZFZzN3M4R2dRT0UyTVlQQlBqTmZzUjJvWkNl?=
 =?utf-8?B?bGtuaTlKQXhnTE1GQnl0bDZoekZtME9za1ZGSXFPUFNLRVQxc1YwK2Fvd2g0?=
 =?utf-8?B?VGZFRTYyZGNXbHFPcjN2dlAraGRkM0xKTmJ1aFNGMDN6MUE4a1RIUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bf93a42-db3f-40ea-b9bc-08de6fcdbda4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 15:44:17.6189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TJuPrXiiwkE3Vz9O2Nf3tm4yqKhPu6Ag7wYpX5RqNlwaSfUQlPuSwXHuo2wnkBG6e0BMOnn5rQfRX30pTJtR8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8337



On 2/19/2026 10:27 AM, Joel Fernandes wrote:
> On Thu, Feb 19, 2026 at 12:21:56PM +0100, Danilo Krummrich wrote:
>> On Wed Feb 18, 2026 at 9:55 PM CET, Joel Fernandes wrote:
>>> +RUST TO C LIST INTERFACES
>> Maybe this should just be "RUST [FFI]" instead (in case Alex and you want to
>> sign up for looking after FFI helper infrastructure in general)?
>
> Good idea, done.

Actually, I am not sure we want to commit to entire RUST FFI infra though its
pretty tiny right now. Most of this infra right now is clist, let us start with
keeping it as is "RUST TO C LIST INTERFACES" ? Or we could make it "C LIST
INTERFACES [RUST]" sections.

Let me know yours and everyone's thoughts.

Thanks,

--
Joel Fernandes

