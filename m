Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020117.outbound.protection.outlook.com [52.101.196.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE8C10F1;
	Tue,  3 Feb 2026 16:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770134529; cv=fail; b=gOra7yl1IwsmENxkxGiiWL4WGqZhjAp6t2yKIbElIe+h5Ku8xUZ0QHyiC2vmC0qNkYgjMfWEX5RqMBvlG2Z6nhn6LPRkNEaM7pybI3pv81yrjW8y+YZbfWuTtehx4PFAA6biEhlUytPqdzP8ZTc4F1TjPXslm/rWBmn44fnthwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770134529; c=relaxed/simple;
	bh=XkEDvEoOl3g89J1cWH3DnDV0Nm5p0Czp4P6UQTIyp8w=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=KRnn4S1Tj5jHs9Dyu4bP4R6bltirDu+V05+EZR39Nf1sMQJzPst53wjoFVK1Jt/U+/cHQLWvVcWKE/AasnrKB3HI6GGwDq25SbStQpIdB+YWgYviFhb95tcVsqu9kPBZWuctfkydBZHovCBsT5eZiAT5fxAgF4q8Skp7Ym19XYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=GM7eNo+C; arc=fail smtp.client-ip=52.101.196.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="GM7eNo+C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sOzOpEFZbk6CfAg9glPWLpT/ZHxnyDlqo8sCwh9euxD+X6iwmRoPMD38s2PVHRBSSpyz4VO3zGuCPp/vViN2FEASaGkQGWUA8Cs2KHj3slOqKLnQ1Msz2FhZawMUzgRAcpfxJ+7H+3xTDW6odYSly3zLZc/76DLvUwHmnRqmRAVGxrAN77e00ksFQTCESG+cm5Zj7E5TEu7CwJ1GdfHmP/8DD0sx03ejI936SaXfqn0AU/HYTebv+TOJOKI+hbhHUR7fr6AW+uaTcYXoEoWF9HKY6qIgXLY78BoQ0g8pTY7rmquS0pjCTvmrdMJ7GAynEPlYA/nhtrwvBpF8Xk2iuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaHal332y6eyo6x3ap14o2o1qIcEPZWV/IjPyGAEg4E=;
 b=r62f8gwOIXkX9BbOZ2V1BIGTP+7Vjkfkmdwq43kEzux4byr13Z4tmdRTmtiBxgOQJj1Wkn0qMh2K4QIjOHHnB0kJ+bftzMklKQ39DGynROYiNKg3lRdsP/4zNRK1hSgShpPhVA9v450L2iWU6B7sX/VmIYwpPGva+xGltH5ePIg6f8akQa2yvwEq1KV4tXUQRuutebLRaeZHkd+nx1yir21jlSuqJB9y7Qkn3bwAc9FN7+HD7u/RHObbELkJ3sizP16Sfnn9ErJrjQjqo/FGocs8Re/NdLvp5lAXdMTVZuvB7DuEC7GgzdA/Ic4frx1MVVO58EYvy2+9cjU1WdgTVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaHal332y6eyo6x3ap14o2o1qIcEPZWV/IjPyGAEg4E=;
 b=GM7eNo+CNVc3sl0gAWsfouP16aAjzAX8JyWsNjAfsad0AygmPBrLGAw0KVZyeq+NLQ1K8JKMeGpaBob0dFbqs4FZ84lJev+a5wvDFbrspePqC2Dj7JfZvCpGjw17ggl2XPxnemSYT71wGMNz1Jvpo1TFdYC90s6fYs+QUWFrAcU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB2513.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:98::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 16:02:03 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 16:02:03 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Feb 2026 16:02:02 +0000
Message-Id: <DG5GBHGZV86X.2XKAU6WLWCL7Z@garyguo.net>
Cc: <dirk.behme@de.bosch.com>, <joe@perches.com>, <ojeda@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] scripts: checkpatch: warn on Rust panicking methods
From: "Gary Guo" <gary@garyguo.net>
To: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Jkhall81"
 <jason.kei.hall@gmail.com>
X-Mailer: aerc 0.21.0
References: <288d4aeb-af0d-4d50-bb0d-7a046abaaf10@de.bosch.com>
 <20260203152542.45017-1-jason.kei.hall@gmail.com>
 <20260203184933.23c92f8f@nimda>
In-Reply-To: <20260203184933.23c92f8f@nimda>
X-ClientProxiedBy: LO4P123CA0651.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB2513:EE_
X-MS-Office365-Filtering-Correlation-Id: 63dbbe2c-4336-4c1d-4c73-08de633d9225
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VjV3Qys0S1NwYVNjQ3cwc2dRRm1UNEV0aER0M2NzZDlwb1VMa1Uzd2tGUFlV?=
 =?utf-8?B?aXFNNytJN3pDMXNzQXJZZm0vRTZ3QmFKWjBRdEUwRG0rNXFXcGVZRk84K3Nm?=
 =?utf-8?B?R2VYN2s4a29mYzFTeEtlTG9yaEVaclpOamVXbEY0ODJpc2UzUXFndkdPNTB5?=
 =?utf-8?B?enM0WlluNTNtdUc1ekJJUjg2aDVRelNOUndNZzFhMzhGOCtBekUxVVQ4WUtQ?=
 =?utf-8?B?aXdoRGNvUlNoaWVLNFF4OG5kbzhQOXZTRVhJQWkvRUlmdDdwYU9WTWJIc3Er?=
 =?utf-8?B?SE5yck9QRXZUQ2J0aHh6dGpFQ01GcUc3NlNWTnNqYkF5Rmk3VzlaUWZSYVQ4?=
 =?utf-8?B?ZjUrckNwZ1NDbXU5bGtRaFozZzFxa1Yyekg2ZDR0VS91TnBidlJMM1ZySHh0?=
 =?utf-8?B?Uy9nWXpLTWthZjJFcm5nY1dpa1BqR2RQeE9HUzhQdlVLTTFlb2VOV29xUTZL?=
 =?utf-8?B?VUl3Q3lqYzNzOXBxZzF1eElWeGRGYTdMMC90cjc2L1BuelpsRytJbkljUGh2?=
 =?utf-8?B?Mm1xV3FnK2FxVHhxRCthb3FKMEZnUEVnSnJDaWF6Q1dOQU9VVGhSOU13R3ZX?=
 =?utf-8?B?eWJRR3ZGQzQ1M3d5WDFuczVTbGh3MmFZRElyU1gyVWRTa1ZMQVBGUXkraW9M?=
 =?utf-8?B?cENXOEJ0dDlBZkF4YldjNWduOHg1QXhWeDAxa3k4cG1jd3RyMFR0V0RrZ1gy?=
 =?utf-8?B?R01zcHdWb1YxckxseFhrSm5GQ09CN3JuemJqak02NHlwbm5CUi9IUjZNcDZL?=
 =?utf-8?B?elZNUVpSS0xyQWE4TzB4ZEhDLzBtUy92bE1ZUG1aclFWVHAxSmh3dlVEUjcr?=
 =?utf-8?B?b2traVluN1pBeTEzNGk3Qm45ajJRS2RBUnZvUzRiL3BRYjkxRzl2QjBTQ2VB?=
 =?utf-8?B?cHJjajNaTE4wd2hoKzVQckNJblBEdmYzSEE1TVFpL2FSbnhUa1J0a0RJMWNC?=
 =?utf-8?B?cTZRdDRpdkQ5QjdkL2pwVzRwQzRUUXF5TUtSd1Jzc3Zld0FqL2txQk5uc0d0?=
 =?utf-8?B?QkFaZXhHSnAvbHZvNWR1WWxtRWgzK2NiUEhUMUw5TDRUTllmQkZLd1UwUnVN?=
 =?utf-8?B?SE5Cd0cra0hKMXRZazErd0U0bFRIam41bjZHMzl0NExxTnJrajlmVWR4Nk9l?=
 =?utf-8?B?ZjZ0QktvMjA1SzJ3a1VBd3EzMmdkdXZMQ1JLZXVNSjJxY05IWE9lNSsxRWxo?=
 =?utf-8?B?MHE0WjNiVDFzbHlrUjRXc1JmaXgwTHBCeWFmTkxFSFB4MGNBdEpieFVTQWZK?=
 =?utf-8?B?YUlXMVRWZkw5aEo4MnJSQnlzZGxxMWZjblBxbk9NQ003STBMSGJpa1NuRk1a?=
 =?utf-8?B?SU96cTFVejlLWnR1VmZxR3Q1TjlaVHB4YUxXY1VCbEZzeEN0eHFvb0dzYWZO?=
 =?utf-8?B?SHhEL0czbkorVUM3b2FXVTNEcWM1c2JWNHlhMkJTOFc0Ump0YXE4SnBoVVNY?=
 =?utf-8?B?YkdnS2k4U1Q5UTkyTVFMOGhEKzA5aml5KzV6SkFjR00xUnIvU0xuRDBtUWhq?=
 =?utf-8?B?bnBRamNoMGhJSGZGQWxPb3NYRk5FVjA5ZmVMQzU4RnlYWEx4NHk1QkhKczE0?=
 =?utf-8?B?YjVZd0RGQmd2UHcxQ2FYbS93SWd6cENwNmFYVEF4Smh2aEw0OXhTWGw4d1hV?=
 =?utf-8?B?MEc3VVFhd2tpOUlGMXlscU1kTXhmOE5tblZaTWVVTW0vemVibGxrUjZ1NHRU?=
 =?utf-8?B?ZVNOQU9xOGlIMkRJS0tudnA2b0JlVkVOOWdhdlJJdWhhWHU1VitrSUtFSklt?=
 =?utf-8?B?cUZ4dEl5dm42TWlVamsyeVVnWVFiMUljVkpkbHBGVEZ1WFZ4ZlVNUnVUc0hj?=
 =?utf-8?B?cTF3SEZHWWtWQmpVRk5LcW9DRFFqVHJHdlJxQzlvbXJ4SE4xUitHbWhMRFMx?=
 =?utf-8?B?L3FSMzZmL1ZUWjd0Z1A0bkY2RWhGRHhyQkZDcHc2L0c4bStZUTYvSVFBcGhn?=
 =?utf-8?B?aEFRMWl5cHV2UXBDdytLemhyUW4wWTJRSStEYkkzU3BzaXF1eWJkUTBTbHBl?=
 =?utf-8?B?RzFSOStPOFJiYTlFU0xwTGpCblhHRFh0dmFFSGJjSVFadFVJNVJGdGc2TW45?=
 =?utf-8?B?ZS94Q1BzdWhqTjg5aGp3blpCb3RvQUJyK1NDN0xpY09IQlovQVNCTmg4aGI5?=
 =?utf-8?Q?/d4o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TllLU3RrWDBzNXNpZmliTHI0dE9Nc0srdGlPYTdZMEpCVys0MzNtM3kzTGtL?=
 =?utf-8?B?eW5qK1J6OFlRZkE4TmhxMHRFb2FVV0ZKc2NVaXF1UnNuQkl3VkhOdFJ6Si95?=
 =?utf-8?B?cExNR3MrQkowSVBJdHhGejZ2YnFsOVNWNm8ySS84eWJYOGJiNlIzSzVtVGpS?=
 =?utf-8?B?dVhpWGIyaWdCUDBZWElBV2sxRmpybmF3SzBHeWdUV2lJRVVwZUdZUHdMUGNT?=
 =?utf-8?B?Z0pNeXpNeUkycEZZS1dQWTNnQjduMDZFMmlHUWFad25LUDV5NlJJOG1PaHA4?=
 =?utf-8?B?SUZJR0JlaXdBMzZXcStENytrOURrTU9WRW41dTErUy9vUEdLRCtSTy9uWlRM?=
 =?utf-8?B?aGxTdmJEb3VDcUwzQ0Jjc1BFNHdTdXNDRnZmRjc0K0hUd2RRL04wSUJkNTR0?=
 =?utf-8?B?d1F2eVRUNnBiakw2Q3N1WEU4dnhLMk4ydFRHcEpYQXMxOEFsV0RaOG9kd090?=
 =?utf-8?B?L3FXbyt5clVtRFZicDQ2d1hjcW9RWWkzMWdYN05rOUszM2FKSmpEWjcrY3VT?=
 =?utf-8?B?NkszM3A0NmVGQmx2dEg0NnJ3SUhCbHBoazVoNUpTV25TVU1XcFpSUmtWaHll?=
 =?utf-8?B?UmdIQjY5Nnk2YlVCVmY2dWNjeTZlN09sb1VmUjQvT3FNVFFNcDdaYVZBd0Fh?=
 =?utf-8?B?WHNPZHBSbU01YnY2ZmxUOGpWR2JEc0p6VWpnNjFkZzBCVUtFY1JMTVBwSUFh?=
 =?utf-8?B?K2VaOWNnT2x1SkRFTHc4SkR1QmxWeFc0eTY4STM4SVcyR3VNQ3NYVnV0aHNz?=
 =?utf-8?B?dVZyNlZJK05SYUJueU5uMEFLUjdUMXRhUko5K2tNNjBxUnRLUmtpSk5lQm5P?=
 =?utf-8?B?TnJ2V21OWHhjenBKajNwRGE4TmZGRjZwWFlLeTRieTZ2WWZ0S2o2WlpEOFVx?=
 =?utf-8?B?dzlaUzh0ZjVqTDJ0bjIzT2w3bjZrWnJ3Q29FdmJnM21kSGZlenpHZnFJdkpl?=
 =?utf-8?B?OXVadWdFOVQ0Vm0xb2dwZHpKZ253Rnc2bE5pNitPZzZkY213TXFFOW8zSmxh?=
 =?utf-8?B?NGZ3RFpoVXhBOTBHeFpHZDRYS3piV2hjT1R1NWE1dU1lMU9ucnJYd25semMz?=
 =?utf-8?B?OTU1d1lwdjJ5U1NNY2JqSm1GOVJ6MWhSZ1RWcVpla1RYS0RGR1BzREJ6WVZD?=
 =?utf-8?B?UDZERnFQZFgxT01pdWorL3hCOUdVYzlEMGwyMlhVRG9LcTBqYkZxNUV0cDVo?=
 =?utf-8?B?eXNMM1p2dDBOUkk5M3dDSkx3K0tzbE1UWDFwdlhZOE9BUHZGYXJXZFVuem1J?=
 =?utf-8?B?NXJWYWdwbHFFN3lLYnBrcTlDVSszYm56VzdyU1hRdVZZN3Y5ZU1kTklBMm9h?=
 =?utf-8?B?V0h5bVc1eFR6MHBYM0UrUWluUHZ4SUJKQXhHakhpS0kxT1FqNzkvNE1lcFcx?=
 =?utf-8?B?RmJIYmNHeXk2elBiV3FoNjJ0T1NheHRoR1MwTUNsV1UzS2M3UE5PTGdQRUVt?=
 =?utf-8?B?QTlxVlFBZHdrc1BtM2U1bjNPSnBJenQwbnpHcnZPUEQ0MW15QlZnZncrK0RE?=
 =?utf-8?B?YmVFUXF4Sk9IdWJUaEpHb2NoRjQySjI2VUlFVXc4VmJ1bVdMS012cUZzeU1V?=
 =?utf-8?B?VlVqZUU2b1pPZnN0R2xzNlg4OThQb1NqdXQrYjl1ams4clZleW9OY0ZPalM0?=
 =?utf-8?B?N21xcDhzdDE1RDRNMU5QWFk4UjZvVHJrK3o0cHhOTUlUYUUyU1QzV2lNL3l5?=
 =?utf-8?B?U0tsUk5XeVFrRXpVbUczRDI3eGF1QitvR21MQm1kTXdaNHhCSlJrbTRkZm4r?=
 =?utf-8?B?M2cvZCtLRTdQSUQza21Zb0gyNlZZcHBlakpsSTNqZFBscndteERIN0dOK1dX?=
 =?utf-8?B?ejFDUkMyQWdoTngzM3hHMEE1cXJQYVhMS1d5U0dnRE9iSm1pRUl1ZnNWeFpi?=
 =?utf-8?B?UVBZQXdMODhVTmVVSTFCMm5EOHB2M24zZG8vd3BDU25NdVRnOFBNaXBjUzgx?=
 =?utf-8?B?WHMvOW9vdkNtTXlDSEpMMEpJKzFLT0lTOEJDUTd2U1hXbHI0NDEyaFQ1aGd2?=
 =?utf-8?B?T1VFRjh6aE8rdzVFOFB2SnRyZEhWcDVodkFvRGxmOUZ5ekNJWkNDTnpuY1Fl?=
 =?utf-8?B?am1zUTVIczhQYnFLV3hMRHJrT3NYUEZnaFdjTVFLaGhrVW5aLzB3TDhHaWtN?=
 =?utf-8?B?NGlOaFhlV05uV3VlNGdaQUJHNHNMbUhiTFZhK0wwV1dPVHN4TC9BUXdRcWhD?=
 =?utf-8?B?OEFJVG1mQ2RxUFdMUFNPNUF6Kyt3SS9wSUtoVzRGc3I4N3hxMk1GcW1yenly?=
 =?utf-8?B?aUFvdFlvcTd5VDJjc1pMSXVWaHRKSitNdk9OZ1FLR2dUaHcvUmNZUXNWbjNn?=
 =?utf-8?B?Y0FRNUI2ZlVFVnlMdzJueldWOWh2UDBld015ZVExMm1Ed2IzTHhrQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 63dbbe2c-4336-4c1d-4c73-08de633d9225
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 16:02:03.0404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HfVbXBltQgxWvKJz6py+mGxl3RBjFTg8LBF/ME2EARcwPIWiRATKZGlHgQEskrEJkVYlJXzwwbEEa9A/nFTeNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2513

On Tue Feb 3, 2026 at 3:49 PM GMT, Onur =C3=96zkan wrote:
> On Tue,  3 Feb 2026 08:25:41 -0700
> Jkhall81 <jason.kei.hall@gmail.com> wrote:
>
>> Nice, emails sent from gmail get automatically rejected.
>>=20
>> So, Dirk.  To satisfy your concerns the current 10ish line
>> code update is going to slowly, after many more emails
>> written in nano, mutate into a franken-regex-perl beast.=20
>> checkpatch.pl is already huge.  I'm not a fan of this=20
>> approach.
>
> Me neither. I wonder why we are doing this instead of using the
> unwrap_used and expect_used linting rules from clippy. This would
> catch the problem much earlier than checkpath since many of us build
> the kernel with CLIPPY=3D1 flag.

Because it's okay to `panic` or use `expect`. checkpatch will just warn you
once when the code is introduced, not continuously in each build.

Best,
Gary

>
> Regards,
> Onur
>
>>=20
>> We could just not do this. Right now we are trying to
>> get a warning if someone uses rust code that can cause a
>> panic.  Software Engineers are smart people.  What if they
>> just don't use rust code that causes panics inside core
>> files.  Problem solved.
>>=20
>>=20

