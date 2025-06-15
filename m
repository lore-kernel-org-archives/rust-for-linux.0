Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47B913D8A4
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Jun 2025 05:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749964400; cv=none; b=rE2mNn8+BxRoqMKkJzcDEKB6w5F+k5jINTiwU8PmdROf8sL3ABTB/nfXMn4adMuNgK8xjDYLUMMrW6uGIEysxzdaCzAHmLGSuGzHdVrc915PaF6gpTOhOYJmTrhJ+fk+5dcQ+ltnVHmyCuB1To/pX5Hbmxn5WDrwPfdVQThDYPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749964400; c=relaxed/simple;
	bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=RWl4j0/MDGNMAOB/nylFYNVusTYWro2f50nl15C9iKnBLFoWhX8aHBNpJVgdDUh5PcK0M0oHxd1RwPd3xIarkgfWjF3t6/9hPEYToGiJbgQdUBySdtjeHgk4ZUE5PLc2NyaT6ko5mxMRvxd0L/krnqIdaH0wUZEFdyHRhOY9S+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=KqJ3wBE7; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="KqJ3wBE7"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id CB83025DD6
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Jun 2025 07:13:08 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tUNKGfICDVaM for <rust-for-linux@vger.kernel.org>;
 Sun, 15 Jun 2025 07:13:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749964387; bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
	h=Date:To:From:Subject;
	b=KqJ3wBE7rfHd8rmT2xb7rAATNisfTfD/seZNl9jybIamj/tiChynIEVv70XXDxBPB
	 jTOAsvf1eXBUqBuD/D13GgRuu/xz5XeidiUMBHgh8Uq9szqOsWhDEusvqAtJ5ASGra
	 IazCz5JQ+SlfMNmYA+eEc4R4kZvNaWboXgrCCF1Ol0kHLPFH22IXBLBvL5px0yaQ5L
	 oUlSw/2GS/kKHUTiOtbGD+rXrvV/NO8oy5WFeU26R8yAw2p9rlt3wRgPhl9rttcRE1
	 rBHxttWqXvQlleUN4JL+j9eVkklepeTengMpULuMOxUY6n0sESnJ6OjUPL2FigrXsw
	 E0f7bdoe9Ve9g==
Message-ID: <6f78d472-613c-4618-88ab-623ed29be825@disroot.org>
Date: Sun, 15 Jun 2025 07:13:07 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: rust-for-linux@vger.kernel.org
Content-Language: en-US
From: Ivan Kuznetsov <ivan_kuznetsov@disroot.org>
Subject: subscribe
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

subscribe
