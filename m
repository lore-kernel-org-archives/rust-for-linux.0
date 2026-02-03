Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010009.outbound.protection.outlook.com [52.101.84.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AC4377541;
	Tue,  3 Feb 2026 06:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770099710; cv=fail; b=QqtOmmtQtaVgcd7EaqYDEygV0b0taOlfFlsMX2cjMOkxuoyggwfXbc/rzapdZrMNbvnpxwF+YMJmzcIjHEhN5j4KU3gWbh0H0oDVKwz5NOxSiF6qVe7Iu0cK/SjYvyALIGdZ+ezhZz4yb/8eIIdFlUovtd9xVFRDq8yG+YmkQLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770099710; c=relaxed/simple;
	bh=Lz4a6kdDVm8rSfqlCEtFuVP03ttz6QQAt9fZyG2oQwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jrxob3n4PEsD5fxgpw3pqCjOc/yb1dV92hiBTthYxRRRFG99HEdUdbEPvdCcER4qWmbtT0kRGkoO7P+bZXuGr+rtzq+jDDAxeS6lwHDcA4LchrhFNq4iMnrC6JpGWxH2mOi/kmLWkbat84WV1UXNIOD4r5ZOXEugAPu8DnHuY28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=Ep5z4kNG; arc=fail smtp.client-ip=52.101.84.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="Ep5z4kNG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfmLk5HXJGoborcneh/t9pEW3YftiIOQ2avfG9/fUDP/q9xWXp16IKFZg+4DrGx9S2y9O27VK/8DETYBmlFTzLnpYbD+dCucJOvUpW3WOqRnNK6wgqAUPX7pNm3IO/v8CfsH41/fqjoxRyU1tSYZijrbJvDYd4YxQZmkt9+fMF6qIK1Yl1kNys1is83MKQBj0jzvufzvWbevESwjPnQ9/ugk+AkqilvUs3go0nRfowXDchDlg6CG7ynCbLT9yXn0NgI7lpIgdjIxnbeFjjUM7PxfjxtLv16X4Vgf2mIZur7RpfrBdi2bJ+tYCYoJ/6BLUzBWSUD7udGyIMMKLB8/2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2dMLCPi9M2vlubJmqSQI8VPxChpXFVFLrNBtNF4YfAs=;
 b=dhm7QtivCyw0moNEAhqs3afa5KFdCN1fnhOSBnxCvDnuc5VU0dQybizZ8GP3q8lkuLHzkMZxNQCq9x1Ybm/0dXNtfDZbkd/VLhxa29IsLi9hQAawpOKUcBM7VhEPODoflQIoF+o2u4XDmovihQ89oWXKHb73+52GPS0njGVNQa+8K7dfiFOtSUX/XwH8GtcsmjrnrdEdbZg818yf5vBaj3b+L1l0X710yWh2/IhyS9jmrOC/uFax7drmZYXjbDJkyy7uYANby61zRr476FgWe7rEjh3uGdOFGsYSp9AEc+O9FuicXYULcvJH3wqnHVdpC6Z28BKuHTvMIDfZcsxGuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=gmail.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2dMLCPi9M2vlubJmqSQI8VPxChpXFVFLrNBtNF4YfAs=;
 b=Ep5z4kNGMsWETBEnTsLSd++a+mGMafFwTIqBZh/4qHhkWPMS0nCufsyA4XbX4xkGfUsANuz5wVecvRK7O/ypMyTT49DpBzJ+28MN0sM93Ro48QEqlR86cwoZouzpcogdx7pX91/THZ9lMMVH9K0PlZ0bfW2+EKo35yZNf9qrlFI8FlcOW7lls/UUcdxudMexty3XeE1wRNJ4XMnU6hMv3MNrmPR5eLpPm5iqPQfDXh69LyYKns3PmBzVj7d42eZJmO57doIUq2yHn9dHuohItkSYewT1bFaVzjkHC7PmAe2N2dEUAKhD6VfE8I2tTDBm30bGTwIFSx2rfclmIQvrfw==
Received: from DB9PR05CA0014.eurprd05.prod.outlook.com (2603:10a6:10:1da::19)
 by DU0PR10MB6931.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:416::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 06:21:42 +0000
Received: from DB1PEPF00050A01.eurprd03.prod.outlook.com
 (2603:10a6:10:1da:cafe::27) by DB9PR05CA0014.outlook.office365.com
 (2603:10a6:10:1da::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 06:21:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DB1PEPF00050A01.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 06:21:42 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 3 Feb
 2026 07:21:41 +0100
Received: from [10.34.184.244] (10.34.184.244) by smtp.app.bosch.com
 (10.124.11.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 3 Feb
 2026 07:21:41 +0100
Message-ID: <288d4aeb-af0d-4d50-bb0d-7a046abaaf10@de.bosch.com>
Date: Tue, 3 Feb 2026 07:21:34 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] scripts: checkpatch: warn on Rust panicking methods
To: Jason Hall <jason.kei.hall@gmail.com>, Joe Perches <joe@perches.com>
CC: Miguel Ojeda <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <14d95956-05dd-4c9b-b748-894c1d474c1c@de.bosch.com>
 <20260202135602.1886134-1-jason.kei.hall@gmail.com>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20260202135602.1886134-1-jason.kei.hall@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A01:EE_|DU0PR10MB6931:EE_
X-MS-Office365-Filtering-Correlation-Id: 74647043-e51e-4625-b6ca-08de62ec7f66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bW0wenNaai9nWlc2Y2hpREpxWG5heko1WEE3OVF4NUt0OWIrNjJzaCt3ZTdX?=
 =?utf-8?B?b054SzhZWHN1NnRsWFk4OGE0U2Z5eGlTbStXYXE1MDZEL2pEY1NqcUhqSVAz?=
 =?utf-8?B?djU3K2l1bkpvdnMvR0p3UVdZSWx1RmVzZE9hbVRTaGRyYlBzV0Y5cHhvNGpP?=
 =?utf-8?B?c1FWTnVkb1FGWHBnQUl5SXNVbFErMmp3OEhaU0lYOERYeXdOeXVQMExOYTg0?=
 =?utf-8?B?UGFBUDQzUitPRGpMWkowZW1GQjJreE1kRHU0Y2RvaXJaQ1hwTW1pbWlZckR3?=
 =?utf-8?B?dGRpOHpRTVBBWnlLd0t1cktVTVZYUHdBdjJOMjZuckc5TzFBYUtkYUZIdHZq?=
 =?utf-8?B?OXZDdEVUUmVSMVFvY1VFUEI5VmpnRWJ0OVp4cWI2YnFrVmdOYWRSWTRVYTIy?=
 =?utf-8?B?QkIyTTlPc1FUZWppa3M0ZE1ITnBycENRZlc0UW12dDRmTXhVVHRJbmlPMk1p?=
 =?utf-8?B?c0ZySEIwTXIwOG5paHJ6WWt6WkF5aFhqaE8vd0xXOHE1ekY3dWdaTmNLVUc3?=
 =?utf-8?B?RWtuN0JTTWNLN2JrdHlQaXdmbG5Xdy9tVENwelBZNUpUK0IxOGIyOVBmbElw?=
 =?utf-8?B?emlTOVNlbm10cmN5MVNBK2VvU0g2ZTQ1WmVVVFFBZFZ6ajl0amhaMW4zUWhp?=
 =?utf-8?B?cXpUU0V3TDNsSzBHYXo0Q21COEN6SkxHbmRoU3pjZnpJLzNqR2MzcVZZRmE1?=
 =?utf-8?B?MnBObkgvczFucHlEMTdybVpHUVlGdit5Ty82Ylh5UEU5UjBRYzVXQk1HRTVx?=
 =?utf-8?B?ZjZFVy8xSXVBTXJsNTRCdnNBMGxpbzFTd0llMzM4bVQvK04yei9ldnJVMWtK?=
 =?utf-8?B?dG9FMVVHYmNwNENLUHZPWXk4bkVhRy9NaHp4K1Q4ekpldU8rTHNLLzVMc0Yx?=
 =?utf-8?B?VnAra1pPZmoyYVdlWDQvb0xHREk3dVFuQWNSWStmeW15WGZkeVIzcFBua3Ny?=
 =?utf-8?B?SnVTb2hmR1ljSStTeW53VFFqdG1WMzY5WUY1ZkcxYmFLUFR2M25tTVE2eXNt?=
 =?utf-8?B?dTE1bnVwaW5aZUh1MlduT3o4Qkk4ekVhT0FJMTFiRFppWUpDdXcrdUprSlg2?=
 =?utf-8?B?d0JWQU56b0hVNTVFV2NER0R6M3dLWkhJUkFOb2JhTnNuMzBpZ2N0N2taVlBr?=
 =?utf-8?B?bFIyYWdlZ3lTbzFTY1d2bTBDdzkzNXFvNWJyOVFkOGhvbU1iR2FHWmJOUmt5?=
 =?utf-8?B?NXd0ZnVwRHFkdnJwQStiODFSZElYNXVJQWo0eVV6MHJSbjU1eDdZZExEZXZB?=
 =?utf-8?B?aXRCTjlPME5wRVp2L2c1QmlTVzI2bkxSaWtNdnUrZVBZNktXdElEZUJRRUIz?=
 =?utf-8?B?bGtpMDBZeTRiNGZXLzhWY1dqTndlQWdNUThEMkgvSmFhOGp5YXJZODN5dDNi?=
 =?utf-8?B?ZUdWNWJ1dTc4cmhhc2xGNWJ0TXFXVUlVUi9kd1pONW1VZWJmalpNSzBZQXpZ?=
 =?utf-8?B?TU8vaStFcEtmeCtpdCtJWm4wVWZxYnFoTittN0o0TTRveG9MRk5hcnAxek1y?=
 =?utf-8?B?ZnJOOHpBeXZoUHFJeVIvN1FpNlR1b3pPOFNTN0diblNoVUVnNlk0SzhFMnZl?=
 =?utf-8?B?Y2dTNjcwOTU2L0dkTERqYmg4KzNOalc3V3AyZzJiOFpFdHJvUHhZcFdQNmox?=
 =?utf-8?B?T0RXZ1BqU01HUEl3N3hRSGtOMU5NVzlJTm5QLzgyeDVlK0tHc05TUzFWYkFF?=
 =?utf-8?B?U0dxZnFVclVVWG54M1FRdG45OHVHdUZNM2Ztakg0UWV1cTVtSjBOTWJOcDJD?=
 =?utf-8?B?RDVzbkFUWUQ5ZlR5a0NBVWExbVlFbXJTV0RnWS9rbWlwVmdMNC9jL29uSSt1?=
 =?utf-8?B?N0xJd3VYb3VDN05XNERXSjV4TEhSYlNKZ0JDdnlJWkhSZHM1WFZ6OWxlRWZP?=
 =?utf-8?B?OHFPWkZ6dFByVUhEbExpYzMyUDB4UUh6c2lzUmhaNWlFZGtTS2JaMUtqU0tk?=
 =?utf-8?B?ZXh2QStQU25DWTFuSm5GbXNQazNUZ0FXN0lXTUpXODkzclBtRzZVOTF4TlA2?=
 =?utf-8?B?dVM5cFJBbEFPUkdGamtpVjdPT21mV2tCUHZybjBpdkk2QU04ZlJRNGlWVmI5?=
 =?utf-8?B?T05HNWtFbzhiejBoTk53Lys2R3N1N0hoWG5ZWkhCQ2ZQeStOSkJtLzVRWG5G?=
 =?utf-8?B?eUJHNFFEdjVkZk1vUWtCWVRLQVFNUThhaDl4NlM3bkNSTVlKZytVamNFbXpN?=
 =?utf-8?B?N2pUMWNuNWNwODJmZWJXbkYyQUs3NGVCN3dSZHhyL1hWL21iZWI4OWlJc05L?=
 =?utf-8?B?Tk1UcEpqN3BLWEo4c2VLQm1RdG9nPT0=?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZAsVGif6vWY7ppdWOpWHsGPzNetJmzphd7U0v3YcKAbTya0sXBOTY5QjIfVpk46AhClAzVzr3WQFqC0wmrMHX1wYMNgMOzodbECWf6pMINhJyK1QLNzfWhok3k3D8wd+Ph8/KlRsjqyX3bj3gLZwVKaYDAVds4D0T/H32UbiVTRi8UsuoCXz8sKJtDfP+aSMwjNMRm/8lvqNo9w1AhVkp+gSwt4w5JI28WHarwKPZfezp8qzvixsVUb1O+4+TJe8ZdZUphWObF30IkXh+KBhJ8jk0AUO0x1p72ESNcvNLas+PKlyI2FKPMQtaA4/e2jPH8uTiKO3ileS33HkUahzYyG3OdiGSTylMrtitnvAhtGaRlX7DfqiUvwgZpPns8LnSJGJ9XA6Hyqaj+tDirzkg2yOpe2pPL8i7ut+k3Jh+//oPxvjTB1vBQXmj3r8g6t7
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 06:21:42.1379
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74647043-e51e-4625-b6ca-08de62ec7f66
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6931

Hi Jason,

On 02/02/2026 14:56, Jason Hall wrote:
> Add regex check in checkpatch.pl for common Rust panicking methods
> like unwrap() and expect().
> 
> Allow an exception if the line contains a '// PANIC:' comment.
> 
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-linux/linux/issues/1191
> Signed-off-by: Jason Hall <jason.kei.hall@gmail.com>
> ---
> Hi Dirk,
> 
> Now using imperative mood.  I decided to keep that logic stateless
> unless its agreed that we need to add state.  Adding checks for #[test]
> and other test identifiers will make this much more complicated.  There
> is already a check for // PANIC: that works fine.


Yes. I'm just slightly unclear what we do with existing code where using 
`unwrap()` is fine/accepted/required? And with patches like

https://lore.kernel.org/rust-for-linux/20260131154016.270385-3-shivamklr@cock.li/

I would guess with this change we would get warnings on that?

So the idea is that we would need some add-on patches on top of this to 
annotate existing code / patches with `// PANIC: ...` to stay warning clean?

Thanks,

Dirk

Btw, what's with Gary's comment to drop `expect()`?


> v4:
>   - Use imperative mood in commit description.
>   - Fix patch formatting and placement of '---' separator.
> v3:
>   - Use non-capturing groups (?:) to optimize regex.
> v2:
>   - Switch from \b to (\.|::) to avoid false positives in strings.
>   - Add : to PANIC comment check.
> 
>   scripts/checkpatch.pl | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index c0250244cf7a..37bdf602e7e7 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3834,6 +3834,17 @@ sub process {
>   # check we are in a valid source file if not then ignore this hunk
>   		next if ($realfile !~ /\.(h|c|rs|s|S|sh|dtsi|dts)$/);
>   
> +# check for Rust unwrap/expect
> +		if ($realfile =~ /\.rs$/ && $line =~ /^\+/) {
> +			if ($line =~ /(?:\.|::)(?:unwrap|expect)\s*\(/ &&
> +				$rawline !~ /\/\/\s*PANIC:/ &&
> +				$line !~ /^\+\s*\/\// &&
> +				$line !~ /^\+\s*assert/) {
> +				WARN("RUST_UNWRAP",
> +					"Avoid unwrap() or expect() in Rust code; use proper error handling (Result) or justify with a '// PANIC: ...' comment.\n" . $herecurr);
> +			}
> +		}
> +
>   # check for using SPDX-License-Identifier on the wrong line number
>   		if ($realline != $checklicenseline &&
>   		    $rawline =~ /\bSPDX-License-Identifier:/ &&

