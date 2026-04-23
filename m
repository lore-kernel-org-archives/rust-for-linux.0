Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010017.outbound.protection.outlook.com [52.101.193.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3BB7DA66
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Apr 2026 20:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776975861; cv=fail; b=ShWVT0DL/fERiCvUvFaZZautN23qiYYKZe78tW/4AFBs4QGSJWhav/ANOugrS+JK6NWcqZ+WrNurFjIYCe6m/z2jGbfPV2NacQVnOfOe/Mm3xhqwi7qbAC3sl1LTjyWs2ovDJw4LIzrZlT0mWlgfD5DEosAAicX3Oo7mJE0CL0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776975861; c=relaxed/simple;
	bh=0TJsSSvX8rT4tXjAEvlXSORkk3zuX+9CkvpVTZf9S4c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=m/c2qLOCqscSYG/Bp7JeMhVI3I5kH5ajWCCiniMSbYwcPgrlfxM/rzQ4ncJB0WnfAC0VRofH6OwjRzRgEnfdLYgNBfaP0M6uhEZCPOXcNOfUB9eB5XzlUBL7uBQRX5DVVNjaTWIOZgczxDn6QhP7cxhiPNAjn0QhQIL1cLJgtd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MPoNO8Tu; arc=fail smtp.client-ip=52.101.193.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MPoNO8Tu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QCanAYIdZ0GIa0Lij4Su2TQ80jB2FkgZxxVTh9H6R8c3TBLZ0SrLyrRGxsvZO0xt8I4HwalqRnxglW14ke1JGOSs4I4x7rbf6XW8UX+LERVKoU5wJHdcSpOP0fYSNsPw5cW6bB2lwCbA/K3T+/NwopkZ7IpNNw7DOFuehFgXFpqLK5xtgpMFRa2vTLJfAZX2aoZrVmgZ5xlu0qCpb1aoBCbnUAb6mtLyc93DXNKmWsk6o9ijiFcAXrFXTtEPQtZNL5vm8Gu6kUsPrPGQZZzmNtKCAXEaab9hySZouooIAK4wgYkblOi6pBrZTgNujISTDr+l3lLuWexPtnOI6eqDOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiB4ZmzxbDnovmo2n6NBRW6Cx7rPiGKVZQN8b7HuoMU=;
 b=Myhi71XBHrawCw2ODb9i8g0gZs0x5Nau+TAQzhTcePLAXyiW6GobUHJ8zVlPKyQJb7EzmapHpuYRJkXD5O9Uy/HbzyVD9YKvEIwJI4BomQhWpFP8TrzGVDAs74a6QeblG8sy9jj/DwJ7BI+bJ48ds1sAhhP0mPNHCPXyNTNqL83RyjVqFKx0p8pmlMmQG1jx7/S4nuz2geI0DDN3XFeMA73MXWkJAlNlPNStMpb82hpZOLI/Z23kL5FA/cQRA6eTVYIyF+purTFosuoB7BcXA2G3dK6ZkcQEYgxUkbt2XGrOYujtb3AQq7OtEr56OpI7/T1XWJ/uIZ6M5VLi++fSAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aiB4ZmzxbDnovmo2n6NBRW6Cx7rPiGKVZQN8b7HuoMU=;
 b=MPoNO8TuvzqlM6I203MEbDLBVH3/7bF+bTAAwWeHxvpfShpKayAdV+Ta4Vrtsn4CBd05hAiduUNxsoz4hj9plNzyBzmLmqslyjXN7/qxzk43LNM1sQqUIRR0C5fzh+hJkkD1Lgy15SR0PfX9eHohLlJED7uY76lk+/NXsnCEnqzmKxN6CiRirsKBE76j9gikI5UvjykE5LcJiQri8atS4eop2awLYTVf9pPeYDxxIjufdICSRyDIKnEKwA1KM7umRuGBfYPDfgM9Sj6AJZB3PRA7DfiBmdkogWW9/5ktcX1knDXIPntu1GsjRmArzCaRsM1l/F7hjywsQ6iaL/+O+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB7238.namprd12.prod.outlook.com (2603:10b6:303:229::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Thu, 23 Apr
 2026 20:24:16 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 20:24:14 +0000
Message-ID: <971a606f-3319-46c5-ad84-a250f8044d53@nvidia.com>
Date: Thu, 23 Apr 2026 13:24:13 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: Maybe make Sashiko emails opt-in please?
To: Alexandre Courbot <acourbot@nvidia.com>, lyude@redhat.com
Cc: rust-for-linux@vger.kernel.org
References: <2476c3b3f06bde0c376e70a3ca30e91f54b544fd.camel@redhat.com>
 <DI05ND6E449C.3TZEG1R8O7N72@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DI05ND6E449C.3TZEG1R8O7N72@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0105.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::46) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB7238:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eb482f3-b9fc-4b64-5493-08dea176499b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	A/3L+slQ5Fu4BaapmJ7SAfRG6lmBByecwEYCODzB9pxMoSsQ7DszeVBWZdO8NxIMWIg/Toa7wa9zxUn2/UvMFOxRStp5WXICooVgidPN+aAuAu6fhNd1MyhSAvELkU+kShU8D4hIPlxOGiN2sTki8v+oJW9kZAtOS6Ylx9l9tR7fBPk+iKoF7G5UG/lx1POSNL0M7d06eMcqm4rVqw2aZdvapay4Elxnl9sDynLUGgZmIjq6CNC7/lmPSYJrNKlp/5uhgMvCagWBtJnY/uJNbpCMAsmquCTtXWJqKGdZCrFzQeZwii98YQ/Cj5L1yZiXnbJL501gO4w6RPtAsgK/Lu6x+/i6lM9QDRv7aEARpdwC6BBhY35trl+ZXlSl/E308tFailWipqWTC3RaccDwInY9WEjWsAXjLCdZwvMUrNIx7MriohNDsrUYdkNPKn9CkON5PJYewPQNBCgqYkEqMjvo/LSUNn0ugtLiYxooDGCm60fWgm+OB2Eht+IUyWnah67yM/GDwfwXpEQWNrYbLKXRUQ92J7yJCFIFn0RJCsutx/6BrbEtMOx2/qSLVEDWBMkIitajkixlvTmXJWn5dGuPMUiPIfBbTK1YOTKiPQoBNpLgD4DUG1Aii7fD+UR00sZ/8SpZXT0kidELC5t4vsK52ZAd+ODIBHughdMOlycQi4KLmvtRKY+Sel8NQVMEZhHzwQUoTmdt8QlRTDGCoU8LIEALo9kP1F2hXJZyuVw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alV2aVg2MEczL1dncVd4V1E3MzhCN2Z0MG8vWSs1OXBxbUVJWnVyUmxyODgr?=
 =?utf-8?B?SjR5cGNLMTRwbzFOdzdKcmFCaExwWDdTSzFkbE96a21FSkNSNkwvOHFtRFpX?=
 =?utf-8?B?ZVY3VnN6aXlsNm1VdEw3cFpuaFVZVHJML1pEL2tpVGJBM2pQTndPQUJtdTQw?=
 =?utf-8?B?VG9yOVluRXhUM2l3TU9xNDVUMjFJcnBoUTJGM2doNVExNUpxTGtwRThOVVRh?=
 =?utf-8?B?YUxMQ0xEMzcrQVcwcEkrRnk0aTBYczlWdmZiejJWN0o2bzRwRTVCZVNuN3lm?=
 =?utf-8?B?bGxoYXh3bTE3SE5CSjU3WUVoNWp2eVlnUU1MczhQY3drTS9CdEY4VzVMUFhU?=
 =?utf-8?B?NmhjM1RheDFKdW05YTF4NWM3Y3FGSXdTVmxGQTBVRGw1aXhGOG1vN2ppMFVz?=
 =?utf-8?B?cUxxbWg2Qi85MjJuT1BtOGNFclV4SSsvRXlCU0NBRUtNQStLSklnTXMyZHFQ?=
 =?utf-8?B?bmcyOGlwMk5sd3lBL3dyd2svVDBXeW1QSWQxTlRvYlJxVXRvcDU5N2dOR1Np?=
 =?utf-8?B?YnFtT3FzMVp3NTMvS0k2dWVhVnFVMjdkYk11TFgzZFJuVUVtL1hUVnFreG5L?=
 =?utf-8?B?QkpZRkkxWEdRS0NNdWM2bVgzOUZnSklGRTUveER6YkZCUEhiMnBFOGptTzZQ?=
 =?utf-8?B?QUtQMGg0SWV1a0svNG9LbXgzOFZoVzdsNXE2ajVqelNZN1ZwNFdjSFQvMDNz?=
 =?utf-8?B?dHhJRmc5TFZabEZ0bUdxTnQyS0Jrc2pJdjdINHg2MGNtNndxOVVoL2Z5MkZT?=
 =?utf-8?B?eUNRTlZDcEZKeFBPZ3dUQ3JTcXdtcEp1QXlRaHlHQW5SWUNTbDJROVZZTnoz?=
 =?utf-8?B?MGJ3c0VjcUJaQkl2dnNYOGVMdlZJRnM2d3lxT1lvK2poeEZQZnp4dmpGbGZ2?=
 =?utf-8?B?a2ZVZWtUOVVBOUxkVVluWGhaT0hwWXd0UkExUXV5MS9Tblh4S2pISDRENDQ4?=
 =?utf-8?B?dDlqM2RpUkJJZy9tVkpqa3FQMmFBMEd0V3kxS3c4RkJqRUM0bGUxdlF4OHRp?=
 =?utf-8?B?OEFEbHBoK0pYcTRrR1Faa2ZkTTBQa3RxMk1GMEd1REFnVFBHRTh5elQ0RW94?=
 =?utf-8?B?RS94aVMyUzI5QitlbkthaWxvWHJtQjliV3pSZUJtMWM5MC8rbFNFT01BUXZP?=
 =?utf-8?B?cjBRRzZTL0JvSGpjUDJ3R3g0U0JFN2FMU0RFdUd4bDlQeHl5blhzVGYzRVZ2?=
 =?utf-8?B?QmZkVENzcXNCYWV1VkdxWVBPMmM3Tld1S0NLZnV1K0YzSnhKa2FOUE02Nlha?=
 =?utf-8?B?NjJXaWRGTXErQlM2SFd2MnR2Y0QwUHJjeWZtOXBEdVRNWVZxc2RnaHlsdENF?=
 =?utf-8?B?U2t2TzI3Vk5aaWJkdzRLcGwrT0VISXlaRjdXeGQ1cWs4Z29tQ1FuTFl6VGFm?=
 =?utf-8?B?SGJEMTA5TFlna2xmbE0wc1JkdGZZRlZ4RmNCalJ4blVDd3E2SVpxYlhEMDky?=
 =?utf-8?B?OTJZaGREaUYrdWR3NXFpazhTWGVXWE9ZOVV4a3dzckVITkxnankzeHJhVUlQ?=
 =?utf-8?B?dVJ1bmhmZXMzeWIwQXdJays1YXZHc0t5Nkp0U3EyV0hwYTRsTDBibXJlQTJs?=
 =?utf-8?B?dXFHYmF2VWE0czRJSkQzUFp5eEVQNWJyS2ZwNnphOGFuNnJ0bTFYbWRRbm4v?=
 =?utf-8?B?SDB4YmZ3VG9PWEcwWHV4TXFPVTVmbEo2aHJlNTNIc1RPcGpPWXhXRmVzVDNH?=
 =?utf-8?B?UVdYTnBES0M2RmNUWGFxa3RiSXlMcFZQVDJmZU9qZ3ZtTFBscnVGY3k0TGt3?=
 =?utf-8?B?UkQ3NTluYnFUaHRmdXlVeE9BRHNoQ0Q3enZOL3V6RENUVFFrSjN3eFphMFJ3?=
 =?utf-8?B?WENtV3FteXd0cEJFNzFwUWpOTjFCVVVFV3BwYlo4VkpTUTR3UXNLRG1iVVpR?=
 =?utf-8?B?ei83NXpZRGNHZWZJWlBqYXdjeEM2Vm0vUVBJT3lIbjQ0WWcySmZsNUJJVlRy?=
 =?utf-8?B?MUUraHM0SU9pTlN3ZnhCZjlDRW5CZGNGaVFRUm0wKzlqT0dGK2Q5MVh6Rkor?=
 =?utf-8?B?ejIrakZMSVFIM01nZTJHU012QUFpUURHeU9xeUFNNXRVbGg2MjM2V2ZENkpt?=
 =?utf-8?B?R2Z0YzJjRXBlOW9FRlJXUFRWeE0vdnBvQ1QvMndIZUFYUDhLMzA4VkJKV290?=
 =?utf-8?B?aUFxK3UxUFNmTVgvMEFLQi9DRDNuN0FoRmRNaTV1N3l5MzVqb1RuSmxpM1Nt?=
 =?utf-8?B?dDluYTgyYUNNWHA4ZjJQUFl2enpNWU9xZ3NZNFgrbGlqYkVWWkp3a1lNNHlH?=
 =?utf-8?B?ZlZTbUNuTDRvTGJ6aVU1V0JHdm54QWkvM2R0cWFiWWpqQXFNSWNsa1RsbnhC?=
 =?utf-8?B?L29nbVRjY2ZxeFVXbTZXSFVHNTdRMm1zMTdYa0w5K1JkYStMbE14QT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb482f3-b9fc-4b64-5493-08dea176499b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 20:24:14.7992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wlBBrH/Sui3joRUCcxrnNJLuLc+/b9xh2iwbE2dUtBaN7WgsrIQn5A1TB8GGjJCUG5feWd+NWbHBf+I02zOAFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7238

On 4/22/26 6:48 PM, Alexandre Courbot wrote:
> On Thu Apr 23, 2026 at 10:10 AM JST, lyude wrote:
... 
> I agree that this kind of tool should be opt-in. Maybe we can make it
> such as Sachiko reviews are only sent to the author of a patch if they
> also Cc'd some sachiko@ address that acts as an opt-in?

I love the idea of Sashiko remaining silent, unless it was specifically
Cc'd.

* Developers prefer tools that can "pre-review" and catch issues *before*
they post publicly.

    * checkpatch.pl does that.
    * sashiko could do that too! It could be triggered by a direct
      email sent only to sashiko.

* While debate continues about the false positive rate of AI-powered
code reviews vs. their value, there is *no* debate that the rate is
high enough to bother a significant fraction of kernel devs. We need
to respect that and configure the tool usage to be less, well, annoying.

This is important.

> 
> Sachiko can still do reviews and post them on its web interface even
> without it, but the author would not be explicitly notified in that
> case.

Yes, exactly.

I'm very impressed with sashiko, and want to get its feedback--in select
scenarios. Not on every patchset I post. And I believe that this is a
fairly common, widespread preference.
 

thanks,
-- 
John Hubbard

