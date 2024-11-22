Received: from mail.corporacle.pl (mail.corporacle.pl [80.211.129.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF9818C020
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Nov 2024 08:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.211.129.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732265122; cv=none; b=OqWq0BQjaN5QA6DNOMj+JbjhTLxg8hvtOEPJsfQQo0zTudEyajFGXEUCrgJ//+I9JK7fDEg1X4adhjkF7p+Mba99KZ/e+swPDK6qOfezN8o1oGXyW6pWTiYD11lUw8wI4caYh+HsdbnnJZlVUxgxOiqox7VWcClOtfyFxQXZgog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732265122; c=relaxed/simple;
	bh=3jvBg+xgGNSqfcF/OVHqLnm9UmTAlYeXKQIdcLxVgzc=;
	h=Message-ID:Date:From:To:Subject:MIME-Version:Content-Type; b=rSLJDUmzP6GZ0Rs4ZEqQndeyE3aTH7CYXA26cVp/DqRxYJhhVaIRh6vimmK5jirLaNQOcwFZXsyN4Sx8HYBqpjNIThYC+NMbzalNJC1AEVJeYZ15Nao7jbL/TZEimCIPZWeD0hmqS7W88z5ZxX/be/eHkgfmMsyxtdQEEzsXuc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=corporacle.pl; spf=pass smtp.mailfrom=corporacle.pl; dkim=pass (2048-bit key) header.d=corporacle.pl header.i=@corporacle.pl header.b=F97PHiP8; arc=none smtp.client-ip=80.211.129.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=corporacle.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=corporacle.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=corporacle.pl header.i=@corporacle.pl header.b="F97PHiP8"
Received: by mail.corporacle.pl (Postfix, from userid 1002)
	id AE41283C30; Fri, 22 Nov 2024 09:35:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=corporacle.pl;
	s=mail; t=1732264591;
	bh=3jvBg+xgGNSqfcF/OVHqLnm9UmTAlYeXKQIdcLxVgzc=;
	h=Date:From:To:Subject:From;
	b=F97PHiP85Y75AJ/orT0XK0Qp8lJIVDiDX/1xgdno8owItqPi4CRcV+0ZJTei0GeQK
	 sHXuoE6mw1UPb2BLx8u1zZEr1gH58Hi0vTkxFGTB7XdHyXphFlWKXbvu+sb81HPwCq
	 pFMpPlcb99u8qf3o10UWCRAA/wkPJgRXbSQ/eL+24odk0/6Dd1/6omh6IHC3LbHTWq
	 ydSwiQMwigsuGY6KjqhTFEuJi8qaAxomZHrD2IqMnJbWsPPYPrxqIJYKZN+EGqRwI6
	 iH9Gq14PT574ZO3zrYNNLkh4haK4QHgZufV06qE7OLTkLT/wjeq3GFhWFWQYaZt86a
	 NcLbqDxcYFCkQ==
Received: by mail.corporacle.pl for <rust-for-linux@vger.kernel.org>; Fri, 22 Nov 2024 08:35:09 GMT
Message-ID: <20241122084500-0.1.bn.1bmwo.0.fcbfeu8m9q@corporacle.pl>
Date: Fri, 22 Nov 2024 08:35:09 GMT
From: "Zuzanna Chaber" <zuzanna.chaber@corporacle.pl>
To: <rust-for-linux@vger.kernel.org>
Subject: =?UTF-8?Q?Zamro=C5=BCenie_ceny_energii?=
X-Mailer: mail.corporacle.pl
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dzie=C5=84 dobry,=20

czy planuj=C4=85 Pa=C5=84stwo optymalizacj=C4=99 koszt=C3=B3w energii ele=
ktrycznej w swojej firmie?

Chcieliby=C5=9Bmy przedstawi=C4=87 nasz=C4=85 ofert=C4=99 XPOT, kt=C3=B3r=
a mo=C5=BCe przynie=C5=9B=C4=87 znacz=C4=85ce oszcz=C4=99dno=C5=9Bci. Ju=C5=
=BC od teraz, mog=C4=85 Pa=C5=84stwo uzyska=C4=87 cen=C4=99 ni=C5=BCsz=C4=
=85 o 40,9% w stosunku do obecnej ceny ustawowej.=20

Nasza propozycja obejmuje lata 2024, 2025 i 2026, a start wsp=C3=B3=C5=82=
pracy jest mo=C5=BCliwy od zaraz. Gwarantujemy elastyczne warunki umowy (=
3-6-9-12 miesi=C4=99cy), zapewniaj=C4=85c minimum formalno=C5=9Bci.

Jeste=C5=9Bmy pionierem w sprzeda=C5=BCy energii w cenach RDN wed=C5=82ug=
 TGE dla ka=C5=BCdej grupy taryfowej. Przez ca=C5=82y okres trwania umowy=
 zapewniamy Pa=C5=84stwu dedykowanego opiekuna, a ca=C5=82y proces Zmiany=
 Sprzedawcy i wszelkie formalno=C5=9Bci realizujemy za Klient=C3=B3w. =20

Ch=C4=99tnie porozmawiam o tym, jak mo=C5=BCemy wsp=C3=B3lnie zrealizowa=C4=
=87 Pa=C5=84stwa cele energetyczne.

Prosz=C4=99 o wiadomo=C5=9B=C4=87 w przypadku zainteresowania.=20


Pozdrawiam
Zuzanna Chaber
