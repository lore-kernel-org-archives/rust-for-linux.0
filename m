Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B2A5B687
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Feb 2024 09:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707210753; cv=none; b=astQQSIk+s0OBEh7wcHkJVJC9QcePDjXOI6v4ctWjkEBmY5bAtB7RjPCKlW4sYUsBxsB3EI1HC3lict00wxacrV+3g63PtBRPx1sC190oJzqNd1+T0Mj97I/DcsK6FJ1ApfySv3gH5gNoHzRf6F0Aznxw12xbn+sqjkZi5/LVmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707210753; c=relaxed/simple;
	bh=xDaMwGlRW+j1QAvV7L8Oa3wAVOGh9sbGSBsBRhxGlus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AYVMw3w2n/jtADXPdpGZ7G7XMKzd+UC0Gyj8Jomw/XpNiojlJSxN9BRexpMAOkhM4DOuFT6ZIpkFXlnAGaH2mREeuqay6w7libiogbJMdFRDaXKjiYVKYU/A46dwvzIBZtKAxzy58BR8Mw6RwoEdcw2Q8MO0Hgh0JDH/K0GlvWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=valentinobst.de; spf=pass smtp.mailfrom=valentinobst.de; dkim=pass (2048-bit key) header.d=valentinobst.de header.i=kernel@valentinobst.de header.b=tT/4lf/C; arc=none smtp.client-ip=212.227.126.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=valentinobst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valentinobst.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=valentinobst.de header.i=kernel@valentinobst.de header.b="tT/4lf/C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=valentinobst.de;
	s=s1-ionos; t=1707210744; x=1707815544; i=kernel@valentinobst.de;
	bh=xDaMwGlRW+j1QAvV7L8Oa3wAVOGh9sbGSBsBRhxGlus=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=tT/4lf/C9hYNX6BW3RE6X9GzUAKaaxapVJs3+82W/i8Yb5Ci0lIfaIQGbcX+yOPQ
	 /wTuqXwXKFHbV0RjMiS+5cBaVnTdem8ZPRbcKklbp4BDlo7izAOYwLl2zX5QAWftX
	 iqnL3/PEgg6yLIIhaO/u3kfnU8lqZgYlO9Y9cbog9rV4a1lR6SyZMrs7Vvw7clu+7
	 Wqm+5jDfnc0E17IEOjOB3zS5fS28pK8xbUavfeF8RHkVpeWu7rVMCDuUUp90sCJwO
	 eR2k2ppFggZddtV2FgcA+TSAnNSQ1Co0aaf8De/uTLORCNrDKpG4IiEIF/hpkOnWQ
	 08e7L8sp49HW9hLCQA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from archbook.speedport.ip ([91.37.179.238]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MZCvh-1rSVbS0kmP-00VAWU; Tue, 06 Feb 2024 09:28:31 +0100
From: Valentin Obst <kernel@valentinobst.de>
To: dirk.behme@de.bosch.com
Cc: ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	Valentin Obst <kernel@valentinobst.de>
Subject: Re: [PATCH] docs: rust: extend abstraction and binding documentation
Date: Tue,  6 Feb 2024 09:28:10 +0100
Message-ID: <20240206082810.17431-1-kernel@valentinobst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206065429.1933397-1-dirk.behme@de.bosch.com>
References: <20240206065429.1933397-1-dirk.behme@de.bosch.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:rOHGX1pcaon275cvKuiHrU7kBdgef6LgIAieVpG+ev0Glj1dUa6
 Zz4Ci4e9NH4V2+0FHLqEGTk27SahfAeITAjlTYkp1cdgNyQVjb0WArdO5jOdXnxLBGM7zVe
 PutSReTl9geWQ9qHrY6wmFem1zkFO9KqwzFfoGlnbGzdN5XHDD+CVZQLdK3La6KW8on/iOq
 IyvgPOHB2nT2vRdXfbQ4Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ppXAdDh9cnc=;nzsdJC4sBWRBExmtiqkXiddLpf3
 ZpRPqBbijD9t2wszLcWdJuitzTgQrWCOzbgdgMzekaFy8hOTWFXVzeVE5ejzkzhR07SJ/qB4H
 Vqs32i3OOyJGvr+jTQRfJE3nWfj0/kbyLV5UgvxFJ/ts+PoM/Zv1vf3x7vb/hWTONIQ8I+jbc
 58Zt00BD3XP96AITyQtXKmQWEQoD8nCQUspBzoBcJxH2gZZfUjWN9lqqcA2oMM9WHDdFJsFF4
 1WXmRuv7OZuzU2IiI43gcBb2GNUquykBZbwcC7U9ZoIap4bid/10H9/s8yREv6O1jgAr4mE2f
 jVglIalk5RT7rLhxivgtypE227+w9c6v9rs1MeeK9Sa2Ng27CranEttoYcBNrHvvx2+ea0XNF
 qvjxQL5a+9rL4gN4mmseIkWXzp6zZSALnRyeWnSEZLC5R1B68IrCQw2T5irVVFzkO37fATmLu
 i5dh0EM+XXYEhAx8+nUEM6HujJnKsGPhhpdiCM5sROLK+lgyWU1z/FqE8Os8yJvbarPe+bpl4
 QA1o3OD8cMC88dg29MnXkHcpAEa4SvEYZnJfpolt6jJKnrEGIaos9+r6QoDEixbWH19AJT/uB
 QW3/qYHoNjYlWHbBwXD8N4inUH4IAA5bN9ZuuytBxaevL5u3GwtNHUPp7WsbnDk/vFbvXS4d+
 5B4AfC/jBjsUT+QDa/HG+e39gk2rQ3IYUXZDx3vzIjeWdALqv0m4k96hKYYJpjJQEIY5wCVyg
 MFqyWe+lI9V2Pnh81I0Ls5tiCxWDXWtzp4TNHccpT4CPqPbruEK1a4=

+.. code-block::
+
+	                                                rust/bindings/
+                                                       (rust/helpers.c)
+
+                                                          include/ -----+ <-+
+                                                                        |   |
+         drivers/              rust/kernel/              +----------+ <-+   |
+           fs/                                           | bindgen  |       |
+          .../            +-------------------+          +----------+ --+   |
+                          |    Abstractions   |                         |   |
+       +---------+        | +------+ +------+ |          +----------+   |   |
+       | my_foo  | -----> | | foo  | | bar  | | -------> | Bindings | <-+   |
+       | driver  |  Safe  | | sub- | | sub- | |  Unsafe  |          |       |
+       +---------+        | |system| |system| |          | bindings | <-----+
+            |             | +------+ +------+ |          |  crate   |       |
+            |             |   kernel crate    |          +----------+       |
+            |             +-------------------+                             |
+            |                                                               |
+            +------------------# FORBIDDEN #--------------------------------+
+
+The main idea is to encapsulate all ``unsafe()`` handling in the abstractions reviewed
+and documented carefully. These are considered to be sound then.

Maybe reword a bit to make it smoother:

The main idea is to encapsulate all ``unsafe()`` handling in carefully
reviewed and documented abstractions. These are then considered to be
sound.

> 								  With this model
> +it is assumed that users of the abstractions ("my_foo driver") can't do anything
> +unsound if

Not sure if 'assumed' is the best word here. Isn't the soundness
of safe code implied by the soundness of the safe abstractions it is
using? In that case one could use stronger words and say, e.g.,
"... ensured that ...".

> +
> +#. the abstractions are sound
> +#. they don't use ``unsafe()``
> +
> +Bindings
> +~~~~~~~~
> +
> +By including a C header from ``include/`` into ``rust/bindings/bindings_helper.h``
> +the ``bindgen`` tool will auto-generate the bindings for the included subsystem.
> +See the ``*_generated.rs`` output files in the ``rust/bindings/`` directory.
> +
> +For parts of the C header ``bindgen`` doesn't auto generate, e.g. C ``inline``
> +functions, there is the option to add a small wrapper function to ``rust/helpers.c``
> +to make it available for the Rust side as well.
> +
> +Abstractions
> +~~~~~~~~~~~~
> +
> +Abstractions are the glue layer between the bindings and the in-kernel users. E.g.
> +the drivers or file systems written in Rust.

Wouldn't start a sentence with 'e.g.'. I'd either write it out, i.e.,
"For example,", or not start a new sentence: "... users, e.g. ...".

> 						They are located in ``rust/kernel/``
> +and are supposed to make the ``unsafe()`` access to the bindings as-safe-as-possible
> +for their users.
> +

I think one could make it more clear that users are not expected to
access the bindings directly, e.g.:

... and their role is to encapsulate the ``unsafe()`` access to the
bindings into a safe API that they expose to their users.

Note: Looks like you only sent this to Miguel and RFL list (intentional?).

	- Best Valentin
