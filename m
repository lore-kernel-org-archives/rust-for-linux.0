Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B0C28EA72
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 23:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768348214; cv=none; b=t2OMOWqsKlWxtj7zjxfIwul4S3pd/SWLym46AjW5awWuD7Q+edRQJKmgSixDyMseWphD+i91y93ThwY9F37m2eJqF1lLJKe59gbN0HP86ir8B6cL9nIqyusVvbYS1prg6IXasTnix4oOyVyBXkjsLHL21Q8pQDSwLZqFnx81TR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768348214; c=relaxed/simple;
	bh=4gH3OqHXRiujVd2frhAWXe/v7iYskHdc8QUneL23n78=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=lsBgHkVvCCuddwq5VVmhdg8IE9gP3vVIFge7UdKvCeA6fkenW8fH0NzuU9GRYE0Rwb1cr4yRtBF1yLcgj//vuAxOyqwPPzyLeejFCHma5ankSVMO8yzl28FisJPNsRgPivSwGem3v9yYQQ+mdH8qG/qMPUdabeu0qollBIcy2VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=caFish3e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="caFish3e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F522C116C6;
	Tue, 13 Jan 2026 23:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768348214;
	bh=4gH3OqHXRiujVd2frhAWXe/v7iYskHdc8QUneL23n78=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=caFish3etcpnX40jZaz3fgWsy6eMWdcxOj0arF9HQFYaPTS855UJ6YuK7mYLhDR6W
	 /Oxnk/rqEwcqwC9GyUKtMjcgZ/ciM/gHN5+5uEXQJ+ByYhQ4givELqrQS0hp09od85
	 7hEGgShN83FvjOnZ7v9ykSxBAEtmCufLIN+OSGgjclsLiotlheVYgEq7Sc+7sr7wVD
	 I5OgBwzeDEC5AMqi0yitbGD0ZrBz62SDBFBlx0iLs/Qik7g4VmUWHzImgMAn0O/Oo+
	 kfvIkuMd+t3m6T/OE9O7gKWPMGUCoQjRd/7YVGk734dg6/0XUBIzYZIeelzWAKDIGP
	 B92JdSZRwmjFQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 00:50:10 +0100
Message-Id: <DFNV4H6O06OJ.1KU1PGYYQ1PBU@kernel.org>
Subject: Re: [PATCH v4 0/9] gpu: nova-core: expose the logging buffers via
 debugfs
Cc: "gary@garyguo.net" <gary@garyguo.net>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "mmaurer@google.com"
 <mmaurer@google.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260113225408.671252-1-ttabi@nvidia.com>
 <DFNUAZQOJVCP.1XU9MQT44EEYP@kernel.org>
 <7951d14aa8c2aa0b55834cdaf6ddee3d30302421.camel@nvidia.com>
In-Reply-To: <7951d14aa8c2aa0b55834cdaf6ddee3d30302421.camel@nvidia.com>

On Wed Jan 14, 2026 at 12:26 AM CET, Timur Tabi wrote:
> On Wed, 2026-01-14 at 00:11 +0100, Danilo Krummrich wrote:
>> On Tue Jan 13, 2026 at 11:53 PM CET, Timur Tabi wrote:
> Sorry, I couldn't find these messages in my inbox.  I will address them i=
n v5.

Sounds good, thanks.

>> > =C2=A0 gpu: nova-core: use pin projection in method boot()
>> > =C2=A0 rust: debugfs: implement Directory trait for Dir
>> > =C2=A0 rust: debugfs: wrap Entry in an enum to prep for LookupDir
>> > =C2=A0 rust: debugfs: add LookupDir
>>=20
>> https://lore.kernel.org/all/DF18RFX3IHVP.3GYNJIYAFFJU6@kernel.org/
>>=20
>> Especially this one is a concern, I don't want to add this infrastructur=
e as a
>> workaround until we land the feature Gary works on.
>>=20
>> As mentioned in this reply, I think that debugfs_lookup() rarely is the =
correct
>> solution and more often indicates some kind of (design) issue, like it d=
oes in
>> this case.
>
> Well, I'm at a loss how to proceed, then. =C2=A0I had a global variable, =
which is the approach that
> Nouveau uses, it was recommended instead that I use debugfs_lookup().  So=
 I implemented that, but
> that is also rejected.

Yeah, the global is not a good approach for a final solution. But as tempor=
ary
workaround it's probably fine.

Maybe Gary has an alternative idea for a temporary workaround since he's wo=
rking
on the proper solution to safely access module fields.

But again, I think a simple global with a FIXME comment should be fine.

> Danilo, you are the one who has been pushing for this code.  Please note =
that the logging buffers
> can only be parsed by Nvidia employees anyway, and we can just use this p=
atchset in house to debug
> GSP-RM as needed.  So if you want to wait until Gary's work is ready (I d=
on't know anything about
> what he's doing), please let me know now and I will just keep these patch=
es internally.

I can't remember pushing for it, but I do think it would be good to land.
