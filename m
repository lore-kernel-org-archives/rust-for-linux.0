Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C086166F
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jan 2024 17:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706032535; cv=none; b=K3ttZA7jo5YHW6ZP76nqmpgEUuoit9w4thRJ6qGGHpvGrmXC2DTeIAekD1AJLEg+GQyjRW9jKiYWB699JPNYL5JLnUWwtnX4m2kBTaTrwYiERFIHxT2qcgiTklM4GYRRyX7fEKscsbIE8T7qg9otZuOZVQt23MraJg7NC4yvT0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706032535; c=relaxed/simple;
	bh=YhV3ATLKWTzWgmMgEl9O3zyM7oT/huQhqX+YcmIOIo8=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NuaxR1AQDLsVq27y7+j4284teqdBdNnnGqUTp2p9CI4VdgmcjmatNr7VTgo88omZJrmC2g0MzEGSTT7SLyydFzSlZfvT2M/7bY6jpeyVehIrA+XnHK8kiFsDSNhj9jh3ULOMEEo7XtkJP8RPI/Qlw2wMVE3RrDYwulye7jnn2r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XSAYhrGg; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XSAYhrGg"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6e0d86d4659so3180393a34.1
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Jan 2024 09:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706032533; x=1706637333; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:from:date:feedback-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fwb7i+ooPDTQo76vZIiNQkQii+dG7DgYI6aJhv485hQ=;
        b=XSAYhrGgNtmOL5KqcsAImHMwhwKBlxnh5tGtP17aVOIhRqsqhjKQdt0VLLiNKuGsBW
         ybDZ25KSj97Yz/fBVODjaGTxrlO/UrkOIi24rWCDdYLMkvbKoiXAIUOykWocbZQZz6dh
         kGuVew2ZjEAGTmfCFU6TOsZRViVaskn7bwnpbMW3F4s0F6DQlTVtai6MQrzL1J8ibE6U
         s2axfdkmlfhUhmDt23tBeRvNy6L2Nl/ZMFzuudDBZfK7vBRfN0Hrqm/k8w5pEmEDQncs
         gBzzR7VP2xKFfm/h9GwAyfzUzZu7I6nPnwfSunkTvZJDYcIojPDx3xGcwGH/STB9kEYl
         EXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706032533; x=1706637333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fwb7i+ooPDTQo76vZIiNQkQii+dG7DgYI6aJhv485hQ=;
        b=nJobiAF6O51nx1bmCXkgS/rcd63RMAofT6XpKfHgPHQvD/LJjidlJWj2N4bXM7LIY8
         WJiXtIcShT1U2/5tCmc9Zoq1+68mHXK44RQTWucCUk0IH8FyFMEUU8QtApdNmXdUC7G1
         5Vn54gcO1Br1igKNWJBHxDAYZIOkCGKUmeoH5YiQu/cBmty3uki6kJ7rdmJt7VgSedjF
         iCNfF5yRnM4ZL23vk8bhuK0RSbOojvCWM0t/fa10iaV3i6A4vONrd9Vh/v0SJBLvYiAQ
         4fcJAlBT3FV7K4320TTJOySTsCdBRlPi/kQfg6wgLIsDSXnHwXnuEbNe4G7Cj+YhnOOA
         89Hw==
X-Gm-Message-State: AOJu0Yw/fq61bHIqhy9cKbSDKl5Lpg1GXkzAnMQPUjhcnNcqEYfB5c70
	0XoN/asTKIDEH13a1tG1WrAkio4EyJ/xU84XXDefpvYbAWBiRpFh5ushSaeh
X-Google-Smtp-Source: AGHT+IG1T3Oy3NTCQYGO5bSV8rT5rgho9gnpA1vZXgyBhHrzA9NQfeaodBZUI7i/sepLQ/e/nyqqeg==
X-Received: by 2002:a9d:634e:0:b0:6dd:f011:2820 with SMTP id y14-20020a9d634e000000b006ddf0112820mr265395otk.54.1706032532725;
        Tue, 23 Jan 2024 09:55:32 -0800 (PST)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com. [66.111.4.227])
        by smtp.gmail.com with ESMTPSA id i4-20020a05622a08c400b0042a554aaa22sm312247qte.63.2024.01.23.09.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 09:55:32 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailauth.nyi.internal (Postfix) with ESMTP id D5D3427C0061;
	Tue, 23 Jan 2024 12:55:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 23 Jan 2024 12:55:31 -0500
X-ME-Sender: <xms:k_2vZYQs-kOuYQnnn7BeejTeISm_jPQ-NylsgSjD4s8tVGBIUXS2sg>
    <xme:k_2vZVyoKX-t9KDnwUl6joBKaRqB4Vk-yhJ_Few853hqV6SPv5NOUv5WplR_Mt_fd
    VJqY0zuGAETHHHEwA>
X-ME-Received: <xmr:k_2vZV2vL4bPDc1wpGwXF00XW5LVxCEIHW_qxxBpLUX_ynWslVh9qHnpauY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdekkedguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecumhhishhsihhnghcuvffquchfihgvlhguucdlfe
    dtmdenucfjughrpeffhfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepueho
    qhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtf
    frrghtthgvrhhnpedvgffgtedvleegledtheeltdeuffeuveegvdfguefhhffhtdelffeu
    jeekleetffenucffohhmrghinhepghhoohhglhgvrdgtohhmnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghu
    thhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqh
    hunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:k_2vZcCkeo7iCyA_tPHq6hbhFQUzxrKcBSPIUHCtcRvO9PX98DgJ8Q>
    <xmx:k_2vZRhqgHcQH-troLWeW5juzdKpA8uAFKgVP0XBVhjNYdVKkvdzmw>
    <xmx:k_2vZYpYBWAXF_Uic9CPxD8t9peqd_pKu8v1-T85oT0ZzKHDmJZynA>
    <xmx:k_2vZRJ7zi2RqDO41rN7maKnsApil7mJ08W6w5N10KlbrKwBzPpKaw>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Jan 2024 12:55:31 -0500 (EST)
Date: Tue, 23 Jan 2024 09:54:52 -0800
From: Boqun Feng <boqun.feng@gmail.com>
Cc: rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Open Meeting at Jan 24
Message-ID: <Za_9bJxeyW0pddKL@boqun-archlinux>
References: <CANiq72mE=-LmMg=nrMdtF6i_JUscDU6GFZgNve9xtvUs76DnwA@mail.gmail.com>
 <ZPyqLJ62B2GZg6BA@boqun-archlinux>
 <ZUk14802ZWGpR2iM@boqun-archlinux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZUk14802ZWGpR2iM@boqun-archlinux>

Hi all,

Sorry for the last minute notice, but I wasn't sure about when -rc1
would be released ;-)

As planned, we will have the Open Meeting call on this Wednesday:

	https://meet.google.com/vii-meij-xpw

Note that since US and EU are using daylight saving time right now, so
the meeting time has switched to 19:00 UTC. Come and join us! ;-)

Regards,
Boqun
