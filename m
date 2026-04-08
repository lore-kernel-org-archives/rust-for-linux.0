Received: from va-2-37.ptr.blmpb.com (va-2-37.ptr.blmpb.com [209.127.231.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CBF37C10F
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Apr 2026 16:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775667082; cv=none; b=qeTC4VMBEm8mwW1a8qCWt2FiE5GZImu9WL73BFuewzbcTZXh401rTJFKVVdKwU48FFgft5lfA2wuOceuO5/USwxs5icV9gdM5Q1XfTMM372OGgfDfsqhe1YJxIAiWqpyXxFEa21K/XdvRCtOq7/OJOZqFKS5m+/SlojcjL+B154=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775667082; c=relaxed/simple;
	bh=blA505Gw5xExP4o2dE60Qdnuq/yUOED06c+FAV6tw3A=;
	h=Subject:Mime-Version:References:Date:Message-Id:In-Reply-To:Cc:To:
	 From:Content-Type; b=ZXMnI2ezakFhpItLt4PzyO1He+FXC7uME7b/G9gvax3vW87ArQKPwL+Yt/EB0sfVo8J6c4MHTT7CGraiw4BuRq97YuFElJdmqPzg5sNDgi2hMdjlPgVWbHuwMvXBbJos5x3+iVIPLCkg+exrhEJitR6YNcx2L4sqPdeE8eqHBGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club; spf=pass smtp.mailfrom=openatom.club; dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b=yzP7dDiZ; arc=none smtp.client-ip=209.127.231.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openatom.club
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b="yzP7dDiZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=openatom-club.20200927.dkim.feishu.cn; t=1775667073;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=yfSeUrdt1rIYsbO4z+shxwyB+zZNcza8w3utBopcgs8=;
 b=yzP7dDiZWNjhBhrzX+qCyIrij+TAmdR3/cmDyM0qgAIgIDnuNwFzJJsG7iaJ+TWYz4qRv9
 HDckaoKWGl7eYory+k1NwACrUG5dyZDCpTO9/Eb1jPsyDkrGydarNlhqN3+OPj1W3tZJ1L
 x9f+b5WGS2oClRfRue27NdiT1itPYCd2W+FipSlgKXP7Z8C39AN69GAltQmemUAdOj3TTk
 uG7g8SCVWWEGrQe7gGr2DZAaO4Rcshtq7wF28t3nckMmwwrXUlNw8YDYaZzYEj1BkLbq7f
 XQ7Ci+Cq0s928QqRpVVH0Yvq3cLjPCEZ41BEEsXby1+BUhhzZ668NCAa/pO86g==
Subject: Re: [PATCH 3/4] docs/zh_CN: update rust/quick-start.rst translation
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1775619061.git.ben.guo@openatom.club> <b5e1246269848fc95d118a722fb11eee88961053.1775619061.git.ben.guo@openatom.club> <DHNQOSMQJV1A.18UJB6VG0QK70@garyguo.net>
User-Agent: Mozilla Thunderbird
Received: from [198.18.0.1] ([58.35.126.19]) by smtp.feishu.cn with ESMTPS; Thu, 09 Apr 2026 00:51:10 +0800
Autocrypt: addr=ben.guo@openatom.club; keydata= xsFNBGj68LEBEACpcIfS9hSiM+79lUDsel4UF5LEi3BDLzIC4ZS3ly3e1mfFD1mGjVUQdNzC xl0gj4vSWrD+ktgh6x7psPomA1zV6QyvFLMozezKZ9hnnVbVy64Zf/Sv9OAgekz5AQZzV+Wv 7M3SdBpyg/Vtu2sQF2Y96qFKt0JkPrCO5O+0ng3Ea1LwlbwUARjXdrReNtOQA92LEWNC/oaJ 7S2AVKcFADlkK4eakUw19bRESlpXhsrGNA/lsDJc8QaBbfachimH9FykVnkxWD/MbdwRv8ID lJUk972c5lOkvOKAtpAUW85VpiXKUnicBVUsiaPenOEOfVGI3a1lpOsy010mGTsungEg9Ke/ mDP83j98QGIGpYL2cV+E3Wb3djDuPB8uM1yCueK4Hi8r20KK21OZFl02ADdQZ70WPnU10Hbu qcPjSRqzMW3jFqxBn5tmH3z1g/PR0kkxkzeemSqFc1b4PyiCKdWe9OOJhdSMzDj8NrpnW9Z6 QoqbEBAKqBu7Z/sGc87FHOuqG5FbUsh7wIOb43/AHnW4VGuzgOi8HY/ySaZzcNm/VzYTxAcN YOoEntyZUtbKjnReVTNHnYXKYmYS5VpXrfHhcN/gaEBAJ87Jw0b+ewkX5vKZ4jGoahdDNPYN Lun5qcAK98AD/9aM8LqdpGkgIz0knkDWf+0T+3T7ITNwv6naZwARAQABzR9CZW4gR3VvIDxi ZW4uZ3VvQG9wZW5hdG9tLmNsdWI+wsGNBBMBCAA3FiEEdZAeJvbStG24c8LKe/JGqZwhR3kF Amj68LIFCQWjmoACGwMECwkIBwUVCAkKCwUWAgMBAAAKCRB78kapnCFHeRjQD/48lQIyLpTK U+I48ubHUfSPeVHEDMVOeaKcm3oh0TXTOPMhtmdkpFPor2gE0hK81yYHGlXKH1zRNq3TKab3 AauU5AnyMpJpbAJ+skDKTms5bZeYQ+vUckUKXq7Spm/wtKqmjrSA+eqoJKr9WiCnOjuoqGnx +yaQAAGr9wWfrVQCF4Fna+2CHHKODPojUGesbCW4yUJe2VPhaWaH1FonwmIPTlGszC87FBuu G6bcLdS4xLG6NQlkjtuAyPsVLYAk/GsyWRteSvewKGrOuHTGlBw+jZtGagV4A1ylraMaInMN wTq+UkbkqjzhIZIQ2W/atE0oHvAajANIf6/fc9+Z4mlTMXOnt5aKN9DQaSdf14vULxZNH8EK +y+xXkZEGW6voJ1v/b5HiLQL8hWGrx/keUqCVBnPXRM+h8PBEz1AnjWTu/oEI+eovxjHvqje FBrEsTfhjDz/gZdzY2QtY+Zj/UZX962ESbBKn5ntRZLw7+vQwfMaR7gkdXV+krc3heR0KCfH omS2jd4gtYW7k4t4bAEL8XKt18oT3HEnf5R8Cu/kkXXUq8hZY2GRf+4OAvyDkIgC6pbh/DDN pizULbvbzPIwRXG4DFGCWeRt79keLIk8DxdPRDs10Vv4jFUBCPn51DU/gBxkvkdkiXnnNbMa kkh8yJfUzpO+IvEJhhgAgTS6G87BTQRo+vCyARAAt19A98O0RDALveJDI8tEiZVnlYJlzIbW r7Hr7holO3AmkYD+2HvUC77Odgf3ksPWNcQVBzJCtZHVQTflVmYuhzD+uecf60oT3rdefkCv IUvnJ8LsXA8RBRxaJTgLLWA1PshuigNzyP1pwHpuqsZC0nGEeIq5IsG7vcTltvJRpxKJxTti xv8GNt4Tr7xEAf6irZJz2MjPK7LMcwZd39b5Gt3UHq/N2xqXveMslSCOFP58lpmfqLhJYFAY Mokq/tO2BN2KPn9f8sDeUhMe++jvCa4Lh3dmoXL555OgsHLHGwHk0bkv4G24SqthLUwvjOOZ 3/j0AApCYwBmSXL6GJxTe1O11womezvio9bjO5O/4/jFyoHaF+EE7YAOcD92KC7PWqrD8hlv zkuahL97hw6pFyrrwLpvOv3fp51H4RwXq4bPuhCfIy88GwdqJboUeGGuWqd+3bYXoJ+Kgyo3 /l5LoP9K2BA1RrpBKxUQ2rOMah+FU2rACceecitPgyxPQT+ugE7GM6wfRilhEgMRRZP7AUeu qJqble7AIRbwXMBm8Jrnh5LWl2ImgBPJdP1RqODyxiEM4Bo4vzERJkwOF51EYFeEu+uF/G4i BYMr/8Gf4cRFzRq53htuDsimGDoX11wo1E7mYIwQa62aW2O8HZBWYqY9s9YVEHxeo7qney9p W2UAEQEAAcLBfAQYAQgAJhYhBHWQHib20rRtuHPCynvyRqmcIUd5BQJo+vCzBQkFo5qAAhsM AAoJEHvyRqmcIUd51ywP/1XHkhYEUIeAQUclRYbOEqx3lQdyEHZV9eyvFIIdAZUksfebOSz6 EIROCO9gT2IISp5/RxGIXdJjkLiqYLbvVpSPrvxgOl4IYRxarnEo+Jt1Pmaq4/swnKt5lwM2 RHms8Y1oxzVN5hTlhaSfdH3+QXt+7vpaqt4Ya/I0eRUFMFWnCdWIggBTWFio+0KWv+e2XeuU JtkezHrmIlxssxtwu5fPD5bf8pMF5U8sKAr9PdewyEYjna2HGGBUSfyVhkM0CmsdmN/cNF93 vGATjZjcW7eMAUj6/0HNE+P9d+sZ/Knk1BQnQuKhNddfBhElWkOE84QzxsNyye2DArIZgEt0 4BCaeuLOQsUOGj7VmV/m6KmVhp1TEF6hzQtzNk/QomzI4XiyXx9uLaoPXNMGBKK1hBjzU+xe 64xN38PypVNP++zkmILqAVXtLMhXq+xXaZKcKk3IH88KnuonEXudJVEqWrUCwmGrzsVVS9pe 46dx06KUG+++xluU6qqk2Hc7dE1v3jSgxKF0XRl8W5/Y+D4r8Il/0088u5xJ761S2MWBZgup yF0woqQmF21O8yfFwABNTwwuNUWU5QSuvl41QaVyOQ2dtAB0oYidfNC//9/QpqpcuzPugw0n jcCJdqtYsVn915dpmOCFhY3AmSOIaI9r/uFe0rPK6TAJXmT0M2U4YZgH
Date: Thu, 9 Apr 2026 00:51:08 +0800
Message-Id: <46eb585f-4983-4821-9be8-ef57571c3516@openatom.club>
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+269d6877f+dbbc19+vger.kernel.org+ben.guo@openatom.club>
In-Reply-To: <DHNQOSMQJV1A.18UJB6VG0QK70@garyguo.net>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<rust-for-linux@vger.kernel.org>
X-Original-From: Ben Guo <ben.guo@openatom.club>
To: "Gary Guo" <gary@garyguo.net>, "Alex Shi" <alexs@kernel.org>, 
	"Yanteng Si" <si.yanteng@linux.dev>, "Dongliang Mu" <dzm91@hust.edu.cn>, 
	"Jonathan Corbet" <corbet@lwn.net>
From: "Ben Guo" <ben.guo@openatom.club>
Content-Type: text/plain; charset=UTF-8

On 4/8/26 7:33 PM, Gary Guo wrote:
> Hi Ben,
> 
> Thanks on updating the doc translation. There has been new changes to
> quick-start.rst on rust-next, could you update the translation to base on that
> please?
> 
> Thanks,
> Gary

Hi Gary, 
  

  
  

Thanks for the review. This series is based on the Chinese documentation
maintainer's tree (alexs/linux.git docs-next), which does not yet have
the latest quick-start.rst changes from the Rust-for-Linux rust-next
tree.

Would it be better to wait until those changes land in our base tree
and then resend with the updated translation? Or would you prefer a
different approach?

Thanks,
Ben
