Received: from mail-edgeBI124.fraunhofer.de (mail-edgebi124.fraunhofer.de [192.102.163.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EBD25DB1A
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 15:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.102.163.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764860641; cv=fail; b=qT5rxwT2WDdGs+IVIwPnJlN2udAXTpJRBbO4dEBhilmKLGdjtsT1O12CsnWIPZTBtun0V+sQ6DcAt72ozEGr5Sjpt2Gdm5BAv3XM4cUpKJHdUz1RmMvhN9Z6QMDIXyMpP5w7vQNmlVQgxNI8KYqqD0wuqAu2ZGcYruG5xqIjRIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764860641; c=relaxed/simple;
	bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cfGMU/awZN4WTQqskqGVu2wvmC0N3YdKPNUjUBTxnbpRYvY6OhPFtCC7OeNnQr7Pyz/bLy2C96xLpvJeO2X/qHWg5GUxj2cyP2Pc2ULUi++V0tVAXFTSiT+lJlBK78vC1DRgh7NpwgB/uVV+XmM5n75XRJsStC6jzT8MzLcST5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aisec.fraunhofer.de; spf=pass smtp.mailfrom=aisec.fraunhofer.de; dkim=pass (2048-bit key) header.d=aisec.fraunhofer.de header.i=@aisec.fraunhofer.de header.b=KicrC7+m; dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com header.i=@fraunhofer.onmicrosoft.com header.b=bLfCn4wr; arc=fail smtp.client-ip=192.102.163.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aisec.fraunhofer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aisec.fraunhofer.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aisec.fraunhofer.de header.i=@aisec.fraunhofer.de header.b="KicrC7+m";
	dkim=pass (1024-bit key) header.d=fraunhofer.onmicrosoft.com header.i=@fraunhofer.onmicrosoft.com header.b="bLfCn4wr"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=aisec.fraunhofer.de; i=@aisec.fraunhofer.de;
  q=dns/txt; s=emailbd1; t=1764860639; x=1796396639;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
  b=KicrC7+m5NY+3bzuGAhTpwH7do3e7vJToXDjtWsQtU+wYfRuMBRhgNqK
   gezgcKMlVS5Y/FkMGSQ4yaMxeLd17w4VrmBXm7VmwRAlrQNXG0Eyx0i4Q
   /4cXvasByVL5VVPHVzf/Pl2t0PTNoCYlwTdrXZoHdVNaEWz9ZB8rxX465
   yL+RrtRYte/wCl6vsOVfNIIEWaPpCo6YPEFkEFpOQv9e4BlV7rcdqSi7m
   sztNZq1g7T/a+CBlCO82we45zwBpTa5+wwcSZK/lp89rVO2BDewIB9ABu
   gBOggWXauukvu4x/UvRx+uNa8j3HiMe1CfK5pUIKjxDyJ+NZN2rgnah/2
   w==;
X-CSE-ConnectionGUID: 9ewZp7rSStmt40Zw1QCAUw==
X-CSE-MsgGUID: WHJAUqOgQvCkd+rNpCSOjA==
Authentication-Results: mail-edgeBI124.fraunhofer.de; dkim=pass (signature verified) header.i=@fraunhofer.onmicrosoft.com
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2H9BAAIojFp/x0BYJlaHgEBCxIMhFBAAYIvszuCUANXD?=
 =?us-ascii?q?wEBAQEBAQEBAQgBUQQBAQMEhQACjGgnOBMBAQEBAwEBAQEBAgUBAQEBAQEBA?=
 =?us-ascii?q?QEBAQsBAQYBAgEBAQQIAQKBHYYJRg2CW4EsgSYBAQEBAQEBAQEBAQEdAjVWB?=
 =?us-ascii?q?jIBDQEBNwEPC0YxJQYOBYMCgiUEEgM2tC2BAYIMAQEG2ywYY4FkCQkBgUGDf?=
 =?us-ascii?q?IFygmUBhH1xhHg2gVVEgRU1gnU+hFg4hXeDNJlZSAp4HANZLAFVEw0KCwcFg?=
 =?us-ascii?q?SBDAzUMCyoVIw88BS0dgSMhHRcTYD0XQINJGAZnDwaBERlJAgICBQJAOoFmB?=
 =?us-ascii?q?hwGHBICAwECAjpVDIF3AgIEghV9ggoPiAKBCAUueycDCxgNSBEsNxQbRG4Hl?=
 =?us-ascii?q?B1PnHoBr2s0B4I4gWeBXgYMn2caM4NxAZNukwuZBqM8hVkCBAIEBQIQCIF/g?=
 =?us-ascii?q?X8zGiSDNlIZD44hPoNCvEt3AjoCBwsBAQMJkh6BSwEB?=
IronPort-PHdr: A9a23:4EwmwBFbKnmNr7cT8RmmWZ1Gf9VIhN3EVzX9CrIZgr5DOp6u447ld
 BSGo6k20BmRBc6Gu60My7KP9fy7AipYutfJmUtBWaIPfidNsd8RkQ0kDZzNImzAB9muQgoEW
 e9vbxtbxUy9KlVfA83kZlff8TWY5D8WHQjjZ0IufrymUoHdgN6q2O+s5pbdfxtHhCanYbN1M
 R66sRjdutMZjIZsJas90AfFrmdHd+lWxm5lJ0+YkxLg6sut5pJu/Cpdtvw7+8JcX6j2erkzQ
 KBFAjghL20668rnuAXZQwCS/HUcSGIWkhRJAwjB8h73W4r6vzX5uORgxiSUJNX6Q78sVzut9
 qtmVhDmhjofOzE27G/YhMpwjLlGoB26vBxw35TUYICOO/VgeK7WYM4XSnBAXsZVUCxBH5+8Y
 o4SBOcPIepUs4/wrEYIoBCjBwejGfnvxydIiHHow6A0zuovHwLB0gMiEdIAv2jbo9ruOacOU
 u241rXEwC/fY/9K3zr29YjGcgomofGJRb99bczRxlQ1FwzblFqQspHuMTaS1uQXqGeQ8u1tW
 vipi2E6sQF+vCKgxtw2honKgYIV0EvL+D5jz4Y0Pt23VlJ0bcSqEJtKrS6aKo12QsMlQ2Fmp
 ik60KcKtoOlcyUTzpks2hHQZeCdfYeS/hLjSPieIS1+hH99ZL6yhxK//FS8xuHiWce60EtGo
 zZbn9TNtX0A1BLd58mbR/dg8Umv2TeC2Q7X5+9KLk44i67WJ4Mhz7IsiJcerELOFTL1lkXul
 KKaa0Up9+ay5+njY7jqvIKQO5Vqhgz6KqgihM2yDfg2PwULQmSX5f6z2bzm8ELiXblGkvg7n
 6bXvZ3fIMkWpqi0CBJP3Ik58RawFTKm3cwdnXkAMV1KZgqKj5PsO1HSOPD4Cuq/g0i0nDdr2
 f/GOrrhD43ILnfZkbfhea9x60tAyAUpyN5S+4xYB7UbLPL9QE/+rsHYDhk5MwyzzeboFs992
 pkDVm2RGqOZMaXSvkGU5u83PuWBZIEYtCz5JvUk/fLikGU1lUEZcKWx2JsYcnG4HvBoI0WDZ
 nrsh88MHn0MvgUjVuzllkeNUSVJa3axWKI8/Co0BZm8AofCXYCinqCO0D21Hp1MfG9GF1aME
 Xfvd4WKRfgMcjieLdJ/nTAcT7iuV5ch1Q2ytA/907dnNPfU+jYEtZ762th14PfTmQg29Tx1C
 cSdzm6MQnpqnmMHWTA2xrpzoU9jxVeZ16h3nfhYGcZU5/NTXQc2LYTcwPBiC9DuRgLBec+ES
 VehQtWgDjE9VNYxw94VbkZmGtWigBHD3zS0DLMPi7OLA5k0/rrG33ftP8Z912rG1K45glk4W
 cRAL3aphq1l+AXIHI7Jjl6ZmLiweasA3S/B7H2DwnaWvEFETA5wVr3IXWsFaUvTrNT5+kTCT
 7uwCbs9NAtO18iCJ7BFat3uilVGS/PjN8rEb22tnGewAA6ExqmQY4ryZ2UdwCLdBVAYkwAc+
 XaHOhMzBiOgo2LYETxuCUjvY0Tq8el/p3K3VFI7wB+SY017y7W14gIVheCbS/4LxLIEvzwuq
 zVvEVa+wd3WEdyAqBRlfKlGZtM9+lhH2XrDtwNhJpygM7xihlkGfgRsv0Puyg94CoVbnMgps
 nwq1gxyJryc0F9bcDOYx5/wNqXNKmbu5BCvd7LW2lbG3deZ+aoC6e81q1b9swGzEEot7XFn3
 8NS03uG6ZWZRDYVBMb9X1gx6hx+5L3XaDQyoZnVy3p3MK+/9DTF3voqCfEjxxLmeM1QZvCqD
 gj3RuQcC9KjIfdiuF+zZFpQNeZe7qM9JIWlcOGM8KeqJ+tr2jy8hHlB4Idz31jK+ycqGb2A5
 IoM3/zNhljPbDz7llr06qgf5KhaMGhBVmPq0zPtQZVRb/cvI9VDAjK0Lsm+1thywITgX3dI+
 VLwYjFO1JqnYxOPaVz60wBKk0MRpH2sgyyjyDJo1Touq/nXx3nVzuDvfwYAIDQOSnNrkFHsJ
 oa5lZUdWk2pZBIujxyr+QPxwK0IwcY3Lzz9W0BNLQT/M2wwaba6tLeJf5xq5YgzuCpaFcWQM
 3udTKLwpQdf7zL7Ejl75RUWMg+noI74mBoouCe4FzNevHHZcMd/yFLk6drQSOR48hEGSSJ72
 ly1TlK8auON2M+VirzKvvu4dX6Ob6x+Kgn58NKerhuA+3NMKkWUhPCOg9zpMw4x3TCuhLwIH
 S+dpjLySY+3yL6qE7tJR29oFk782exWHN1hzJMQgIEb5F0Gi5ar5WcXnV6pbvxp6KXjMidKG
 jo6zdiE7A/78UZMD0m2mJ6gc1OE/+BRX8SYJX4dwAsFwvx1JIy2sJh4gylJsnO9vBj+bvJ9v
 AYk4OcVx10nk70svE0IywWUDZYsL1ZBIADQrBGG98Dkt4cHVUT/bqKzl1pDhvGxC6O9hjNRA
 iy6eakfBihU5PlWZQGEwDjy8IbiYN7KcZcJuwaJlwuVl+FOM8FZfpsigCNmPSfwsXIo4c9i1
 0Ao04uzoY6HLGtg5uS1D00QOj70YpYL8yr2xeZFn8mQ1pyyBJgpBDgRXZXpQP7pWDIfvPjqL
 UCPRRUysH6GH7rYEwKFrkBgqnPECZewMH+LYnIeyL1f
X-Talos-CUID: 9a23:VqohlWAp1tloxOz6E3hq63wMRdoeSWHY0CuIEVDhME1AdaLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AhlIDtg22KLmfYEZTTmFdIMfiMDUj3ISMIX0Utpo?=
 =?us-ascii?q?/peKHOW9qHS+2txO1a9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.20,249,1758578400"; 
   d="scan'208";a="14520165"
Received: from mail-mtaka29.fraunhofer.de ([153.96.1.29])
  by mail-edgeBI124.fraunhofer.de with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Dec 2025 16:02:48 +0100
X-CSE-ConnectionGUID: 5JIY7LNNTni3WOscgXzeQw==
X-CSE-MsgGUID: JJacJJvFS2emq6E+yYhu/Q==
IronPort-SDR: 6931a296_meMIGFhId/yTUW65uZdBTsxH5O3xhvNQZRyusjQ9SKSe4lp
 Sh9LcChJuNY6nLhWUJhVtZAAE7P1BxgC3L0na3g==
X-IPAS-Result: =?us-ascii?q?A0BFBQChRJ5o/3+zYZlaHgE8DAILOoEugW5SQAGBG4EJi?=
 =?us-ascii?q?CEBAYUspWiCUANXDwEDAQEBAQEIAVEEAQGFBwKMJCc3Bg4BAgEBAgEBAQEDA?=
 =?us-ascii?q?gMBAQEBAQEBAQEBAQsBAQUBAQECAQEGBYEOE4ZPDYZbAgEDEiABDQEBNwEPC?=
 =?us-ascii?q?0YxJQYOBSKCYIIkBBIDMgICAqUEAYFAAoxXgQGCDAEBBgQE2yEYY4FkCQkBg?=
 =?us-ascii?q?T+DfYFwgmQBhHxwhHc2gVVEgRU1gnU+hRCFd4M8mjtICngcA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBIEMDNQwLLhUjDzwFLR2BJ32EG4QoK0+CInWBd0EZP4NTHgZrDwaBFRkeL?=
 =?us-ascii?q?QICAgUCQz6BXRcGHgYgEgICAgICgQNAAwsYDUgRLDcUG0RuB5M2nXIBr2s0B?=
 =?us-ascii?q?4I4gWeBXgYMn2caM4NxAZNukwuZBqM8hVoCBAIEBQIQAQEGgX4mgVkzGiSDN?=
 =?us-ascii?q?k8DGQ+OX4NCsyBEMwI6AgcLAQEDCZNnAQE?=
IronPort-PHdr: A9a23:LvaAfBwJM4dOl6XXCzKQy1BlVkEcU8jcIFtMudIu3qhVe+G4/524Y
 RKMrf44llLNVJXW57Vehu7fo63sCgliqZrUvmoLbZpMUBEIk4MRmQkhC9SCEkr1MLjhaClpV
 N8XT1Jh8nqnNlIPXcjkbkDUonq84CRXHRP6NAFvIf/yFJKXhMOyhIXQs52GTR9PgWiRaK9/f
 i6rpwfcvdVEpIZ5Ma8+x17ojiljfOJKyGV0YG6Chxuuw+aV0dtd/j5LuvUnpf4FdJ6/UrQzT
 bVeAzljCG0z6MDxnDXoTQaE5Sh5MC0ckk9yJy3f7QzRV5vqtAnmmdNM9XK6L/CnU6oEYiq8y
 YwzYwTotT4GORw/+23I358V7upR9RiFqTd5n5HOcKPMGsNYfrHMfeE8aWwdQZhJdyhRCb6Zc
 4YMMfIcLeph9dbUlWoJsEXjQlaoNe3pmzNPmFb98owB7Ls9SCTgxTELL+oTkjPJp8/cDIoub
 sye7vXs8SvBU+N/3Cbnx4fCcjIQmNiQZp1TTNqN7E1oMgblh1q2l776Ji656t8IvXCLtfFCB
 dON23E9qEJhnyOO1sA+ta37i9hPiVP6yD5+5IwJDIjrAF4+YMSjFoNXrT3fLYZtX8c+Fnlho
 z1polVnkZuyfSxPzYgu5DeFOrqJaYGV5BLkWuuLZzt11zppe7O60g676lPoivb9Wc+9zEtQo
 2Jbn8PNuHEA212b6sWORvZnuEb08TiV3h3V6uZKLFpykqzeKpU7xaU3mIZVukPGdhI=
IronPort-Data: A9a23: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
 N0XgLDO1Q2mNdicTSjB3Q==
IronPort-HdrOrdr: A9a23:qfB596xRM5daXJPw8Lm+KrPx1uskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9xYgBcpTnkAsW9qBznhP1ICOUqTMyftWrdyRGVxf9ZnO7fKlTbckWQmI5gPM
 9bAtBD4fLLfD9HZK3BkWuF+rgbsb262ZHtr/zfwh5WPGdXguxbnnJEIzfeNnczaBhNBJI/Gp
 bZzs1bpwC4cXBSSsigHHEKU8XKutWOzfvdEGk7Li9izDPLoSKj6bb8HRTd9hACUwlXybNn1W
 TeiQT26oiqrvn+4B7B0G346YhQhbLau69+Lf3JrvJQBiTniw6uaogkc7qevAotqOXq01oumM
 mkmWZRAywmgUmxQkiF5T/WnyXw2jcn7HHvjXWCh2H4nMD/TDUmT+JcmINwaHLimgcdleA59J
 gO83OStpJRAx+Ftj/6/cL0WxZjkVfxiWY+kNQUk2dUXeIlGfNsRLQkjQxo+ao7bWnHAcEcYa
 FT5fjnlb9rmIahHjrkVmoG+q3cYp18JGbJfqE4gL3q79FnpgEH86Im/r1iop4hzuNPd3AW3Z
 W3Dk0vrsA5cuYmKZ97BOppe7rPNlDw
X-Talos-CUID: =?us-ascii?q?9a23=3Akx0xXGpbX3dSfBNIhkWOZq7mUZ0HU0yC6FH2H0m?=
 =?us-ascii?q?5UllOU7aaeU2dwbwxxg=3D=3D?=
X-Talos-MUID: 9a23:LbnajgjxaJtdlMFg1CNkCcMpFuVh6IaMFm42y5gDopepdj1BOyratWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.17,290,1747692000"; 
   d="scan'208";a="46761767"
Received: from exo-hybrid-bi.ads.fraunhofer.de (HELO smtp.exch.fraunhofer.de) ([153.97.179.127])
  by mail-mtaKA29.fraunhofer.de with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 16:02:45 +0100
Received: from XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) by
 XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 16:02:39 +0100
Received: from BEUP281CU002.outbound.protection.outlook.com (40.93.77.7) by
 XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 16:02:39 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVhO06SJEDCwChsUqtl2YpvTZTDuvulS+VfDHpuA6Bzg7uez1JbaYyFl3sumUhVuck0N0fSuMpb5JGzdOWoOqYY+gLz30Msr+lZ0aIoXUYCU9wKwdzVbUCSxxN+bunNLlpFRSqt+bACHm8OGjDWIeMx09qn6+aMBPB0Aqbv0YxpX89d/xdKJPwxPJ63KIBcbOCOedbFjDE9ktKohOOrFU6zqsAeLJMs7xoMQkSKwCmXzkQGROKZpE8gsxptLUhCez05HAY45eT40qqXtcTRpdC6H+Vp+e7N3Uj4lpxeQY4uQuNf3UOL/u0jym5/X7lT1AOCjqOFsvR/9xvkpqgarhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
 b=dYnO3dvOrwc3rLUQUE6Nno29jfC+cZXfA5pNnyBhVfCypJyepELjNSe44qc6xMpoZ4dM+GCZ33VCw3QMk/8/9b+MJ6KI2ftyJE8HWkWSxMwb4N5kK8fcj+r6GOQ6LY/nKet2NwqsOV9VjY1ibbBGXEAYqycfM0hdO3NPuShM6jQkCYWuG829C3tAyp8ajUwr4MxbRUGYxWbNjKcdYawtkMSGaF15OXs0W6kPGE6YBR+R5Hf99RWvzdE1A+g6Qcycm1RL10JAOTs/25VMwSeb+CXbbSKotEbS4YxloE5z/WONoBdVqnfT2K9ZtNWQcucxZpErUlh4LjUI/9GvJtH3YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aisec.fraunhofer.de; dmarc=pass action=none
 header.from=aisec.fraunhofer.de; dkim=pass header.d=aisec.fraunhofer.de;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fraunhofer.onmicrosoft.com; s=selector2-fraunhofer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLMriuCadsnJtGQYE3HzU9vrXSvvNC0CshUqifJncdw=;
 b=bLfCn4wrxJ1FQNhzyhZNDn4w6pHlxcUMtekVpuxdQ27AZYou65/7lYfn9dovAcGISW7t1MNqUCXPuJ/ucrAPETWDCJ4LTvjTxAmyrGgbhJYQAtSGKUx4Ml/MmHagNVZwquDTSmfpx2sJ8YJ8wrk+xUsIxozWLZe22+kVUsoLbTA=
Received: from BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:43::5) by
 BEZP281MB1831.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:5f::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Thu, 4 Dec 2025 15:02:38 +0000
Received: from BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ae34:1ec2:9d34:a9fb]) by BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 ([fe80::ae34:1ec2:9d34:a9fb%5]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 15:02:38 +0000
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
Subject: Re: [PATCH v23 22/28] riscv: enable kernel access to shadow stack memory via FWFT sbi call
Date: Thu,  4 Dec 2025 16:02:31 +0100
Message-ID: <20251204150231.14633-1-andreas.korb@aisec.fraunhofer.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112-v5_user_cfi_series-v23-22-b55691eacf4f@rivosinc.com>
References: <20251112-v5_user_cfi_series-v23-22-b55691eacf4f@rivosinc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::12) To BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:43::5)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB2435:EE_|BEZP281MB1831:EE_
X-MS-Office365-Filtering-Correlation-Id: 54c7f1b6-1825-464f-221d-08de33462a67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Yel/hJRnc1CFwesVLiZqD7zbzF1dw2qhpd6UAjYLNHX9aG1EB+pleVzcxksm?=
 =?us-ascii?Q?Fu3lcRdIwJjDZ9N06c4Z2O6lbsUXmEtck7tvrROsyIHos+HZiFY8TfpRtsgS?=
 =?us-ascii?Q?ksgp0OJYvJgPlSg53AQaR0BoCMQ9jEpIFX5omukBSR+zBbaT7kqoPKyLw3E7?=
 =?us-ascii?Q?UYdCuN1HRIM5pvuOcXo1MRWQoXZHG3bVLVR+B7NzUaFUnftL64mllVOFocji?=
 =?us-ascii?Q?7ZgQH2oeKUPzreaZ59OKyVFBtrPUJg6LosfdLFcpFCrb/FVuJMqFXhUwYxSv?=
 =?us-ascii?Q?YUGisLm9GvmIKL+9RPoGozFe9JJBUJL+mrLEgHFNjnyqaOA+WPuR37YVHGPN?=
 =?us-ascii?Q?apHi/sw0oJiX/3H1xu2kEUI/fhlCksKHW+NBSIafjok412bFEJMADdyu2qbV?=
 =?us-ascii?Q?u1CtZl1PgOEb/7JrlvL7NQ8mq61x/pZX1qxrTKxHo3I8hIq9kUpLNTSZQpMr?=
 =?us-ascii?Q?8/Ynwn80LXDTD6zAzrtx6SPtijIZlJ4vQtERXy24kul9h0PQ3DYPj/YzdBkY?=
 =?us-ascii?Q?TF/Mm9I1jHBKqIIkIN0D4hjNPRs1PpkPOr0SKP02aWVuYCylT4v9QLZOM9EI?=
 =?us-ascii?Q?qpwltvkADRfC0T8zYcrTA13/SXPB97w8ceZ//ZiwtdBwTVCBY7PUv1il0fGR?=
 =?us-ascii?Q?giIPvFZlbyJpk9utuZjAKPQVUNz3oW2HgRdCJvx/Ab5xuvFoCExHd2SbTHng?=
 =?us-ascii?Q?pqfnA0Qjyfk+FNfu3O1IxmfTiDqaEmW45/vx8pZHtz4K7TlBlj3dmauXzcnC?=
 =?us-ascii?Q?soT7+PFRnvQl9JSM+/UWz6vYfsosCUoRJECRfAM1e3JZzLQG7zD4Tfz5nEg6?=
 =?us-ascii?Q?Ola8+uoQkB1e2LrsQD7xJwVAe3hSs0Ytv+OxjRVOLZ74p3ILJOGR1EbiaLrn?=
 =?us-ascii?Q?hksMke+6wAImcDXfzwiRNiHxUMPwYs/lOuxSv4sfOTjRKRf//3Yos8X7jRAU?=
 =?us-ascii?Q?ymFp/3KHhVl4sAL0rbbZPYfpWoJJtBv2SCBoBUaw+DHYH8ryQVUoi1irVnL8?=
 =?us-ascii?Q?qYpvcpQKJiVXUWBpz/0skTbhxPXHxmSJPYOb8ZFv46V6jg5QtbsZbhqwfeEi?=
 =?us-ascii?Q?VExNjLcz8KyHkOfNqRAmyASdVDWEiN0DXcwU41SorR83zQHmTtHITwOfj35t?=
 =?us-ascii?Q?IPqYgPtGN+cDZ31ndFY7rIFnGabBsXTcP6tDK+90EgHQpr2ibHIj1HXjxaqU?=
 =?us-ascii?Q?OT8Fd9LNV6aK1w3jI+tbAbOgWfEaNag6Beiiwn5c5c9rqAVFwuF0QlfWptuW?=
 =?us-ascii?Q?FuSvrIaTIHXq9JcPqyVipWpoOYZ6OJyw5fsMPoUVoBdvrwJr8WJrZ8xvlF4N?=
 =?us-ascii?Q?IK24iHKTmYuTVGUT7WxRonmD+h+80Yy9CoQJUNxigaZEjQmN5X6nINHFm7OM?=
 =?us-ascii?Q?UjaHhg9ODjfgb/ZFF8F4pqvERrxgRAOGvuLmBDnMTLs4j8FCORqcNleReLPB?=
 =?us-ascii?Q?JGuBqp78PUxeuJtAZnYPhdov1P8s3WKK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4MB/pw4br6px7ogt7B5/8/7J+Lb/QmuwI2CVVF5ESs1mMjTotOcIb85zBgSY?=
 =?us-ascii?Q?GTYg6EsGAPBP2yG6yZXQAv3QLoJaJL8iCZE3Iqaz1fPrqJ3E/U9rK16CDCFJ?=
 =?us-ascii?Q?+vq0HMfWwBQkHs+ZQFszShE8hwAyMqeTDB380PTq0dH9yGYtX6Z2pL9TeISR?=
 =?us-ascii?Q?X8/ohfCRGLMBcZH2xdtsYlqiVrPaqFufMP0IQsmmIWcRTaNtckHrpp3RVBCb?=
 =?us-ascii?Q?JZPWVs7v7hlApRA/jMttykhA08ooSAR1lbeiu4xAshdXzDwdiwcdo0QMFh8D?=
 =?us-ascii?Q?Mizcoqnk/5Ja8MpxrmINfylpuZie/Et8XfaDCFfYaQ93dKVnNyqL7LLmz4my?=
 =?us-ascii?Q?FRgrj8wNr337SxoGuCvFzQ9qADQbVUZpvpaYAJI6Q6KbkPHAdCRMdyAza+ef?=
 =?us-ascii?Q?u0CDsfrQyXIOnRG/G/2YN9ufOOaRieBbYX134haiCvyHpcyLwfAXBHoV9Yxl?=
 =?us-ascii?Q?mxW0fLBdbQBjvRIt90k9G0Jzoq0kslXiVjUkY3WveXld+xtfZDoxMxM3Ob8L?=
 =?us-ascii?Q?45uJpuj0YdhtYyE1CulLj/AUKyDw5knEHBui+gd3k/AgqX+ac9xBJ0POXL4i?=
 =?us-ascii?Q?JJZmjTK2TF9WAE87qJdhrY+3uVhzxTX7gO8xUSXork1i6pYvUuhvOz1iZzHD?=
 =?us-ascii?Q?j5mINm0Wxg+l8FbIlHArA5/lJnTvmCNwoApruTY6C9Wmlz2Qc9ZAhHu32FZ1?=
 =?us-ascii?Q?4qMqDpblsFHFW8c9Pe3LL7ke50aF5E4Bixp9fcHWsoX1zHst4xkaIqBDnHb6?=
 =?us-ascii?Q?NnJ7xuQqza3N7zOG1qAjowzFPx6PLJcZXkKAn7Rk2d5Wdsu0N4pcqLtXB3C/?=
 =?us-ascii?Q?gWvm71HTG9mlgvhbcm7f0oegNc39pnGW2QS4FSDGva4OX5vXEka0lXl5AW9v?=
 =?us-ascii?Q?4ZV2Lh7KMab5JtlQ9LacE6vJZPzpgTBvcgabcuZvU5TyTC+b1ET2u7GV0yjX?=
 =?us-ascii?Q?9dznHvYc3EqhLUOyLpX1ZRdkw4V7L6b9hJZH3mncG/cykMRFrzKpjh4gl3Gt?=
 =?us-ascii?Q?fTTzpqxhHFlOftT8ClPz6lFBgoc3u3pp1DlYjhesjoBsbAfeytnetstwq4Pm?=
 =?us-ascii?Q?wrvXfKwPl9Fqnyb6e1O4eLK855T/G3IuKtV8tmkAhkhbPn5ABVs3d04O8Avl?=
 =?us-ascii?Q?eL8wTRVENsmcxhvQTFLXNP3rZS+FLTEFHLoedAv8AQODkrpEKEV0SRs6s+ne?=
 =?us-ascii?Q?sgxDs+ZzsS9q3LZxmPhdTz5K+lEs80PhlBQL7CsT+6oKJ55hr3nRzOWGgGag?=
 =?us-ascii?Q?sbSBIIn03hgkqiKtI+SE+TYrDuzd8jEzcGOIavgJUZeJFDHhPV3WGIOLAw49?=
 =?us-ascii?Q?Hdvdh7x9t9xw2M2/evPGJg09ewWNxPMuayEwo7IQCVHBgK57XzeAuHz02ADZ?=
 =?us-ascii?Q?tDyFlPIcLophfEOiax9xYDCPUz4txLV9PL5y9RJmK62tUEpDtiqhajt2hCAR?=
 =?us-ascii?Q?78FmS4FWjGbbl8rvgFT9QssAe0Wf/u6A3Y++7R/PnZyVpatkTQoUK+WzKfM2?=
 =?us-ascii?Q?rPHR0a/2XsMKSB+gJz2vxGUL3DnPjXhGURsXHFn+oPTllu+W+T0Ga0LhkHCk?=
 =?us-ascii?Q?vbU6jLuAdA/UHDsjrzGSheChTQHFTQhh6gQsLvL2/TZajrJ9/7BoFDDi/tha?=
 =?us-ascii?Q?Y/AByeQT+dfWOINJ+8nL5vI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c7f1b6-1825-464f-221d-08de33462a67
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB2435.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 15:02:38.6794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f930300c-c97d-4019-be03-add650a171c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TMRlI2kKpqbl8rYjzZ5HMbcVZwfSZvNd+Ota9H0BaelYKjURQBb0jao+HyluSBM2bxsvfBSzTzEvp6yDGUxIDDfTJEdCaqmXGJ8STjJty6c2IOKMIdUnFFugfBHU+nnX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEZP281MB1831
X-OriginatorOrg: aisec.fraunhofer.de

Tested on qemu and on a custom hardware implementation of zicfiss and zicfilp in the CVA6 core

Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
