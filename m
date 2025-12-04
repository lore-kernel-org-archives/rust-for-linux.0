Received: from mail-edgeBI204.fraunhofer.de (mail-edgebi204.fraunhofer.de [192.102.163.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BA83446DB
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 14:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.102.163.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764859393; cv=fail; b=VNdzElYI3DG+0+WfjhlYjXRJuCYYUF1LI+FQeVeoyfa2ngb77DrDvGIP54rd64MGy7BfBBaWv86Cj5s4Zno0xG4dAahNr56om4b2xbKuEeUHHNLnsiLvRIzn8QYj7D8lcsCO9vt5iyMhlKXW72wADC9vImGk5Z9VzxA3mzRdYjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764859393; c=relaxed/simple;
	bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I6/012vZlhk6r9rE1p3poOuEom7LH+rWLMHht/fQdOGvzBFF3Z9ia8jMqn1MT6tAD6yE7HUCs+Us8Su06Z0vLXq0eyv7D1x25xk+LTaao9sOgDAhTakOemFPSJ8i/pk0ABW6d5IyvWvjB45fiONZdTYhpAe2TZAJzKd1FkvMmL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aisec.fraunhofer.de; spf=pass smtp.mailfrom=aisec.fraunhofer.de; dkim=pass (2048-bit key) header.d=aisec.fraunhofer.de header.i=@aisec.fraunhofer.de header.b=Pmvdtzrh; dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com header.i=@fraunhofer.onmicrosoft.com header.b=fkp5NKN3; arc=fail smtp.client-ip=192.102.163.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aisec.fraunhofer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aisec.fraunhofer.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aisec.fraunhofer.de header.i=@aisec.fraunhofer.de header.b="Pmvdtzrh";
	dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com header.i=@fraunhofer.onmicrosoft.com header.b="fkp5NKN3"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=aisec.fraunhofer.de; i=@aisec.fraunhofer.de;
  q=dns/txt; s=emailbd1; t=1764859391; x=1796395391;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
  b=Pmvdtzrh4badtjLm8BOW9ymkUGtebtQwrg2G7XOWFaC0B4e+km2UClF0
   1Bo3ZKHV6eMI0uTwbwmvNxfY1zDWoVm1ivWYlLTglCHKF1Mg3/Qawbfz2
   vH8OxXE8trxG5zYsk0o10flv5igNKb0ixG2rDeavdnGtl9UkwvaoG/PHh
   7SgwXu8itXeWl1fHsPQ1J0oDfn+IQNciLE4W+DQeAp9gRWJawX3c39Akn
   NBQCndqQUsG8h7VugcZGe7kZSNl6C1nNy3gOxKiOgIbHybSNZqaMS1JgY
   wmL1J8WE0qW4yelqDljnMSdU6HKi0yMB38q5OrNC0s5ZpwU60spmFAuUh
   w==;
X-CSE-ConnectionGUID: nzcNu4t1Rqah9PjfU6gV0Q==
X-CSE-MsgGUID: t9ZgV9JeQLujM8BkiU85aw==
Authentication-Results: mail-edgeBI204.fraunhofer.de; dkim=pass (signature verified) header.i=@fraunhofer.onmicrosoft.com
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2EqBAAjnTFp/yUE4gpaHgEBCxIMggULgkBAAYIvszuBK?=
 =?us-ascii?q?4ElA1cPAQEBAQEBAQEBCAFRBAEBAwSFAAKMaCc2Bw4BAQEBAwEBAQEBAgUBA?=
 =?us-ascii?q?QEBAQEBAQEBAQsBAQYBAgEBAQQIAQKBHYYJRg2CW4EsgSYBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEdAjVWBjIBDQEBNwEPC0YxJQYOBYMCgiUEEgM2tEqBAYIMAQEG2ywYY4FkC?=
 =?us-ascii?q?QkBgUGDfIFygmUBhH1xhHg2gVVEgUqCdT6EWDiFd4M0mVlICngcA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBIEMDNQwLKhUjSwUtHYEjIR0XE2A9F0CDSRgGZw8GgREZSQICAgUCQ?=
 =?us-ascii?q?DqBZgYcBhwSAgMBAgI6VQyBdwICBIIVfYIKD4gCgQgFLnsnAwsYDUgRLDcUG?=
 =?us-ascii?q?0RuB5QdT5x6Aa9rNAeCOIFngV4GDJ9nGjODcQGTbpMLmQapFQIEAgQFAhAIg?=
 =?us-ascii?q?W8LggQzGiSDNlIZD44hhAC8XncCOgIHCwEBAwmSHoFLAQE?=
IronPort-PHdr: A9a23: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
 i6ACjQhrHecF7fFWwiZ7UZttXXUFJ63cXqQIREk
X-Talos-CUID: 9a23:M8+gb25ajWYb+zA0I9ss8lwfPN15biTn1X7Qcne6B1s3R4PNcArF
X-Talos-MUID: 9a23:/j4e3AqqV1p3KQjgoXYezy0zBshWsoajMWQQk7BWkcqFCHwtMijI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.20,249,1758578400"; 
   d="scan'208";a="14770305"
Received: from mail-mtabi109-intra.mx.fraunhofer.de (HELO mail-mtaBI109.fraunhofer.de) ([10.226.4.37])
  by mail-edgeBI204.fraunhofer.de with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Dec 2025 15:41:59 +0100
X-CSE-ConnectionGUID: LIuMv1e9TfmdCgwLhsmBkQ==
X-CSE-MsgGUID: PHkQqNsITGGzQna9GFkBHA==
IronPort-SDR: 69319db7_Ah5iZQJ1I1tf9pLI04TvghNyC9N6CGGU7N+8esOT6lz5uxr
 yet7cajHQaNJ3Y4GMpRtJZTLKCwSPRCzPKk8/pA==
X-IPAS-Result: =?us-ascii?q?A0BABQBMVK1o/3+zYZlaHgEBCxIMZYEjC4FuUkABgRyBC?=
 =?us-ascii?q?YghAQGFLKVoglADVw8BAwEBAQEBCAFRBAEBhQcCjCYnNwYOAQIBAQIBAQEBA?=
 =?us-ascii?q?wIDAQEBAQEBAQEBAQELAQEFAQEBAgEBBgWBDhOGTw2GWwIBAxIgAQ0BATcBD?=
 =?us-ascii?q?wtGMSUGDgUigmCCJQQSAzUCAgKtNgGBQAKMV4EBggwBAQYEBNshGGOBZAkJA?=
 =?us-ascii?q?YE/g3yBcIJkAYR8cIR3NoFVRIFKgnU+hRCFd4M8ml1ICngcA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBIEMDNQwLLhUjSwUtHYEneYQVhB8rT4IbcoF1QRk/g1MeBmsPBoEVGUkCA?=
 =?us-ascii?q?gIFAkM+gXEGHgYfEgIDAQICgRAQAm5AAwsYDUgRLDcUG0RuB5N3nXYBr2s0B?=
 =?us-ascii?q?4I4gWeBXgYMn2caM4NxAZNukwuZBqkWAgQCBAUCEAEBBoF+JoFZMxokgzZPA?=
 =?us-ascii?q?xkPjiGEALoxRDMCOgIHCwEBAwmTZwEB?=
IronPort-PHdr: A9a23:/iEqKByjRdgDMWXXCzKPy1BlVkEcU8jcIFtMudIu3qhVe+G4/524Y
 RKMrf44llLNVJXW57Vehu7fo63sCgliqZrUvmoLbZpMUBEIk4MRmQkhC9SCEkr1MLjhaClpV
 N8XT1Jh8nqnNlIPXcjkbkDUonq84CRXHRP6NAFvIf/yFJKXhMOyhIXQs52GTR9PgWiRaK9/f
 i6rpwfcvdVEpIZ5Ma8+x17ojiljfOJKyGV0YG6Chxuuw+aV0dtd/j5LuvUnpf4FdJ6/UrQzT
 bVeAzljCG0z6MDxnDXoTQaE5Sh5MC0ckk9yJy3f7QzRV5vqtAnmmdNM9XK6L/CnU6oEYiq8y
 YwzYwTotT4GORw/+23I358V7upR9Ryiv0FZ4KiPQLCQCr1gJZmNeYkCe217fMZsSyZPWpubP
 6AVAcBaIspqlIrjh3hSpwPvAiWtJL7x2htj2Ha1+IQz09xmTTmawDY+R/sEnSnOh8vabIMXX
 eyvk6TL0GvbP9VsmhzH7orNQEEqi66CQ+1eT9iK8W00JzzZi3mTiM/pIxGU0acNuDGR5vpmC
 /qIj1MgmT1I8mbw3cYJrbCZtN0wlWuYrSNhxpQVAIjrAF4+YMSjFoNXrT3fLYZtX8c+Fnlho
 z1polVnkZuyfSxPzYgu7T+GM63BfZKB/xTjU+icO3F0iSEtdLG+gkOq+FO7gq3nV8ay2UpXt
 CcNjNTWt34M2hCSosiKQ/dw5AGgjB6BzQnO7OFDL00u063dLp8q2LkrkZQP90/EG0fL
IronPort-Data: A9a23:o4f7/6h2qcecno1yiZShuTisX161MBQKZh0ujC45NGQN5FlHY01je
 htvDWHUOv2INDSjLtEiYIzl9xgE756En942Twds/ngwFC1jpJueD7x1DKtf0wB+jiHnZBg6h
 ynLQoCYdKjYdleF+FH1dOGn9SAtvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRWmthg
 vus5ZSPULOZ82QsaD9Mu/je8EkHUMna4Vv0gHRuPZing3eDzxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw3sdqJH8X+
 K0kJjUBRR+co+KtxZi4c7w57igjBJGD0II3oXR81XfUHf0mB57ZSrjM5dhW0S12is0m8fT2P
 pdCL2swKk2fMlsWYAh/5JEWxI9EglH2dTFCpVuO46kw+WL7xQ1q3bOrPsDcZ9qKQstYhACUq
 woq+kylW0xAb4zOl1Jp9FqUpuz2hAXgeb49O6+B8Pc7r3OQ7Ew6XUh+uVyT5KPRZlSFc8hYI
 Uw8+Sc0q6U2skuxQbHVRQCjvDuKuQRZX9tWDv0S9g6A0OzX7hyfC2xCSSROAPQ9vco3WTsuy
 FaPktXBCjtov7mYD3ma89+8tjOvMCg9LmIYYyIACwwf7LHLvI43njrLT9B+DLSyiNzlXz39q
 xiWqSckgK4IpdMO1q67u13LnlqEuJLARA08zh7KRW/j5RERTImhaoOA81XX7f9cao2eSzGpr
 Chas8uT9uYDCdeKjiPlaPcKGr7v4/etKzzSgEBiWZIm8lyQF2WLcJBXpTFvLl1oPoMOeHngb
 FSVtxlY+ZlTO3Wnd+l7bupdFvgX8EQpLvy8Ptj8YMBHf55xcwGK5mdpY0uR1Hrqi08ijec0P
 pLzTCpmJS1y5X1PlWLoHbUuwvUwyzogxGjeY5n+wl71mfCdfXOZA/NNeleHculzvuvOrRT34
 uRvEZKA6yxed+niPQjR04oYdm4RIVYBWJvZls1wd8y4GDRAJl0PMfHq7I0ER51EhIVQz+fBw
 WG8UBRXyX35nnz2Fj+JYXFCNpLpe4pzjVsmDxwsP1+Dhn0oZKj25qIfaakyQ6gD8dZn7P9rT
 ssqf9eLLeRPRw/mpRUcT8jZh65zeCu7gTmhO3KeXwE+WJp7HSrb18TBfDazxBIRDyGyi9Qyk
 4eg2izfX5AHYQZoV+TSV96C0HKzuiI7tN9pfk6VPORWRlrgwLJqJwP1kPUzBcMGcjfH5zmC0
 jepEQUqnvbMr6A14ev2q/i99anxKNRHH21eA2X/xpS1P3OD/mOcnKlxYNzRdjXZDG7J6KGuY
 NtO9M7FMdoFoU1rtrRtGLM63IM84NrS/4Vh9DpGJ0mSTVqXCeJHGEKkjO1vraxGw4FLtTSmA
 nyv/sZoApTXGcfHPmNIGi8bQLWt6fUmlAPWz8wJG2ThxSou/LO4QURYZBaNrypGLYpKCoAuw
 MZ/mcs49j6fqB4bAvObh3oF5lWPBHwJY4Mjh4BHBYTupFMhz1FcU5niGwvz2pWuaspNAGYuM
 DS7lKrPvJUC50vgIl4YN2nB4vpZvrsK4Ct19V4lI0/TvMjondo14UFhyis2RQFr0Rl36eJ/F
 Wx1PUlTJ6/V3TNXqOVcfmKrQSdtOQa4/xHv9l43i2HpdUmkeWjTJmkbO+zW3kQ48XpZTwdL7
 oOj12fpfjb7Tv7fhhJodxZelMXiatht+inpusOtRZ2FFqZnRwvVuPalYG5Qpib3Bc80ulb8m
 tBr2+RNcoz+Cz8bpvwqKoud1IlIciu+Gk55fahD8p8KTEbmQxPj/RiVKku0RNFBGOySz2+8F
 P5VB5xuUzaQ6X+wiw41VI82DZ16pvoL3OY5W6jKIDcGuoSPrzAyv5P38DP/tVARQN5vsJgcL
 63MRRKgFl2goGZdwT7cncpuOmOIR901dVD51+Wbqe8MF4wxtd99VUQI1pq1oHSnHw919D2Ev
 A74RvH3zMJ/+6ROm7rcN6p4XVSlGNLRBcCj0hG/jMRKVvzLafzxjgIyrkK9GRZ7Jp4TZohHr
 quMu9vJw0/1hrY6fGTHkZ2nFaMSx8GNcMdIE8Dwdl92oDCjXZLy3h495GyIE5xFv9dD7M2BR
 QHjSs+Rd8YQauhN1k9udClSPBYMOZvZNp66i3uGkM2NLRwB3SjsDtCtrybpZF4GUB44AcT1D
 wustsu+4txdkp93OyYFIPNbGL59Hk7oXPo3Vt/2tATANFKSvHG5huLAmyYjuBbxMVvVIPait
 NiBDlL7eQ+psa7F8MBBvsYg9lcLBXJ6mq8rclhb59dyjCugAXUbKfgGd68LEYxQjje4waSQi
 Osht4f+IX6Vsex4TCjB
IronPort-HdrOrdr: A9a23:HGE9sa55X3aONgUzvgPXwMDXdLJyesId70hD6qkRc3Fom6mj/K
 qTdZsgpHzJYUkqKRQdcLy7V5VoIkmsl6Kdg7NwAV7KZmCPhILCFuBfBOXZrQEJgUXFmtK13J
 0QF5RDNA==
X-Talos-CUID: 9a23:0FfYUGFbjv9IqglEqmJD1VMxBJkoI0HTyXv7LFCcCX1sYr6sHAo=
X-Talos-MUID: 9a23:dyOKLgliDnOmK70tNgVVdnpaFMRR+oK1KXwivoc/vcDVGgJzERe02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,214,1751234400"; 
   d="scan'208";a="41523896"
Received: from exo-hybrid-bi.ads.fraunhofer.de (HELO smtp.exch.fraunhofer.de) ([153.97.179.127])
  by mail-mtaBI109.fraunhofer.de with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 15:41:58 +0100
Received: from XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) by
 XCH-HYBRID-03.ads.fraunhofer.de (10.225.9.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 15:41:58 +0100
Received: from FR4P281CU032.outbound.protection.outlook.com (40.93.78.49) by
 XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 15:41:58 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BHt/Ro6vneoNNbJQKy1AUysRc+lfkCs7LQjcKOfZDYkP10H6HjmLiWI+igwvSLBXIWndPaI+4AyqCAjyv2nQTuQ36THIGEfc7PYx+vLUczeK+FObN23ppMwF4pJzmkgKYG9x6QrMk+p1UXhITlA6ZaZAg/SQYza+4B8APme6hbTmgBFAEEgdqmenThAy5TMr7GXDbnJ6cCmA4eo9CSDNkWUBJlHMDiO+Kxv/e77foi86XW7WosWVaFKYcmhBZL8jNOvGl6ZyiEUUl3V7u4Qd4TMlBIRa0Ky5QaShhOrdSgE/OS7Iw888KrVyFIyyLrFwC06TvR43k7oHho8qVEwhKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
 b=iX8zdGlSccsG0dZt4N0RUTN0Hs51dYWhLnOhDvEvnu5u8LdUJ2Y2H86/iRkOnX7hN0jsja/g5a9nZwDo+3s1XHcwLa35q2tEcGKh2eKkR0ta1TU1TxeST1cx7x1fVrTGN/sAkNtlKsKBwIp946uisLflk74DPGXySLPAFAosH0I4JpQUau3Gje0p5JsoUGRN8wH26l32bO6is9PPAyNNvLegcCPBtxtxbXsYHJeVGQ4+kRRtzi5h/TPNgi44kNpz2VVW4e/lg4LnAvegVSogNE4O/20rkUBUZubni5jRz2Ocv0q9pxbqnsoY7lRCmtETx1l565lHqef3Vjqst8EGDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aisec.fraunhofer.de; dmarc=pass action=none
 header.from=aisec.fraunhofer.de; dkim=pass header.d=aisec.fraunhofer.de;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fraunhofer.onmicrosoft.com; s=selector2-fraunhofer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
 b=fkp5NKN3HYmV/v3R8l2pVoRJhUtbf0pO8CrfB3wDZSkvHK4bp9oDiH5vxLC6a+MAahP/4P4tRv0AbE5rCvG0Lmddr7eku6p8NR+CRnjmZ9cB7fv7FVz3PLsXWtmDkI+dtJio+hc1baxn6pOlUoZTQ867siMOQ8Z7M7S40npnzHM=
Received: from BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:43::5) by
 FR6P281MB5042.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:176::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.11; Thu, 4 Dec 2025 14:41:56 +0000
Received: from BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ae34:1ec2:9d34:a9fb]) by BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ae34:1ec2:9d34:a9fb%5]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 14:41:56 +0000
From: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
To: <devnull+debug.rivosinc.com@kernel.org>
CC: <Liam.Howlett@oracle.com>, <a.hindborg@kernel.org>,
	<akpm@linux-foundation.org>, <alex.gaynor@gmail.com>,
	<alexghiti@rivosinc.com>, <aliceryhl@google.com>, <alistair.francis@wdc.com>,
	<andybnac@gmail.com>, <aou@eecs.berkeley.edu>, <arnd@arndb.de>,
	<atishp@rivosinc.com>, <bjorn3_gh@protonmail.com>, <boqun.feng@gmail.com>,
	<bp@alien8.de>, <brauner@kernel.org>, <broonie@kernel.org>,
	<charlie@rivosinc.com>, <cleger@rivosinc.com>, <conor+dt@kernel.org>,
	<conor@kernel.org>, <corbet@lwn.net>, <dave.hansen@linux.intel.com>,
	<debug@rivosinc.com>, <devicetree@vger.kernel.org>, <ebiederm@xmission.com>,
	<evan@rivosinc.com>, <gary@garyguo.net>, <hpa@zytor.com>, <jannh@google.com>,
	<jim.shu@sifive.com>, <kees@kernel.org>, <kito.cheng@sifive.com>,
	<krzk+dt@kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>,
	<lorenzo.stoakes@oracle.com>, <lossin@kernel.org>, <mingo@redhat.com>,
	<ojeda@kernel.org>, <oleg@redhat.com>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <peterz@infradead.org>,
	<richard.henderson@linaro.org>, <rick.p.edgecombe@intel.com>,
	<robh@kernel.org>, <rust-for-linux@vger.kernel.org>,
	<samitolvanen@google.com>, <shuah@kernel.org>, <tglx@linutronix.de>,
	<tmgross@umich.edu>, <vbabka@suse.cz>, <x86@kernel.org>,
	<zong.li@sifive.com>, Andreas Korb <andreas.korb@aisec.fraunhofer.de>
Subject: Re: [PATCH v23 07/28] riscv/mm: manufacture shadow stack pte
Date: Thu,  4 Dec 2025 15:41:48 +0100
Message-ID: <20251204144148.10012-1-andreas.korb@aisec.fraunhofer.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112-v5_user_cfi_series-v23-7-b55691eacf4f@rivosinc.com>
References: <20251112-v5_user_cfi_series-v23-7-b55691eacf4f@rivosinc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::13) To BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:43::5)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB2435:EE_|FR6P281MB5042:EE_
X-MS-Office365-Filtering-Correlation-Id: af64d21e-c50f-499b-0038-08de33434625
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|3613699012;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2azDWEqsef48A3ProwLjaufZCVvPC8BBPivm9awc+KWGj+k7I1M6e8I74QM9?=
 =?us-ascii?Q?7R3mG+L7/Sq0bnUHiEoaaX5LgaYovnHzGsxgGruzcLnpLZ99ekVg/4w528ru?=
 =?us-ascii?Q?oJYiNvZ8MujHXfl0drMdc20q9ihjqvF0/zkkZK/zpb++IOx1ZSYNr7h4up60?=
 =?us-ascii?Q?kT71IGaRKStweBM9BIpGX46gZmgAWRBFXfueK/rDlLQWaDrglTpk9wtw688+?=
 =?us-ascii?Q?lsDeClj/XuiUWecTJTaqmYrYQYv503ruuGAtOlS47m9WmmLzeD6pR0MDhW06?=
 =?us-ascii?Q?CwlARdOjkLNmym8QLM5U+Ex94wnZmI9q+14pDMy9/HGzNl+4EIKms0vVYpi7?=
 =?us-ascii?Q?JIjK3CJkhlm7WA5e0oAu79PINg8ZUbM6xsLqyW+Kd7fl61i8ksBSrxrlpEk4?=
 =?us-ascii?Q?poQOwmJBfYqQ6hiGhX+2R6lG28NRkGMoPM7xhnMKnPQNtBTAdj/wcoKa74aN?=
 =?us-ascii?Q?vk3Vx1Cxq0bmQ/f9ea2SMLlIBonTsBymqCkwscu9eF/INT+1C9Xnu14zESFU?=
 =?us-ascii?Q?Ah+ayJ3+hWJMwTJX8cZEX/IJlIbtp0v/Tu7GhnA7E2O7wFPaPctIY6pIt76W?=
 =?us-ascii?Q?R5OWb9qZerA9Fpmgfqf+c9edLMxL7ItLxEdyS2vdD4acsaGnb00xU/Xcgmsu?=
 =?us-ascii?Q?E93pEp+Wwio9l3tEXE10HtwjvuI5dW8LK2LrSdRrc7sJQDyqCWPHQz1FyXuW?=
 =?us-ascii?Q?HOAZuN4YNj/wq5QGcckbYveOzaUOaACocpixoxF0tMJA0asn3yu0828OkLoz?=
 =?us-ascii?Q?b2/wr/0DmTkbapLJjor1FM8PZodalGf3FZJlAIkjbosC/7YJRqXMpOasB4jy?=
 =?us-ascii?Q?Y/nAvPiNXTrV2kmJCU7QDz7ciNTaH30UZ/us/uZiYS+DaPmC+nCQ0QWXy3sp?=
 =?us-ascii?Q?t4pwtRry1JFft7tBeBTO3NxWZY+RFPw0DnMmvOWSbYifCrrkAbEMGGJ3dqqR?=
 =?us-ascii?Q?9vDeuG6vBhOG2jDKarlFesLpqNBnQhiuIeOLSWTal5Y69fNgVJXBTCyBVcGa?=
 =?us-ascii?Q?26SC3p4nzNG1Lfx85R0iD5dyvxrO0NtCgSpt3jRFtLSyrluGbqe1ZLf5zS6u?=
 =?us-ascii?Q?LlO6ZjKVEqRvhGhIfPFmH30d9FY+iENYZG8J76ZJA9UyXS7aI436gTb6sN/Q?=
 =?us-ascii?Q?nxgA3yYWTTAfuuRLmXmQ2dzFz4NT3rPlbG987wjxUAPQLqj3JFBjD/fzr/zI?=
 =?us-ascii?Q?qVUtn8WQhGV9D9WvK05AiJABrTi7ejKYSUB+dByX36aOAn+XcZ1eE5a3v3sc?=
 =?us-ascii?Q?39KfJ4o28cDR+oPiDmriJCShGY5OaZV/Pr43ePlg1jRRQ8SDvn/V07wgyWw5?=
 =?us-ascii?Q?ySSy7Ahafst3jDNixWHYQRIH4JbVTi2B3VtcOJ40bMd8gnz69+FwfiPQwq5Y?=
 =?us-ascii?Q?mgX/0Qa7e7N7YpPi0WwxuYWt+QpnfMyCSeVzelVkmw34/yUVNUBqbu57lAkQ?=
 =?us-ascii?Q?614RWAmYAdhHuxhsJ3iZvrPmdiQ7QI+VDsW3OUvw7WXuQ1Z3LZn4DAuxViZ+?=
 =?us-ascii?Q?iRY0ujZjEuS/378wphp8NM1fstji5/cgpowK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(3613699012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ak0qdct2g5Uz/qEaOzi82kRTAuAbldns23TaG63v2zjKSIfzayI/ZgKc14md?=
 =?us-ascii?Q?arvYpZKFOIfzd5dJFnx1TB06X7pjV/KoYxjA4xjCZD7W2Q6wDOXDfz45XvzM?=
 =?us-ascii?Q?o1pIXsR762e4ft+KXeolL9IzkW/svhPrgjEhi5Uu81qwOtMPDSb9BLS2CVaY?=
 =?us-ascii?Q?iGFc4h3AAB3Doa1k3sehdj/s5hbLqrpzcrq+PwA6p5ZKxjFMiw+LVxpWKTs7?=
 =?us-ascii?Q?IPYh4Dn80Guzge3d8zTKpCHzaWs+GjuKAxctaO+4PIdD861LteS//32/3oRy?=
 =?us-ascii?Q?+zW5DriWGCG5urekoG1aupu08K6qF+zoYVzMK6EQjCJjsD4wu32f6+gcLP8z?=
 =?us-ascii?Q?TautXdBbrXlU1qTW9j/qm44gq/a4EeTiWjtbjFPkN13DZl84hJx/qLGKxZR6?=
 =?us-ascii?Q?Ke7P0MsOBfUUEJpaWf59OrYs6RR+KQGnJJ3/H/8+cCo+wA/yONmvcDiO2QqM?=
 =?us-ascii?Q?dfDQuOAO7eHmaGCQBHFuUcmfokoA5ye4kmdHOsxDve5AHJqgbq9GiezSqGJq?=
 =?us-ascii?Q?302mH7cJNtSKX7rkcPKmbMZPxXazJnqgSPd6eJwQueL/CxGFfA4dlM5dYpj3?=
 =?us-ascii?Q?wgzeeafXsxeflpPRDbZZWkmLsjKndaxdCYOmMOF6OAXR3TU75c/otGTsia/F?=
 =?us-ascii?Q?nbr3NFFo9O0N4TnyH1MvvtIWXD6U7Le/McaaP2Tt+N+8Q/XHYttbycsj1CmQ?=
 =?us-ascii?Q?pLPH7JojOBLmnu5vW4rGlppv1eEKXJFtdVCMFvOLvVYIVT2Ar1E2ZRif7H6L?=
 =?us-ascii?Q?PJhvMKF+4KMMvXkh1/i3pCQ5fqAPxLpOlPHDptdMG4CMHLXas+mAyFZ3ot1h?=
 =?us-ascii?Q?6sqncRmqCSEJj6/Ib/4Wiz3zeIfD6s2w4d2nGMQIvxT8d7RSlNAnresC/j+z?=
 =?us-ascii?Q?HSIJ1HkPyZSTZYsGC2C6xy5p5QDTIcbE8B8C9FpT6moV/bHGsrR5srih09N/?=
 =?us-ascii?Q?Xpa5LbnR/olssA9fil/1cC8OrOndNY+6vA0ITWRhC6V6lM6p7blEFzYzSkBE?=
 =?us-ascii?Q?KVAcL8trkZGA5Pb481A5rwBwqsx1lPDCYk9+UfP3rBDcFpKX06/Gmedc6HHZ?=
 =?us-ascii?Q?JQuRhrEWRJWh28aRhVV6ijGReNPg1kwNGM3zAUAmJHulCqHaFhz4ozw03PmP?=
 =?us-ascii?Q?BGMK7vQgoElloxUDRZ74zDJS9DbEuo4KZW91udpg9LZgQxBjFp06Q8LKXgSg?=
 =?us-ascii?Q?GapBUn96MLA9S99pPuxKCRaMTLaZI+ne7YvBr5+j4jhmoi7+A1nz1d2AvPen?=
 =?us-ascii?Q?ul0VSkJax9mfij/aKR+CNg3LoLBVMwzsgxNbhXB5THiHjdJztraZ6+iDhGsM?=
 =?us-ascii?Q?RFMVTl1T//43d+gdz2iff7SrEuOKvKD+V6UBZaL3CSTd04e1GuaRHJ1J8uYM?=
 =?us-ascii?Q?2wEQxN9v+F/7DyauSLRjWcwRqpFrBsnijxURYMFpiEY5RBtz/wIqSJgKVMBk?=
 =?us-ascii?Q?Y9gRIktgldIPXGlk6VbEvy1G9Qa/rlG+XE8SpecucLJbA0cdR/cRV6U0+p94?=
 =?us-ascii?Q?bjB9pmvhZtH31gZjita0JJFzRHO5MgQS4fCrlW2ODcIkyvm5YlRgjqDPAa/I?=
 =?us-ascii?Q?NzKO6DT3h1Sc+WfmYsgVpSgo9Zpevt1zs2Pbmrb/iaN5fCcIifk3XWYcxGO7?=
 =?us-ascii?Q?/2cRexnCRctw37G3ZqqSMOg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af64d21e-c50f-499b-0038-08de33434625
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 14:41:56.7329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f930300c-c97d-4019-be03-add650a171c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ofSDCKudjnZ31SW131+5vcfOVwYYUgHZtTjZgWRU9CnU3TY8noTlvfpP6xdt8fB28f9udhf44MjpmcQWOR0m+i9Hwyqu//hQn8HTtqQ/5XXS+zljC/NiJbI+jZwc+qjx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR6P281MB5042
X-OriginatorOrg: aisec.fraunhofer.de

Tested on qemu and on a custom hardware implementation of zicfiss and zicfilp in the CVA6 core

Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
