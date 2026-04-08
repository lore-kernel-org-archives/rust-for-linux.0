Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012042.outbound.protection.outlook.com [40.107.209.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C492A202C29;
	Wed,  8 Apr 2026 02:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775616751; cv=fail; b=DNZ/tKF6FzJgO1EAZ1/eN4V+eJAbX4CDe6y1X9+Wegx1z1PgAaen1tgvoHZwAPaTQLY6jQhTnrPh3eOISrbho9VJSxYWl8Y1pSLUjGTYk95z7JExRdn76KOvJxSc+UbXU04ng5P7uVX7wfJ0Eh8fxprUbmMl4hLvoKt5gJgoLgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775616751; c=relaxed/simple;
	bh=yND7shM+2/BcG/i5o7OvQPMX1+kF/GcS6tZRUJwf+tg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VjQU791ODVlW2YakbV8KNXCfVw+TrBDqBUyv1VTekNCJOV/Ro9XYtC+Z3oj3rIP509SRuKkSQp24V5wgbfZc5yaSRQtvyjXD8kX30tM9PuljmBUtraU8xqBNM222cTEOg7zgAU+6B/3TW5QSyCGKdvMxgyPTnd9WTGBc7F51zeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kKjUDr4u; arc=fail smtp.client-ip=40.107.209.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kKjUDr4u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TfElVj/wzJDA+YXpZHF0XUFJ+fNoTrkjdWnDX45MDfKet4FTA9pEAFT2n6jPMHUp6X6Q7ilaMtqtSyXJ490OMXh1edRF9nXjyHNydhLRE3rlGLsUJqGjDMfq4oeCZaJ6xhmuocOfokYCI+6v/JD8moGLd740Ejp4F4+l0jg+/HpFBflt1A4DZG+Whay53GSZmQepXurYIRcwcxyab5qUwOlnpDA0ujUeId0vQ8hHdnrYBDDTqdqTn7BVqWHoNJl8ZH+2fXJVSPI8xYyyffosCNylzJZ01gmVaBae0/z3jgac82XMmRCd56nOa5GMM8CqbNh1FcIK+2qbwv/1B+n0ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a75csDJIGqzoYT2VjAb53s4wwcJXD4UZgrL9RDActx0=;
 b=v0jOnND+URDL87tqvxzFnlSU19s5CuqISWm6s18Ik7NPs/YBl3RAUySFE02sh2umgJmDqx/zcpp9o6ubgpbwqYug/nTizaYe9GHsz0B5W59GS5L7/vxaFT0aFMSdXCupbrcNupF/Vs6QUILbhQuKPk9QCom3UwxlilCSlh9mcZf/1NmdfL1O5UxNbkC1xgwOTIIER7B1H6PuKAlPz6K+QFpWeIFz57DnuhVP1U/awd9pWSfjgz+NmB1kWMQVF20dynyzhMBnfbnczmF0ZOeIZa8muGAOlaeQnlR6qr+eXVXVKoeIvaiFp2h84Ga3762H/29w4vi2Dk2blyTOwuFW6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a75csDJIGqzoYT2VjAb53s4wwcJXD4UZgrL9RDActx0=;
 b=kKjUDr4u2zlEtlJanXStTC3FdsLStAeD3KlykG5TbL6B+lr80p0beTCLqRevsX+3sG4F6rsSvmFdFXZM8FER/+8ycCgFA+ruWk/71lLBgueGQ/sbvF+egQDqcnm9vkmuQz0oWEkCaV28TqdC9yMSY9CZ7f5iU0gmt1EOUv8iDni6aeki53mNnY/+wvUBrlI/bxsQ4IzPX0GiXhlCbfc/5sA+l4AO/SU5na6+tTK9yBfSI322yL0xPuoUuuT1e4gdDCIne14b+lUJFTwvUdmN6Ay8mhjWImcN+S7eM5hM7FPgG+O8sXAD7wxH4oAPcJ6d3Yuq3uNkh3R33ij9tvU1Yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH8PR12MB9789.namprd12.prod.outlook.com (2603:10b6:610:260::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Wed, 8 Apr
 2026 02:52:23 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Wed, 8 Apr 2026
 02:52:23 +0000
Message-ID: <417771f9-fc38-474d-a40a-4d3449e19b99@nvidia.com>
Date: Tue, 7 Apr 2026 19:52:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 30/31] gpu: nova-core: Hopper/Blackwell: new location
 for PCI config mirror
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
 <20260326013902.588242-31-jhubbard@nvidia.com>
 <DHNEDVS8M0KE.2JBNP5LELRAVR@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DHNEDVS8M0KE.2JBNP5LELRAVR@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0070.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::47) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH8PR12MB9789:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cc2de8f-3608-48b6-f98a-08de9519db5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	VIBc7bIknBNHYeNO75FRD3pL9M7JGtgT8xSPt+PCNuv1ga1aMSEpgICj/hkyMJNnH5S7S+yXp3oEQddZAOCdCjF0z0QMxpPGwsc6ee+5SqfmFKXq4IsaRYKP0geR5lMNHg5tQc/JOegadr6wjwBqKQnJKUMpfMA03Jf7MTl5fOjGM1+rw6s1qwPcdLk70Z0QG7r5hCeyxLH+h882XihG9Z40QqwKghYNNlpdC9NW8UoZ3XHqiuAkGfs5M43FOz4ATUgHFE6iCLhw5ZRjKz7oWH2IhSdZf6IxgZexrWriWrLBji17nFGxurp+i5QgANpHiUfftDa0I+c9ferjAXQXZvtp39kOLt65diMmAKqoO60uz3srY6aoQVD8AKvZDXFGzLKPg3BJVh0qTkDsy2k2MFqcczjvnPc9oeKeyI+78efLpMsOq7clgGZwhX2mSoa+zigancUAIA+KSBPwop8ZiC+iTEx7xeTRZHNyzLDCOGSX1bS9VLTdpxy8odFK45Fcw9jFx3PLEFH+1GkIeb8HdjmR8VmPcWGyHmP5w6uoPLvlNYIvg43priNDJKb/lrA1jB5hp/j7L0vtHvedgkkGVOX7gKK3GxN2Rkhpu44VaA0hNJfFPGVN5Dod8saDU8meJ9Pf2h6/JE9+iQ0In2fQ6O2PzRd/azaryOqAeJIe1U1hcZkhYU5B4zoujoHNFJIbk/4gTlS8sQSqm0Rw/2IUTXrvoNOp5EAp8yDtm/57ONE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmJ6VHVSV1hzRndMR29ZMmZ3RmtNb24yM08vQkhWR093cEU4VThQU0ZxL1BD?=
 =?utf-8?B?VEdMNGlicWg2dm8xdWRPb3lyLzFEdStNNzJWTG5QdUYwWEEzVmJxbWJxUFQr?=
 =?utf-8?B?TnZpWkQ4Y2dXYnBiMldLT0dFRFBLNkJpYXk1S1RkRlFNOURyaldMbHpZdDVM?=
 =?utf-8?B?bERjV3dTcE9rMU9GMGdwY0pyM1MxU21KQWtQNUdWKzV3M1lyZWY4TE00VEZa?=
 =?utf-8?B?b3U0cGtwNjRLVUdoR0NVeTJKTHhVbUdoSUVuNHlHdjM5THg4enhmdmdoZUYw?=
 =?utf-8?B?VWh1eEcvQjh3N2FPNWZZekxWcUZET2J3a01KTXhSYUs0TXErenFFUTJoVzA5?=
 =?utf-8?B?OU1XVEtWckQra0VYcVl2anYwNU9CNW5uY3I4cVl3NWd2a0tqYzkwRDFXc0xX?=
 =?utf-8?B?ZXNtcmRQd2F1MGtOc0pKeGFvdDFzUlFacHlSeUN6RzZGT1Q3bGs3bFNYQlNI?=
 =?utf-8?B?aFV4VGoxT1F6bXMrSFlNUnBDKzJoakVkQ3lpSFF5SFRRcTN5ekhNa1N3WDZG?=
 =?utf-8?B?bmRtKzVmWFZqQ1ZQK0hlem1ielduQ0NlWmdPbjA4a3JmRzRFT0pCdU05Qmdl?=
 =?utf-8?B?clRIWit6SC83WE50NlpuM09XdEtYZE4yUnhTWTNmcXhzQ3JqRFBzbkhYWUor?=
 =?utf-8?B?QmJEV3RJaE9yejRreVcwSG9ucy8vamFpYzZleTFrbmViWjRmSkw1T1lmem9j?=
 =?utf-8?B?bHloNDdtQVRTV2xWa0NqWFZVaU1IVVRoWktScEF0RkhqT0tTRGllcXdCTFNw?=
 =?utf-8?B?UkVsLzdoTHZjekw4RFU1eVlwa1k1TXZlR29zMVA2dDNPd0F6dXZqZithWVhl?=
 =?utf-8?B?OXh5cVd3N1lGNkVJOUFCREx0U2FxeTBXbmcxK2JaVVVNRWVFUTJlcTNQdEcz?=
 =?utf-8?B?eHUvck1ZOEZ3R0tJQTZHcmVPdTk0QUVycnkzZm91U0ZFT0pLNkR2WVVvczlq?=
 =?utf-8?B?Mzc2WDQ4aUFJVlVySGIxQzVtNUZjVnhSMVBJdWYzNTNJWTI0UUI5dEtvS1Zu?=
 =?utf-8?B?RC9wbXNUUnVQdGFXYmgvMlBMalRJYzJJNXRmeGIvMm5VN01XQUFEUmVzZnBt?=
 =?utf-8?B?NUkvd2RlRVM4YjA3a1NBa2dIZTUyQ0ZMYTlmd2Z6bzNzNFlFcmN4Tjh2WmMv?=
 =?utf-8?B?ZGFGNTh6WE9sR2dWc3BYcWFtOFJFYTdoN1pJMmxib1NMVVYyRTFIWlVoOEZN?=
 =?utf-8?B?b1lxUGdxK3BFak5CWmw5YklRa2FIemZLTjNZcW00VXFUTEQ4NnJmKzJBbjYz?=
 =?utf-8?B?aktkM0M3WG5oS1V4WE9waHpFczRaRFVaNEErU2c0azZLRHlWNVNjMWg1dE1H?=
 =?utf-8?B?WkxUQkpGWUxIaTRSeERXUTJsN0Jqa2Mrdk1BVGdHaTQyUGtwSSt3M2JnZkE2?=
 =?utf-8?B?ajNLaWErblI3dUxybzlGRTl5UlV0dFFQZDVKcHNrdDhmcGlNYkhJN3Q2Uk5Z?=
 =?utf-8?B?V0tVTXVOeFlUaHdMaXVBQTEvcHoxZnhVTXowZ2NRdTd1NGRka2wrU1M3b2Fl?=
 =?utf-8?B?RWxPaVlOR2d1Z0Y0akNINFJTMzFha3pWWnBiK2hjUkJqRnFBdjY3T2gxbzdM?=
 =?utf-8?B?Mno0c3ZhYVBVc3VvRkJRMFlySTNMU0djWTZKQm1NaExwcndDTEx4WU9FK3ZB?=
 =?utf-8?B?MDZveThqVlFGTWZ0andmbWd5cHBreEtHQXdNaHU3anZ2ejNzaENSdWovd3dM?=
 =?utf-8?B?UmNEeXVqOHdGZkI2d2twQ0ZkdDR3NnE2VmZkVStBQS9nT3paNmRTeDFOMTRr?=
 =?utf-8?B?WmhVSEtYWTRYcUlYaTVtTTI4cUs0ZUJSMW82S01vQzR6ZFZNTG5aMWVFOE5F?=
 =?utf-8?B?MU04WjFaZFVqT2NHMVMyNUIyY3ZDL0lweGN5TVp5Rm8zNUdkWE5FRWtwQlgw?=
 =?utf-8?B?M2o5MzRJbUdwa2RvRVpaTUwxVTR5RVd1V2p3NUEzd0szOGdoek9sUXRaeHds?=
 =?utf-8?B?SzBmWktFdGxoNTgrd1RRM1hLNHNSckFwdklXUXo1ODZBYlRHTnZXRjB0Z0xE?=
 =?utf-8?B?ajFWN1ZYZVZtd2Jrb1cxblNsanUyMk0vVmZ6WDN1ZDNsR3A1VjBTaDFTNVl2?=
 =?utf-8?B?WEZ1RjlhaHZPaGlKV1lrMmdUaFdMUmplU1p4Kys4ZnowMUx5OHFQb0tYbzBx?=
 =?utf-8?B?aHNlMUFWNlRHd2NZSkZkTnRobUJPZkttMVF2b1BsVlVRK2ZlUnpldUYzRUpR?=
 =?utf-8?B?QVFra3QwblE5bWNBdFdWMXNlNGhHL0dQVlRYYlBWdHdPd0VKWHNybnZDTWpu?=
 =?utf-8?B?L2MyZ3l2UWl4M3BGS0pRWm50TW9jZWYxV2FKQXlBcUZzSmFBYUxDQU0vanI5?=
 =?utf-8?B?aU9BdTFOMS9DKzNpQUVaNVk0UDJROWJpYmY0eGFUdTV4ZEFkTDVMZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cc2de8f-3608-48b6-f98a-08de9519db5a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 02:52:22.2896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w+tocf1/PbxqppBuIhcDPc+uQhTcw4PF/51pCu3FPDvawVEt2MVnQYYKh5yn6ItcyV+lqKqDO+ktLHGPjLb1zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9789

On 4/7/26 6:55 PM, Alexandre Courbot wrote:
> On Thu Mar 26, 2026 at 10:39 AM JST, John Hubbard wrote:
>> Hopper and Blackwell GPUs use a different PCI config space mirror
>> address (0x088000) compared to older architectures (0x088480). Update
>> SetSystemInfo to accept a chipset parameter and select the correct
>> address based on architecture.
> 
> The offsets in the code are different from the commit log, can you
> double-check?

I have no idea how I managed to scramble and mangle that commit
log. The code diffs are the Truth here. Will fix the log.

thanks,
-- 
John Hubbard

