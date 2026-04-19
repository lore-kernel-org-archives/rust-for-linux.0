Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021132.outbound.protection.outlook.com [52.101.95.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E734D224AF9
	for <rust-for-linux@vger.kernel.org>; Sun, 19 Apr 2026 19:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776627292; cv=fail; b=dBTOj2gPUEnj4EROOdYv2W93LsyJ6BJsDCHz3FM/Q+2B6EKDpj8ObWJaQQGsohpm0vftvUzlM7bORVvwUYeG6nJ/ZdD5uTE7QZUdUpEt43KbVJlMOATZeKECurZs7NCJHL/7ekhV+PG54UCaANQy2mOK7D7MjTeRI8oicJ6e74s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776627292; c=relaxed/simple;
	bh=IpFxmU1t0w5oJASFxzA44FRbYElEUrF0va7yK81fvDU=;
	h=Content-Type:Date:Message-Id:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=o+bJsVbfx0mY+DAgwZE+Ez+Fk95mGF3IfddtaCtFEgpY26gTjwOVneeEzqf3CdDKmx8gQh3j+lOo4mzPkZhPcKLC+v5tjMWBCQT1ChdISUKVr2GLu8aohr5sh7BSgV9DJx8Oaydlpn0m4DmIZBXKKFQCPBTNemR9APeSGlSLOWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ecL/uG/Q; arc=fail smtp.client-ip=52.101.95.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ecL/uG/Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ptKx+opFROKslrAjM0VRKhEz03btzCQkyyNhdfk7VCCmgfCCov6TPfW7puTAekdI/O74wO38H79t1IsI5+Raw6yxlGRzTl0VkF0vxmul1hHrwBe7k3J8/lSu/waCfLhbzoZNXv8wyxntQv7S/BVh+b7omb7brhYhC/omR06FH1wV/rXLkmbWYJ588e9Rb6Lj2+tiuTkbfjaxuEmxfHNGG4+jYqPUmGh93cHf7emVGU2s/msu5NmQPwBURzT+phNXbf4Ggguq7qIx6GuZ77gqniBadrTW1PsqcDzG9+qbqgUf7rhKHBeQfk+IH/emXnT/VKC/0FB//pZZqaLc+wxy9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UlK9oI7HwHD+R13d9SZH410JKrQW3jhPwJho8ICR6ZI=;
 b=wjpbcYqzc3zH9ltrwnJT1+9A3EGIjc+MitVISouy9mz/vN1tLdhvmVeud3yRqQ9SUyzfDAPgOtMIUQDoERIEw5tOnZWHaJlpby5OdPlGCiWXJlcIMUSwpBUcnFkx9sTYNmc7RS7Vi8c4HwNlaXJJ60rxW6NViqTAGmwLEUVDLoVe4Qz5c8gU5IRaK+L/ihNT0P/ZUr5RnzBbpG/9GBU+NhsWnmDZBhFof8ok+Rri/Q34LI5Ltc4E2gvRKyYyQM1M25x4fMPFipzGEQw9kKgzktIiByaxauvNs66xDxMnL5/2wTiqeWfrJR9N2ZLdx4JFklId4VBqPunh0UtK+ZrIDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlK9oI7HwHD+R13d9SZH410JKrQW3jhPwJho8ICR6ZI=;
 b=ecL/uG/QkrSzHqLr0Hapi2vFCiTuXpjsKP/261wJSS2KqPTShau3wrvP21jjwcxFHfAU7BnS7mjkm/K8Y/+vxDIN4aXRf8LGeVGtttaHuHyvyqkFAd0Y9+prruYOF0dZ40Ixt/MzHXYRaFT6hdBh2zPOMjzunmuCr3z9lGT4Wto=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by CW1P265MB8446.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:26f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Sun, 19 Apr
 2026 19:34:46 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.20.9818.032; Sun, 19 Apr 2026
 19:34:46 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Apr 2026 20:34:46 +0100
Message-Id: <DHXDT7TCUGQG.29SCP143N8NBV@garyguo.net>
Subject: Re: [PATCH v5 1/6] gpu: nova-core: use correct fwsignature for
 GA100
From: "Gary Guo" <gary@garyguo.net>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Gary Guo" <gary@garyguo.net>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260417191359.1307434-1-ttabi@nvidia.com>
 <20260417191359.1307434-2-ttabi@nvidia.com>
In-Reply-To: <20260417191359.1307434-2-ttabi@nvidia.com>
X-ClientProxiedBy: LO4P123CA0293.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::10) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|CW1P265MB8446:EE_
X-MS-Office365-Filtering-Correlation-Id: 2687a236-1204-46a9-808d-08de9e4ab6c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZB4/lhA+4XK//LBw6KyuK61R0CDWG0EOg2DV1kyN/5OTBkqSc58gZFawD4pcXnU5ctQLfdGR+yvbxF6TwTaBC7GMfqKs97Z0cSAYkATqq9n5t5bFtlmiQZ+W6Dgj+N57gn73moYx9IpiptargZr/8FkvWuja+TBdminyzvbrCmNC+kqCCPJiV5Q60eO4iTCEkKKEToP/AVrq/smCDpNmFnenfCLlqmAUQKs8vSKqFcwDxpdf1L8xCU2ZMn2hK7b8NyAHjTaYXqeGj/+IIxNAsVSsEx1Igl8DR3DhBb0vi2fAOdVY5txU7c6lH0NaWt93PPbnimd/AO7R9sv9sSPUNeq0OcCDKNDJ72Kr5j9PtZ9uKNJWFVoLNCukSnBpqx/Gz8yRhbMtOiMxy5Jcu//aOsohVgipgTyclRdx0iVbtRIcV5DZXQL/Mxpdt/3z0yS5fN02sD9v/SaHFSTHIq2QJKFP7iWq4J90oRYq/v8O4UPMxw/hpfdIx3tI/F/ei0yEgAMOFEQqBfOwvWlVO0g4A9xmZmyxwt80OB81nZmV7AtiPMZKzbt5QzQ9yjKGz33HdNmOdQ1iOsHTsyTOj+hfQeFEtm+wZ2GbxWrETjS1LZKeZ01hJU4xi3DOiX9araVmHyAom+NNUjM1lee0IxkFyKhIUp/YomZKOw93zoJ2W1nGiXpY/D6LFjdHx1tDIW77+3bqK2rIrUn9ChMiJg3tWCHdEkX4EeB3/B++GE8OgK8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzJXM2s3ZEE2Uzg1WmxqQ1ZjNHJOT0lSS3hJaTRYUzNpbDdaSHZMZEFrL09S?=
 =?utf-8?B?ZzVrRFlUTEdmbnYwL3o1OHREdStBOUIrWTk5dytuYUlBV0pWQ2xIZG5wQ3Fm?=
 =?utf-8?B?VHltaWVOYnpCa3VqVmJhTUthYXV5VHNSQVhnNmxzZUEyTGVYRnlFVnFCT0Fu?=
 =?utf-8?B?ZFFhdHhmVlpFRGFzdGhydWw3WVY1QWN2Y3RJOERVZlFQUG91clhxTC8vVWdM?=
 =?utf-8?B?QzE5M0RHNFBKOTVQd01UMlVUMVIwaXBWLzBmeVQydXpxYUxYTXROdmJxSEho?=
 =?utf-8?B?dUhvN2pPMWJiV01FcS9sWURXUzFYa0hmYjY3OWd3YnVLbW00TXMyWXQwSkQ5?=
 =?utf-8?B?dUdVNEl5V2hJc3RrOFpWOWRsbjVFM3hFZlFEWGRGNkZ0YkhBd0NaMkF3MUVQ?=
 =?utf-8?B?eE9KRFRiR0hGaTNlODh1bCtZQ0RkZUg5cytMcyt3YUdQWE9sdE9jWHBSNi93?=
 =?utf-8?B?b1IrUmM2cFF0MGdCQVlxaWxPQURNRERuZ3gzMGE4dmpPbDFsTzFiRDdDRGow?=
 =?utf-8?B?SExmM2xPQzBrakVKS1ZnSFJtUkhuYndEQ2lXWVlMVHVxaUxWTjhIK3p4OE0r?=
 =?utf-8?B?LzJjSTN4N2VqdE9XZVZOK2RLR0dRdllwZFJkQ2ZwTDV3U0tRcFhlOGpkZWxY?=
 =?utf-8?B?Ny83eHR2K3hEWWhvYU5qUFNtckV6UzBIUmtvc3AzR0F2NkVDeGtabE9PY05D?=
 =?utf-8?B?Z1NHQXRVRTdBS2RNNVhJejBacHJQbVpZSERubVRYT0Z5YjNpRm1yV09aQnJD?=
 =?utf-8?B?MDMyWk5vOFhmRlExWEYyYkFZclJtdGRSNlB5T1NBQmNKQ2VYa2NXNGRYbE1W?=
 =?utf-8?B?bXFFSm03QVdzMGVHSXZHWS9NTDMyb1ltbVNmSUV6Y3M4UG1JamFRWXJVczcz?=
 =?utf-8?B?alUyT0xDbksxeThKOW45NStjVEYvT0lLcUF2WXJWdXRlWHB1YkJyc09WZDFk?=
 =?utf-8?B?YjR2OFU2WlFZTkRJdG1ycDcxTkoyZ0JRbTRDRE44Snd5MTMzYnZkTHpNeklk?=
 =?utf-8?B?VVNPRllRbTljeDBrWEEvVTM0S3N0bERhUWhreTQxd3VCVFlTVWtKSkFSaTZ5?=
 =?utf-8?B?YjJpQkhISG1BaFBJWWliWFpBSUlrYWpFYm8yV1FveStUWVprSDZlZUVKKzZ4?=
 =?utf-8?B?M2NwbU90ODhtL1BQL0s0c2hTYVZKbitSQnFWR2VOd0xzRlZvdW5lcVlBcHF3?=
 =?utf-8?B?dGNZSks0STMzVVZKellaanhvZHpGRDZNU2o2YzNtS3JIUDRydHZ2ZTNtZkli?=
 =?utf-8?B?cEY1NFlOZXcreG9xZ1hxaFA5ZEl5cDNId2pwYjJhU1B3ZWRGNkk1WjErU0NC?=
 =?utf-8?B?cWN1eW9OMEhaVDJheWpyRzVKOGhvREVpb0JsYWwxcURBblh5UTNlYWtYYUdi?=
 =?utf-8?B?dDlxZFNDbXVKdmdUcTNEUmcyai92L1VGR2pFVk5kdlhTZThzUEpHVDlnb0ht?=
 =?utf-8?B?M2x5RTByMmRiRk93a0FKSXZ3czRjTEpYNmUvQTl5bG1pSHFORC9PMy9oY3lq?=
 =?utf-8?B?R2dwckdxMDBqSUZHL3YycVhhRmlLWUdjb0FwNXdPZEZyY0R0NHUwL1dVSjZz?=
 =?utf-8?B?RzM3Zm5zNCtRM2pMdzMxcTlDbWcwS2JCd2Q3WE5vQnA2NjU5M3dTZUNzNmQv?=
 =?utf-8?B?N1BZZlRhTXpyRHRBa3B4YVdibnhvR3JHc3ViRFdDSzhjUXhQeFRJTjMxbFZ2?=
 =?utf-8?B?WS84aStZbncwYTlaZWRxS05YV05QZ05IVlhsait4TlNtb2x4NTh2UG9KV2Jo?=
 =?utf-8?B?SUdOZXU2WHRyUWhSN0NUMXdRT3k1VlROdVU4RGlVUWwxUWllWmdUdGc3WSs3?=
 =?utf-8?B?L3Q1Nk16YWlxdFhvZ0tlaWFaNGRGSmdTNWhrT3RyNTRSbVZHaFkrZGhwT083?=
 =?utf-8?B?TGdrcmNNVndQWVNaK2RmdlcwY21QRHpPSzUwcEt5aDh1dURiMXY3VjcvYktW?=
 =?utf-8?B?Y1Bwci9wL0ZYSGhBVEJJcjJFRVNybTkxUzRlZG9hMmJlRFRlb0lDbTVVUTdO?=
 =?utf-8?B?U0hEY0sySlVHVVo3ZldEemNPK1U1VXdGS1cvdHk2ZFBZNHFjbTRyeWVUR2Qr?=
 =?utf-8?B?YlU2UDZFVDJ0YlN3aGdaL0lTZ0Y3S3A2Y2hjTit0OWhWREhkMldacVZ2UDVF?=
 =?utf-8?B?WkhQcm1xYloxZ2tQYmpTUE1kRTRXRm93OThQbk5lWFJrTmIxOElBSXM0UzVO?=
 =?utf-8?B?SG5rQjl0Y2ZBVDJxTVVOZGRxcXFHRVE5UlFNQ1dVNmpmbnJUdWRYcDdzM0dN?=
 =?utf-8?B?ZHRUbnJiMGdzU0d1Si9qdjF2UzBNamZDbVlnREQzaWpCRzduMU4zc0V1dGU2?=
 =?utf-8?B?UWpJQXczSjh3TGVueU1TMkxrTHVhQXRFZHIwL2luVUZUWUlpRnh1Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2687a236-1204-46a9-808d-08de9e4ab6c8
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2026 19:34:46.6547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hsgmTyORonbCNkcmG62jWeYQewvA+TrV2jIk0MRiYLKuvk8iCqs21w0g/6Y7lvtLdjzhi01AFf1O4WapAdRbkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB8446

On Fri Apr 17, 2026 at 8:13 PM BST, Timur Tabi wrote:
> Although GA100 uses the same GSP-RM firmware as Turing, it has a differen=
t
> signature specifically for it.
>=20
> Fixes: 121ea04cd9f2 ("gpu: nova-core: add support for Turing/GA100 fwsign=
ature")
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/gpu/nova-core/firmware/gsp.rs | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

