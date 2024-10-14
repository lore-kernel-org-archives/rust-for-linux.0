Received: from mail-40130.protonmail.ch (mail-40130.protonmail.ch [185.70.40.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B341AC45F
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 18:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728931322; cv=none; b=BzXCm/EYFfKhO5EYLnDai4LCTpiv/YCbad2sy9W8d6JmPgBmFaH0Z9HiQUvBuaUmYmVVHtvH0yEbVXp3I3nqzocxLuqBH4Jbo6b8Ch8UI/QJgtmy9GbcKisVWFAqjmj9w9wdGhif+ahUkx9DiFHJINtcQhAQDtG4r5t8gXo5laQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728931322; c=relaxed/simple;
	bh=quadcf+F3w95Vv4EffkoWEgj0LG46W18oiyVW2rhqjk=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=RtV9pNjM5trGP0OLKaToSMv3je6zv4hFLc3KLBXbXkvgssjmNVm602DlABScek4eM4gJYSyuCa6vOeteI9ftsiY64vQb6jVsb5XHGytx4B6c9+SNr5hb5AGngV1HNnst6pkJliyLxH3P+Xypyh+JC31dP5kaKHg0/+DH14y0T0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=MHNU0yhT; arc=none smtp.client-ip=185.70.40.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="MHNU0yhT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1728931312; x=1729190512;
	bh=quadcf+F3w95Vv4EffkoWEgj0LG46W18oiyVW2rhqjk=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=MHNU0yhTBgnxWD0TaN8vOdBPBuT+LkRSiL5Iwak08YX32VNvZEmz78w8jPnPsL1Md
	 WdRVO2a4k7F3hHqweij6kVs9/9jbigqDumJJpfkTGQayXircpQ1WptFboEE66K9YBy
	 AWgj/sEsZmCPplRZymuYGAvWChU56thciQqKN6/TiJ1y3c5Ibzff4PbLTQPqTUEmRL
	 KPaRur0pW1DqszGzVSHMf3wBqTGcCO9eNvHecA8DM572XIp0yRnaiIL8brkO+H3eCk
	 1/IYY5/rPWJcV921PJFjErPFKTkNWfb+A4tQ9Y1DLFIXnqE2ntZbNTen/gDC+WfY0t
	 toWXFJQhEuSlw==
Date: Mon, 14 Oct 2024 18:41:48 +0000
To: "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
From: td9076922@proton.me
Subject: (No Subject)
Message-ID: <PX63ViVf2lnSC9bS4VtZtbqEADDCbb_V1UOmRDdzwHRDbijkkT5TqOum2rLj4aXahhsDx5QKnunZyxFoyfyJeiCOOcDaop_W6frpyWFJffM=@proton.me>
Feedback-ID: 122800019:user:proton
X-Pm-Message-ID: 619d59198c0cec22287ad987b444ca26c1633371
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Empty Message
